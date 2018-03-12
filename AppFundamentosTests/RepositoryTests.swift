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
    
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
     
        super.tearDown()
    }
    
   
    func testLocalRepositoryCreation() {
       let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        //testeo que houses existe
        XCTAssertNotNil(houses)
        //testeo que houses no esté vacio
        XCTAssertEqual(houses.count, 2)
    }
    
}
