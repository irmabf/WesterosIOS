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
    
    var starkHouse: House!
    var starkSigil: Sigil!
    var starkWords: Words!
    var ned: Person!
    var arya: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
        starkWords = Words(words: "Winter is coming")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
        ned = Person(name: "Eddard", alias: "Eddard", house: starkHouse)
        arya = Person(name: "Arya",  house: starkHouse)
        
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
}
