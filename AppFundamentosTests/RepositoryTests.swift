//
//  RepositoryTests.swift
//  AppFundamentosTests
//
//  Created by Irma Blanco on 12/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import AppFundamentos
class RepositoryTests: XCTestCase {
    
      var localHouses: [House]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
    
    }
    
    override func tearDown() {
     
        super.tearDown()
    }
    
   
    func testLocalRepositoryCreation() {
       let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        
        //testeo que houses existe
        XCTAssertNotNil(localHouses)
        //testeo que houses no esté vacio
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    
    
}
