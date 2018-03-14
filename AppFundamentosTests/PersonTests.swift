//
//  PersonTests.swift
//  AppFundamentosTests
//
//  Created by Irma Blanco on 07/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import AppFundamentos



//let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)

class PersonTests: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    var targaryenSigil: Sigil!
    
    var starkWords: Words!
    var lannisterWords: Words!
    var targaryenWords: Words!
    
    var starkHouse: House!
    var lannisterHouse: House!
    var targaryenHouse: House!
    
    var ned: Person!
    var arya: Person!
    var tyrion: Person!
    var cersei: Person!
    var jaime: Person!
    var dani: Person!
    var viserys: Person!
    
    override func setUp() {
        super.setUp()
        
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
        starkWords = Words(words: "Winter is coming")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
        
        lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        lannisterWords = Words(words: "Here me roar")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords)
        
        targaryenSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Three headed dragon")
        targaryenWords = Words(words: "Fire and Blood")
        targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: targaryenWords)
        
        ned = Person(name: "Eddard", alias: "Eddard", house: starkHouse)
        arya = Person(name: "Arya",  house: starkHouse)
        
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        jaime = Person(name: "Jaime", alias: "The Kingslayer", house: lannisterHouse)
        cersei = Person(name: "Cersei", house: lannisterHouse)
        
        dani = Person(name: "Daenerys", alias: "The Mother of Dragons", house: targaryenHouse)
        viserys = Person(name: "Viserys", alias: "The Beggar King", house: targaryenHouse)
        

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
     
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    
    func testFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality() {
        //Identidad
        XCTAssertEqual(ned, ned)
        //igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(tyrion, imp)
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
}
