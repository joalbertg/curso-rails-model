# class comment
class Pais < ActiveRecord::Base
  has_many :clientes

  validates :nombre, presence: true, uniqueness: true
end
