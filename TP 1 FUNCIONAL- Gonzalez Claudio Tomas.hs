data viejero = viajero{
 nombreDelViajero::string;,
 recuerdosDel Viajero::[recuerdos],
 viaje::{viaje]
}

data Recuerdo=Recuerdo{
 nombreRecuerdo::string,
 lugar::string
}

data viaje = viajeAFuturo{
 destino::string,
 transformaciones::[(viajero->viajero)],
 cantidadAniosLuz::int,
 anioDeldDestino::int}
 |
 viajeAlPasado{
 destino::string,
 transformaciones::[(viajero->viajero)],
 recuerdos::[recuerdo],
 anioDeldDestino::int
}

-- creo constantes para realizar las pruebas 
fiesta=Recuerdo {nombre="primera fiesta", lugar="facultad"}
cumpleanios={ Recuerdo nombre="cumpleanios", lugar="mi casa"}
conmemoracion={ Recuerdo nombre="reformas", lugar="mi casa"}
cumpleanios={ Recuerdo nombre="cumpleanios", lugar="mi casa"}
gonzalez= Viajero { nombre="Claudio", edad=23. recuerdos=[fiesta,cumpleanios], viajes=[]}
viajeEspacial= {destino="cuando fui al colegio por primera vez", recuerdos=[cumpleanios], anioDestino=2013}
viajeAntiguo= {destino="lejano oeste", recuerdos=[reformas], anioDestino=1912}
viajeAmbiental= {destino="cuando se reformaron boques", recuerdos=[cumpleanios], anioDestino=2030}
mundial2022= "gol de messi" "Qatar"



--Ej 2
recuerdoDeViajes viajero= (
 recuerdosDelViajero viajero, viajes viajero)
 
--ej 3
esViajeInteresante (viajeasado destino _ recuerdos _)= length recuerdos>= 5 || destino =="lejano oeste"
esViajeInteresante (viajeFuturo _ _ _ _)=True

--ej 4
recuerdosViajero (viajero _ _ recuerdos _)= recuerdos viajes (viajero _ _ _ viajes (viajero _ _ _ viajes)= viajes recuerdosYViajes viajero, viajes viajero)

anio (viajeAFuturo _ _ _ anio)=anio 
anio (viajeAPasado _ _ _ anio)=anio

viajesInteresantes viajes= map (\  (nombreDelViaje viaje , anio viajero)) (filter esViajeInteresante viajes):: viaje

--ej 5
viajesEntre viajes anioInicio anioFin = map nombreYAnio (filter (\ viaje anio viaje >= anioInicio && anio viaje <=anioFin)

--ej 6
transformaciones (viajeAlPasado _ transformaciones _ _ ) =transformaciones 
transformaciones (viajeAlFuturo _ transformaciones _ _ ) =transformaciones 
viajarA viajero viaje= foldl (\ acum transformacion-> transformacion viajero) viajero

--ej 7
estadistica condicion transformacion lista = map transformacion (filter condicion lista)
esAlFuturo (ViajeAlPasado _ _ _ _ )= False
esAlFuturo (ViajeAlFuturo _ _ _ _ )= True

