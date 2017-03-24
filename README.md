# G4-CarmenSanDiego

(add image Carmen San Diego)

Proyecto que contiene el dominio del módulo de un juego de poli-ladron, reutilizado como componente por otras aplicaciones de UI.

(add detalles)

## Enunciado

Principalmente están los Villanos, que son quienes cometen los delitos. 
Después de trabajar durante años en Acme se logró armar una gran base de antecedentes de estos criminales.
Por cada Villano se conoce:
nombre
sexo
señas particularidades
hobbies
Por ejemplo:
    Nombre: Carmen Sandiego
    Sexo: Femenino
    Señas particulares: Pelo rojo, maneja un convertible, posee un collar de rubies, su comida favorita son los tacos mexicanos
    Hobbies: Juega Tenis
A su vez se cuenta con un mapamundi que tiene la información importante de cada país:
Nombre del país
Características del país
Lugares de interés por los criminales
Países con los que tiene conexiones aéreas

Los lugares de interés son bien conocidos por todos, en cada país hay 3 lugares que nos aseguran que si el villano estuvo en el país visitó todos.
Despues de muchas inverstigaciones se determinó que hay 4 tipos de lugares que atraen a los malechores:
Embajada: cuando tiene información del malechor da 2 pistas relacionadas con el destino del villano
Banco: cuando tiene información del malechor da una pista relacionada con el país de destino y otra con las señas particulares.
Biblioteca: cuando tiene información del malechor da una pista relacionada con el país de destino y otra con las señas particulares. Además el 50% de las veces da una pista más sobre los hobbies
Club: cuando tiene información del malechor da dos pistas sobre las señas particulares y el 70% de las veces agrega información de sus hobbies (adicional a las dos señas particulares).
En lugar hay un ocupante, que pude ser el Villano (si es su destino final), un informante (si el villano está en el país, nos da la información según la política del lugar) o un cuidador (si el villano no se encuentra en el país).
Los villanos si están en el país pero no en el lugar al que visitamos intentan matarnos y fallan.
Los cuidadores nos informan que nos hemos equivocado de país y mejor volvemos por donde vinimos.
El objetivo del juego siempre es resolver un caso. El caso tiene un responsable (villano que intentaremos capturar), un plan de escape (que es una lista de países conectados), un reporte del acto criminal, el objeto del robo, el país donde ocurrió el robo.

El juego consiste en interpretar al detective que viaja por el mundo atrapando a los malechores.

Cuando el detective inicia el caso viaja al lugar de los hechos, en ese país puede recorrer los lugares de interés del país buscando pistas sobre el responsable o el próximo destino del criminal, una vez que se siente listo realiza un viaje a alguno de los países con los que tiene conexiones aéreas su país actual, una vez que llega al lugar puede visitar lugares (como lo hizo en el primer país).

En todo momento el detective puede pedir una orden de arresto contra el criminal que cree que ha perpetrado el acto delictivo.
Cuando se llega al último país y se visita los lugares en alguno se captura al delicuente.

El detective gana el caso cuando atrapa al villano que esperaba (para el que tiene su orden de arresto).
Cuando el detective se equivoca, debe volver sobre sus pasos (es decir regresar a su país anterior) para retomar su búsqueda.