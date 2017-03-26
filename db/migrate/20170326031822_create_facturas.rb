# class comment
class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.references :cliente, index: true, foreign_key: true
      t.date :fecha
      t.decimal :monto

      t.timestamps null: false
    end
  end
end
