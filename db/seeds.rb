# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

# pasa por las validaciones primero
# Pais.destroy_all

# no toma en cuenta las validaciones
# Pais.delete_all

Pais.create(nombre: 'Venezuela')
Pais.create(nombre: 'Chile')
Pais.create(nombre: 'Mexico')
Pais.create(nombre: 'Guatemala')

10.times do |i|
  Cliente.create(nombre: "user#{i}",
                 pais: Pais.all.sample)
end
