//
//  HouseFactoryProtocol.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 14/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import Foundation

//A todo objeto que implemente mi prototipo HouseFactory voy a obligarle a que tenga una propiedad houses
//la propiedad houses va a ser un array de casas que solo va a ser de lectura


//Quiero recibir una casa y un filtro que lo que hace es comparar algo y devolver true o false
//Por lo tanto lo que deve recibir como parametro func houses(filteredBy: es una fn con paremtro de otra funcion)
protocol HouseFactory {
    //quiero recibir una casa y quiero devolver un booleano
    typealias Filter = (House) -> Bool
    var houses: [House]{get}
    func house(named: String) -> House?
    //con el typealuias recibo una casa y devuelvo un booleano y la funcion devuelve un array de casas que cumplen el filtro
    func houses(filteredBy: Filter ) -> [House]
}
