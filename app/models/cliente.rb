# class comment
class Cliente < ActiveRecord::Base
  belongs_to :pais

  has_many :facturas

  scope :venezuela, -> { where(pais_id: 1) }
  scope :morosos, -> { where('saldo > 5') }
  scope :con_saldo, ->(cantidad) { where('saldo > ?', cantidad) }

  # validates :nombre, presence: true,
  #                    uniqueness: true
  validates :nombre, presence: { message: '¡Debe tener un nombre!' },
                     uniqueness: { message: '¡Usuario ya existe!' }
  validates :codigo, presence: true
  validates :saldo, presence: true, numericality: true
  validates :pais, presence: true

  validate :cliente_moroso, if: :saldo

  before_validation(on: :create) do
    predeterminados
  end

  private

  def cliente_moroso
    errors.add(:saldo, 'Su saldo ha excedido el limite.') if saldo > 10_000
  end

  def predeterminados
    self.direccion = 'Ciudad' if direccion.blank?
    self.saldo = 0.00 if saldo.blank?
    self.codigo = 'CF' if codigo.blank?
  end
end
