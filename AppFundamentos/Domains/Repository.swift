//
//  Repository.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 12/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

//Creo la final clas repository
final class Repository {
    //ahora necesito una variable, propiedad estatica local, que es la que usare para extraer los datos
    //creamos una variable estatica local del tipo, va a ser iguala  LocalFactory, clase que tenemos que crear
    
    static let local = LocalFactory()
}

//A todo objeto que implemente mi prototipo HouseFactory voy a obligarle a que tenga una propiedad houses
//la propiedad houses va a ser un array de casas que solo va a ser de lectura
protocol HouseFactory {
    var houses: [House]{get}
}


