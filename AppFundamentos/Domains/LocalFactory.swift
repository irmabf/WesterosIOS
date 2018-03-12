//
//  LocalFactory.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 12/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import Foundation

//Creo la clase LocalFactory, que es la que da valor a mi variable local
//Esta clase implementa el protocolo Housefactory


final class LocalFactory: HouseFactory {
    var houses: [House] {
        //Houses creation here
        
        let starkWords = Words(words: "Winter is coming")
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
        
        let lannisterWords = Words(words: "Hear me roar")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords)
        
        
        let ned = Person(name: "Eddard", alias: "Eddard", house: starkHouse)
        let arya = Person(name: "Arya",  house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        //Add characters to houses
        starkHouse.add(person: ned)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        
        return [starkHouse, lannisterHouse]
    }
}

