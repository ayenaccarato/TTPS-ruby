Comandos para la funcionalidad del proyecto

-bundle install => Se van a instalar las gemas que se utilizan en el proyecto, en el caso de que no esten instaladas

-rails db:create db:migrate db:seed => creamos y migramos la base de datos y luego agregamos unos datos para la prueba

-rails s => corremos el servidor 


-----------------------------------------------------------------------------------------------------------------------
Restricciones dependiendo del rol que se asigne al usuario

Cliente 

-Va a poder ver su perfil y modificarlo
- Puede solicitar turnos, modificarlos o cancelarlos => Tanto para modificar o cancelar el turno, debe estar en estado pendiente
    • Para solicitar un turno, se le va a pedir que se seleccione, sucursal, dia y horario de atencion, ademas un motivo por el cual se esta haciendo la solicitud
- Va a poder ver los turnos pendientes y finalizados

Personal Bancario

- Va a poder ver su perfil y modificarlo
- Puede ver la información de cualquier sucursal
- Va a poder consultar y atender turnos de la sucursal donde esta asignado
    • Agregando un resultado
- Va a poder ver un listado de los usuarios cliente 


Administrador

- Va a poder ver su perfil y modificarlo
- Gestionar todas las sucursales
    • Crearlas, modificarlas o eliminarlas
- Gestionar los horarios de atención de todas las sucursales
    • Crearlos, modificarlos o eliminarlos
- Gestionar todos los usuarios
    • Crearlos, modificarlos o eliminarlos

-----------------------------------------------------------------------------------------------------------------------
Cosas a tener en cuenta

Sucursal

Crear o modificar
- Datos que debe tener:
    • Nombre => Debe ser único
    • Dirección
    • Teléfono
    • Localidad

* No se deben dejar campos en blanco

Eliminar

- La sucursal no va a poder ser eliminada si:
    • Tiene turnos pendientes
    • Tiene personales bancarios asignados

Además se le podrán asignar horarios 


----------------------------------------------------------------------------------------------------------------------

Horario

Crear o modificar
- Datos que debe tener:
    • Día => Debe ser único
    • Hora de inicio
    • Hora de fin
    • Sucursal 
* El día debe ser único para la sucursal asignada
* La hora de inicio y fin debe tener sentido (Ej: hora inicio: 15:00 – hora fin: 13:00)

--------------------------------------------------------------------------------------------------------------------
Localidad

Crear o modificar

- Datos que debe tener:
    • Nombre => Debe ser único
    • Provincia

* El nombre debe ser único para la provincia seleccionada
* No se deben dejar campos en blanco

Eliminar

- Una localidad no se va a poder eliminar si:
    • Tiene sucursales asignadas

-------------------------------------------------------------------------------------------------------------------

Turno


Crear o modificar

- Datos que debe tener:
    • Fecha y hora
    • Motivo
    • Sucursal

* La fecha y hora para la sucursal seleccionada, debe estar dentro de los dias y horarios de atención
* Se van a poder modificar en caso de que no se haya atendido
* No se deben dejar campos en blanco

Cancelar

- Un turno puede ser cancelado si:
    • Está en estado pendiente


----------------------------------------------------------------------------------------------------------------------
Gemas utilizadas en el proyecto

Versión de ruby => 2.7.6

    • Devise 
    • Cancancan 
    • MySql
