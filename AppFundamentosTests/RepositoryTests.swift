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
    var localSeasons: [Season]!
    
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
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
    
    func testLocalRepositorySeasonsCreation() {
        let seasons = Repository.local.seasons
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 7)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHouseByCaseInsensitively(){
        let stark = Repository.local.house(named: "sTaRk")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 2 })
        XCTAssertEqual(filtered.count, 2)

    }
    
    func testLocalRepositoryReturnsHouseTypeSafe() {
        let stark = Repository.local.house(named: .stark)
        XCTAssertEqual(stark?.name, "Stark" )
    }
   
    func testLocalRepositoryReturnsSortedArrayOfSeasons() {
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testSeasonFiltering() {
        let filtered = Repository.local.seasons(filteredBy: { $0.count == 2
        })
        XCTAssertEqual(filtered.count, 6)
        
        let onlyOne = Repository.local.seasons(filteredBy: { $0.count > 2 })
        XCTAssertEqual(onlyOne.count, 1)
        
    }
    
   
}
















