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
        
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three headed dragon")
        
        let starkWords = Words(words: "Winter is coming")
        let lannisterWords = Words(words: "Hear me roar")
        let targaryenWords = Words(words: "Fire and blood")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords, url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords, url: URL(string: "https://awoiaf.westeros.org/index.php/Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: targaryenWords, url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        
        let ned = Person(name: "Eddard", alias: "Eddard", house: starkHouse)
        let arya = Person(name: "Arya",  house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "The Kingslayer", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "The Mother of Dragons", house: targaryenHouse)
        let viserys = Person(name: "Viserys", alias: "The Beggar King", house: targaryenHouse)
        
        //Add characters to houses
        starkHouse.add(person: ned)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: jaime)
        lannisterHouse.add(person: cersei)
        targaryenHouse.add(person: dani)
        targaryenHouse.add(person: viserys)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    func house(named name: String) -> House? {
        //let house = houses.filter{ $0.name.uppercased() == name.uppercased() }
        let house = houses.first{ $0.name.uppercased() == name.uppercased() }
        return house
    }
    
    func houses(filteredBy: Filter) -> [House] {
        return houses.filter(filteredBy)
    }
    
}

























