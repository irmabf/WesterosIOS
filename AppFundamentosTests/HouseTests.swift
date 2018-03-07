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
    
    var starkWords: Words!
    var lannisterWords: Words!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var ned: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
        starkWords = Words(words: "Winter is coming")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
        
        lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        lannisterWords = Words(words: "Here me roar")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords)
        
        ned = Person(name: "Eddard", alias: "Eddard", house: starkHouse)
        arya = Person(name: "Arya",  house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The imp", house: lannisterHouse)
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
    }
    func testHouseEquality() {
        //identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //igualdad
        let jinxedHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
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
