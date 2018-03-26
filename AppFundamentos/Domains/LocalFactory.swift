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

//A todo objeto que implemente mi prototipo HouseFactory voy a obligarle a que tenga una propiedad houses
//la propiedad houses va a ser un array de casas que solo va a ser de lectura

//Quiero recibir una casa y un filtro que lo que hace es comparar algo y devolver true o false
//Por lo tanto lo que deve recibir como parametro func houses(filteredBy: es una fn con paremtro de otra funcion)
protocol HouseFactory {
 
     //quiero recibir una casa y quiero devolver un booleano
    typealias HouseFilter = (House) -> Bool
    
    func house(named: String) -> House?
    
    func house(named: HouseName) -> House?

    //Safe type
    //con el typealuias recibo una casa y devuelvo un booleano y la funcion devuelve un array de casas que cumplen el filtro
    func houses(filteredBy: HouseFilter) -> [House]
}

protocol SeasonFactory {
    typealias SeasonFilter = (Season) -> Bool
    var seasons: [Season] { get }
    func seasons(filteredBy: SeasonFilter) -> [Season]
    
}


final class LocalFactory: HouseFactory, SeasonFactory {
  
    // Primeronos conformamos a los protocolos
    func house(named name: HouseName) -> House? {
        return house(named: name.rawValue)
    }
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        return Repository.local.seasons.filter(filteredBy)
    }
    
    func houses(filteredBy: HouseFilter) -> [House] {
        return Repository.local.houses.filter(filteredBy)
    }
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
   
    var seasons: [Season] {
        
        // Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Creamos las temporadas
        let firstSeason = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "17/04/2011")!)
        let secondSeason = Season(name: "Season 2", releaseDate: dateFormatter.date(from: "01/04/2012")!)
        let thirdSeason = Season(name: "Season 3", releaseDate: dateFormatter.date(from: "31/03/2013")!)
        let fourthSeason = Season(name: "Season 4", releaseDate: dateFormatter.date(from: "06/04/2014")!)
        let fifthSeason = Season(name: "Season 5", releaseDate: dateFormatter.date(from: "12/04/2015")!)
        let sixthSeason = Season(name: "Season 6", releaseDate: dateFormatter.date(from: "24/04/2016")!)
        let seventhSeason = Season(name: "Season 7", releaseDate: dateFormatter.date(from: "16/07/2017")!)
        
        // Creamos los capítulos
        let episode1x01 = Episode(title: "Winter Is Coming", number: 1, airDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        let episode1x02 = Episode(title: "The Kingsroad", number: 2, airDate: dateFormatter.date(from: "24/04/2011")!, season: firstSeason)
        let episode1x03 = Episode(title: "Lord Snow", number: 3, airDate: dateFormatter.date(from: "01/05/2011")!, season: firstSeason)
        
        // Los añadimos a la temporada
        firstSeason.add(episodes: episode1x01, episode1x02, episode1x03)
        
        // Creamos los capítulos
        let episode2x01 = Episode(title: "The North Remembers", number: 1, airDate: dateFormatter.date(from: "01/04/2012")!, season: secondSeason)
        let episode2x02 = Episode(title: "The Night Lands", number: 2, airDate: dateFormatter.date(from: "08/04/2012")!, season: secondSeason)
        
        // Los añadimos a la temporada
        secondSeason.add(episodes: episode2x01, episode2x02)
        
        // Creamos los capítulos
        let episode3x01 = Episode(title: "Valar Dohaeris", number: 1, airDate: dateFormatter.date(from: "31/03/2013")!, season: thirdSeason)
        let episode3x02 = Episode(title: "Dark Wings, Dark Words", number: 2, airDate: dateFormatter.date(from: "07/04/2013")!, season: thirdSeason)
        
        // Los añadimos a la temporada
        thirdSeason.add(episodes: episode3x01, episode3x02)
        
        // Creamos los capítulos
        let episode4x01 = Episode(title: "Two Swords", number: 1, airDate: dateFormatter.date(from: "06/04/2014")!, season: fourthSeason)
        let episode4x02 = Episode(title: "The Lion and the Rose", number: 2, airDate: dateFormatter.date(from: "13/04/2014")!, season: fourthSeason)
        
        // Los añadimos a la temporada
        fourthSeason.add(episodes: episode4x01, episode4x02)
        
        
        // Creamos los capítulos
        let episode5x01 = Episode(title: "The Wars to Come", number: 1, airDate: dateFormatter.date(from: "12/04/2015")!, season: fifthSeason)
        let episode5x02 = Episode(title: "The House of Black and White", number: 2, airDate: dateFormatter.date(from: "19/04/2015")!, season: fifthSeason)
        
        // Los añadimos a la temporada
        fifthSeason.add(episodes: episode5x01, episode5x02)
        
        // Creamos los capítulos
        let episode6x01 = Episode(title: "The Red Woman", number: 1, airDate: dateFormatter.date(from: "24/04/2016")!, season: sixthSeason)
        let episode6x02 = Episode(title: "Home", number: 2, airDate: dateFormatter.date(from: "01/05/2016")!, season: sixthSeason)
        
        // Los añadimos a la temporada
        sixthSeason.add(episodes: episode6x01, episode6x02)
        
        // Creamos los capítulos
        let episode7x01 = Episode(title: "Dragonstone", number: 1, airDate: dateFormatter.date(from: "16/07/2017")!, season: seventhSeason)
        let episode7x02 = Episode(title: "Stormborn", number: 2, airDate: dateFormatter.date(from: "23/07/2017")!, season: seventhSeason)
        
        // Los añadimos a la temporada
        seventhSeason.add(episodes: episode7x01, episode7x02)
        
        
        return [
            firstSeason, secondSeason, thirdSeason, fourthSeason,
            fifthSeason, sixthSeason, seventhSeason
        ]
    }
    
}

























