# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Locality.create( province: 0, name: "LA PLATA")
Locality.create( province: 4, name: "VILLA CARLOS PAZ")
Locality.create( province: 0, name: "ENSENADA")

Sucursal.create( nombre: "SUCURSAL_1", direccion: "7 y 49", tel: "4526987", locality_id: 1)
Sucursal.create( nombre: "CREDICOOP", direccion: "Av. Ruiz Cortines 299", tel: "4859671", locality_id: 3)
Sucursal.create( nombre: "BANCO FRANCES", direccion: "Av. San Martin 49", tel: "458960", locality_id: 2)

Horario.create( dia: 0, desde: "2000-01-01 08:00:00 UTC", hasta: "2000-01-01 13:00:00 UTC", sucursal_id: 1) #Lunes
Horario.create( dia: 2, desde: "2000-01-01 09:00:00 UTC", hasta: "2000-01-01 12:00:00 UTC", sucursal_id: 1) #Miercoles
Horario.create( dia: 4, desde: "2000-01-01 12:00:00 UTC", hasta: "2000-01-01 16:00:00 UTC", sucursal_id: 1) #Viernes
Horario.create( dia: 0, desde: "2000-01-01 09:00:00 UTC", hasta: "2000-01-01 14:00:00 UTC", sucursal_id: 2) #Lunes
Horario.create( dia: 1, desde: "2000-01-01 12:00:00 UTC", hasta: "2000-01-01 15:00:00 UTC", sucursal_id: 2) #Martes
Horario.create( dia: 3, desde: "2000-01-01 08:00:00 UTC", hasta: "2000-01-01 13:00:00 UTC", sucursal_id: 2) #Jueves
Horario.create( dia: 0, desde: "2000-01-01 12:00:00 UTC", hasta: "2000-01-01 16:00:00 UTC", sucursal_id: 3) #Lunes
Horario.create( dia: 2, desde: "2000-01-01 08:30:00 UTC", hasta: "2000-01-01 12:30:00 UTC", sucursal_id: 3) #Miercoles
Horario.create( dia: 3, desde: "2000-01-01 10:30:00 UTC", hasta: "2000-01-01 14:30:00 UTC", sucursal_id: 3) #Viernes

User.create( name: "Admin", email: "admin@gmail.com", password: "123456", password_confirmation: "123456", rol: 0)
User.create( name: "Personal", email: "personalBancario@gmail.com", password: "123456", password_confirmation: "123456", rol: 1, sucursals_id: 1)
User.create( name: "Personal_bancario2", email: "personalBancario2@gmail.com", password: "123456", password_confirmation: "123456", rol: 1, sucursals_id: 2)
User.create( name: "Personal_bancario3", email: "personalBancario3@gmail.com", password: "123456", password_confirmation: "123456", rol: 1, sucursals_id: 3)
User.create( name: "Cliente", email: "cliente@gmail.com", password: "123456", password_confirmation: "123456", rol: 2)

Turn.create( date: "20-12-2022 13:30", motive:"Préstamo", status: 0, sucursal_id: 1, user_id: 3)
Turn.create( date: "05-01-2022 09:30", motive:"Crear una cuenta", status: 0, sucursal_id: 2, user_id: 3)
Turn.create( date: "09-01-2022 14:00", motive:"Reclamo", status: 0, sucursal_id: 3, user_id: 3)
