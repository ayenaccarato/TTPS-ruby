# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Locality.create( province: 0, name: "LA PLATA") 
Sucursal.create( nombre: "SUCURSAL_1", direccion: "7 y 49", tel: "4526987", locality_id: 1)
User.create( name: "Admin", email: "admin@gmail.com", password: "123456", password_confirmation: "123456", rol: 0)
User.create( name: "Personal", email: "personalBancario@gmail.com", password: "123456", password_confirmation: "123456", rol: 1, sucursals_id: 1)
User.create( name: "Cliente", email: "cliente@gmail.com", password: "123456", password_confirmation: "123456", rol: 2)
