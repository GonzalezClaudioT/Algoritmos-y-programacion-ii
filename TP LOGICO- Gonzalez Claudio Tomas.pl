%beagle(nombre, altura, peso)
%cocker(nombre, peso, altura, genero)
%perro(duenio, perro, caracteristicas del perro)
perro(lucia, beagle(kongo, 20, 15), [jugueton, carinioso, tonto]).
perro(lucia, cocker(susi, 13, 38, hembra), [inteligente, bueno]).
perro(gise, cocker(polo, 20, 41, macho), [malo, inteligente]).
perro(homero,ayudanteDeSanta, [carinioso,tonto, vago]).
gato(senioraDeLosGatos, flufy).
gato(senioraDeLosGatos, michifuz).
%humano(nombre, características)
humano(homero, [tonto, vago]).
humano(lucia, [carinioso, inteligente]).
humano(gise, [inteligente, malo]).
humano(ralph, [tonto, carinioso]).

%ej1- Para poder saber si un perro cumple o no un estándar racial, necesitamos un predicado que nos ayude a saber si un perro cumple un estándar racial.Por ahora lo que nos dijeron es que:
%-Los beagles tienen que tener una altura entre 33 y 40cms
%-Los cockers una altura entre 38 y 39cm si es hembra y entre 39 y 41 si es macho. Además deben tener peso entre 13 y 15kg sin importar su género.
%-Los perros sin raza no tienen estándar racial.

estandarRacial(Nombre):- perro(_,beagle(Nombre,Altura,_),_), Altura>36.
estandarRacial(Nombre):- perro(_,_,cooker(Nombre,_,_),_).

%ej2- Ahora necesitamos obtener cada una de las características indistintamente de si es un humano o un perro.

caracteristica(Nombre):-humano(Nombre,Caracteristicas), forall(member(Caracteristica,Caracteristicas),humano(Nombre,Caracteristicas)).
caracteristica(Nombre):-perro(_,raza(Nombre,_,_),Caracteristicas), forall(member(Caracteristica,Caracteristicas),perro(_,raza(Nombre,_,_),Caracteristicas)).

%ej3-  Todos los perros se pueden enfermar antes de la competencia, pero sabemos, por estadística, que los perros de Lucía no se enferman ni tampoco aquellos que cumplan con el estándar racial. Así que debemos hacer el predicado que nos diga si un perro puede estar enfermo.

puedeEstarEnfermo(Perro):- perro(Duenio,_,raza(Perro,_,_)), not( humano(Duenio,_), member(perro(Duenio,_,raza(Perro,_,_)), (estandarRacial(Perro),Duenio is "Lucia"))).

%ej4- Hay un dicho que dice que los perros se parecen a su dueño. Veamos si podemos saber qué perros se parecen a qué humanos. Un perro se parece a un humano si todos las características que tienen un humano, las tiene ese perro.

sePareceASuDuenio(Persona,Perro):-
 humano(Persona,Caracteristicas), perro(Persona,raza(Perro_,_,_),Caracteristicas), forall(member(Caracteristica,Caracteristicas),humano(Persona,Caracteristica)).

raza(beagle(Nombre,_,_), Nombre).
raza(cooker(Nombre,_,_,_), Nombre).

%ej5-Como toda competencia tiene un ganador, queremos ver el dueño de perros que más chances tiene de ganar. Para eso, debe tener al menos 2 perros que cumplan con el estándar racial.

puedeGanar(Persona) :- humano(Persona,_), forall(perro(Persona, _,_), member(humano(Persona, _, _), Personas)).

%ej6- Queremos verificar si todos los perros de una determinada raza tienen un peso dentro de cierto rango. Implementa un predicado que verifique si todos los perros de una raza específica cumplen con esta condición.

pesaPoco( perro(_,beagle(Nombre,_,Peso),_), Peso=<50.
pesaPoco( perro(_,cocker(Nombre,Peso,_,_),_), Peso=<40.
pesaMucho( perro(_,beagle(Nombre,_,Peso),_), Peso>86.
pesaMucho( perro(_,cocker(Nombre,Peso,_,_),_), Peso>78.