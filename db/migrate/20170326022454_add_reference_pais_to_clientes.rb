# class comment
class AddReferencePaisToClientes < ActiveRecord::Migration
  def change
    add_reference :clientes, :pais, index: true, foreign_key: true
  end
end
