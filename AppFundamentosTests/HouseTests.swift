//
//  HouseTests.swift
//  AppFundamentosTests
//
//  Created by Irma Blanco on 07/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import AppFundamentos

class HouseTests: XCTestCase {
    
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
        starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords, url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        lannisterWords = Words(words: "Here me roar")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords, url: URL(string: "http://awoiaf.westeros.org/index.php/Lannister")!)
        
        targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three Headed Dragon")
        targaryenWords = Words(words: "Fire and Blood")
        targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: targaryenWords, url: URL(string: "http://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        ned = Person(name: "Eddard", alias: "Eddard", house: starkHouse)
        arya = Person(name: "Arya",  house: starkHouse)
        
        tyrion = Person(name: "Tyrion", alias: "The imp", house: lannisterHouse)
        
        jaime = Person(name: "Jaime", alias: "The Kingslayer", house: lannisterHouse)
        cersei = Person(name: "Cersei", house: lannisterHouse)
        
        dani = Person(name: "Daenerys", alias: "The Mother of Dragons", house: targaryenHouse)
        viserys = Person(name: "Viserys", alias: "The Beggar King", house: targaryenHouse)
 
 
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        
        //Given
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
  
    func testWordsExistence() {
        XCTAssertNotNil(starkWords)
        XCTAssertNotNil(lannisterWords)
    }
    func testAddPerson() {
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: ned)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        lannisterHouse.add(persons: cersei, jaime)
        XCTAssertEqual(lannisterHouse.count, 2)
        
    }
    func testHouseEquality() {
        //identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //igualdad
        let jinxedHouse = House(name: "Stark", sigil: starkSigil, words: starkWords, url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")! )
        XCTAssertEqual(starkHouse, jinxedHouse)
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
    }
    
    func testHashable() {
        //probar que house tiene el valor hashable
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
   
  
}






































