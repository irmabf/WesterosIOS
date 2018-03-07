//
//  HouseTests.swift
//  AppFundamentosTests
//
//  Created by Irma Blanco on 07/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import AppFundamentos



let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")

let starkWords = Words(words: "Winter is coming")
let lannisterWords = Words(words: "Here me roar")

let starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords)

class HouseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        
        //Given
        XCTAssertNotNil(starkHouse)
      
    }
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
    }
  
    func testWordsExistence() {
        XCTAssertNotNil(starkWords)
    }
    
}
