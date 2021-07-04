# README

<<<<<<< HEAD
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
Proyecto realizado en VSC usando Ruby on rails.

## Registrar candidato/compañía

``` POST /candidate/candidate_signin```

``` POST /company/company_signin ```

### Body

```
{ "name": "Nombre del candidato/compañia", "password": "Contraseña" }
```
### Respuesta exitosa

```
{ Usuario creado exitosamente }
```
### Respuesta de error

401 Unauthorized

```
{ El nombre de usuario ya existe }
```
## Ingresar

``` POST /candidate/login```

``` POST /company/login```

 Ambas rutas resultan igual de válidas tanto para candidatos como compañías.
 
 ### Body
 
 ```
 { "name": "Nombre del candidato/compañía", "password": "Contraseña" }
 ```
 ### Respuesta exitosa
 
 ```
 { "token": "token de sesión del candidato/compañía" }
 ```
 ### Respuesta de error
 
 401 Unauthorized
 
 ``` { El usuario no existe }```
 
 ``` { Contraseña incorrecta }```
 
 ## Cerrar sesión
 
 ``` POST /candidate/logout```
 
 ``` POST /company/logout```
 
 Ambas rutas resultan igual de válidas tanto para candidatos como compañías.
 
 ### Body
 
 ```
 { "token": "Token de sesión del candidato/compañía" }
 ```
 ### Respuesta exitosa
 
 ``` { Sesión cerrada }```
 
 ## Crear oferta laboral
 
 ``` POST /job_offers/create_job_offer```
 
 ### Body
 
 ```
 { "token": "Token de sesión de la compañia", 
   "name": "Nombre del trabajo", 
   "description": "Descripción del trabajo" }
 ```
 ### Respuesta exitosa
 
 ``` { Oferta laboral creada }```
 
 ## Eliminar oferta laboral
 
 ``` DELETE /job_offers/:id/delete_job_offer```
 
 ### Respuesta exitosa
 
 ``` { Oferta laboral eliminada }```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { Oferta laboral no encontrada }```
 
 ## Ver mis ofertas laborales
 
 ``` GET /job_offers/my_job_offers?token="Token de sesión de la compañia"```
 
 ### Respuesta exitosa
 
 ```
 [ { "id": "Id del trabajo",
     "name": "Nombre del trabajo", 
     "description": "Descripción del trabajo", 
     "status": "Estado de la publicación" } ]
 ```
 O
 
 ``` { Aún no tienes ofertas laborales }```
 
 ## Cerrar oferta laboral
 
 ``` POST /job_offers/:id/close_job_offer```
 
 ### Respuesta exitosa
 
 ``` { Oferta laboral cerrada }```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { Oferta laboral no encontrada }```
 
 ## Mostrar ofertas laborales
 
 ``` GET /job_offers/bring_offers?token="Token de sesión del candidato/compañía"```
 
 ### Respuesta exitosa
 
 ``` 
     [ { "id": "Id de la oferta laboral",
         "name": "Nombre de la oferta laboral",
         "description": "Descripción de la oferta laboral",
         "company_name": "Nombre de la compañía" } ]
 ```
 
 O
 
 ``` { Aún no hay ofertas laborales }```
 
 ## Mostrar postulaciones
 
 ``` GET /postulation/bring_postulations/:id?token="Token de sesión de la compañía"```
 
 ### Respuesta exitosa
 
 ``` 
     [ { "id": "Id de la postulación",
         "candidate_name": "Nombre del candidato",
         "status": "Estado de la postulación" } ]
 ```
 
 O
 
 ``` { Aún no hay postulaciones } ```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { La oferta laboral no existe }```
 
 ## Contratar postulante
 
 ``` POST /postulation/:id/hire_postulant```
 
 ### Body
 
 ``` { "token": "Token de sesión de la compañía" }```
 
 ### Respuesta exitosa
 
 ``` { Postulante contratado }```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { La postulación no existe }```
 
 401 Unauthorized
 
 ``` { La postulación no corresponde a una oferta laboral suya }```
 
 ## Rechazar postulante
 
 ``` POST /postulation/:id/reject_postulant```
 
 ### Body
 
 ``` { "token": "Token de sesión de la compañía" }```
 
 ### Respuesta exitosa
 
 ``` { Postulante rechazado }```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { La postulación no existe }```
 
 401 Unauthorized
 
 ``` { La postulación no corresponde a una oferta laboral suya }```
 
 ## Interesar postulante
 
 ``` POST /postulation/:id/interest_postulant```
 
 ### Body
 
 ``` { "token": "Token de sesión de la compañía" }```
 
 ### Respuesta exitosa
 
 ``` { Postulante interesado }```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { La postulación no existe }```
 
 401 Unauthorized
 
 ``` { La postulación no corresponde a una oferta laboral suya }```
 
 ## Postularse
 
 ``` POST /postulation/:id/postulate```
 
 ### Body
 
 ``` { "token": "Token de sesión del candidato" }```
 
 ### Respuesta exitosa
 
 ``` { Postulación creada }```
 
 ### Respuesta de error
 
 404 Not found
 
 ``` { La oferta laboral no existe }```
 
 401 Unauthorized
 
 ``` { La oferta laboral está cerrada }```
 
 O
 
 ``` { Solo puedes postularte una vez }```
 
 ## Ver mis postulaciones
 
 ``` GET /postulation/my_postulations?token="Token de sesión del candidato"```
 
 ### Respuesta exitosa
 
 ```
 [ { "id": "Id de la postulación",
     "status": "Status de la postulación",
     "job_name": "Nombre de la oferta laboral" } ]
 ```
 
 O
 
 ``` { No tienes postulaciones aún }```
>>>>>>> bc7d7201ff1841eab355594f96e1bd603cdd8dc4
