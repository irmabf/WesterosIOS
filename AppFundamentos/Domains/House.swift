//
//  House.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 07/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit


typealias Members = Set<Person>

// Mark: - House
final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words) {
       self.name = name
        self.sigil = sigil
        self.words = words
        //Hago esto para inicializar sin ningun miembro
        _members = Members()
    }
}

extension House{
    var count: Int{
        return _members.count
    }
    
    func add(person: Person) {
        //Prevent for adding members from diferent houses to the same house
        guard person.house.name == self.name else { return }
        _members.insert(person)
        
    }
}

// Mark: - Sigil
final class Sigil {
    let image: UIImage
    let description: String
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}

final class Words {
    let words: String
    
    init(words: String) {
        self.words = words
    }
}

