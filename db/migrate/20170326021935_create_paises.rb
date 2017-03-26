# class comment
class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
