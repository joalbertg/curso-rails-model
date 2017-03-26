# class comment
class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre, null: false
      t.string :codigo, default: 'CF'
      t.text :direccion
      t.decimal :saldo, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :clientes, :codigo
  end
end
