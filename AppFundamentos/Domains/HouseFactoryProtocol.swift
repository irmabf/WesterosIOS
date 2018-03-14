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
protocol HouseFactory {
    typealias Filter = (House) -> Bool
    var houses: [House]{get}
    func house(named: String) -> House?
    func houses(filteredBy: Filter ) -> [House]
}

