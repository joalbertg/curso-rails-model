# class comment
class Factura < ActiveRecord::Base
  belongs_to :cliente

  validates :cliente, :fecha, :monto, presence: true
  validates :monto, numericality: true

  before_validation(on: :create) do
    predeterminados
  end

  after_create :actualizar_saldo_cliente
  after_destroy :revertir_saldo_cliente

  private

  def predeterminados
    self.fecha = Date.today if fecha.blank?
    self.monto = 0.00 if monto.blank?
  end

  def actualizar_saldo_cliente
    cliente.saldo += monto
    cliente.save
  end

  def revertir_saldo_cliente
    cliente.saldo -= monto
    cliente.save
  end
end
