//
//  EpisodeTests.swift
//  AppFundamentosTests
//
//  Created by Irma Blanco on 24/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import XCTest
@testable import AppFundamentos
class EpisodeTests: XCTestCase {
    
    // Mark: - Properties
    var firstSeason: Season!
    var secondSeason: Season!
    var thirdSeason: Season!
    
    var firstEpisodeOfFirstSeason: Episode!
    var secondEpisodeOfFirstSeason: Episode!
    
    var firstEpisodeOfSecondSeason: Episode!
    var secondEpisodeOfSecondSeason: Episode!
    
    var firstEpisodeOfThirdSeason: Episode!
    var secondEpisodeOfThirdSeason: Episode!
    
    var dateFormatter: DateFormatter!
    
    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        firstSeason = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "17/04/2011")!)
        secondSeason = Season(name: "Season 2", releaseDate: dateFormatter.date(from: "01/04/2012")!)
        thirdSeason = Season(name: "Season 3", releaseDate: dateFormatter.date(from: "31/03/2013")!)
        
        firstEpisodeOfFirstSeason = Episode(title: "1", number: 1, airDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        secondEpisodeOfFirstSeason = Episode(title: "2", number: 2, airDate: dateFormatter.date(from: "24/04/2011")!, season: firstSeason)
        
        firstEpisodeOfSecondSeason = Episode(title: "1", number: 1, airDate: dateFormatter.date(from: "01/04/2012")!, season: firstSeason)
        secondEpisodeOfSecondSeason = Episode(title: "2", number: 2, airDate: dateFormatter.date(from: "08/04/2012")!, season: firstSeason)
        
        firstEpisodeOfThirdSeason = Episode(title: "1", number: 1, airDate: dateFormatter.date(from: "31/03/2013")!, season: firstSeason)
        secondEpisodeOfThirdSeason = Episode(title: "2", number: 2, airDate: dateFormatter.date(from: "07/04/2013")!, season: firstSeason)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(firstEpisodeOfFirstSeason)
        XCTAssertNotNil(secondEpisodeOfFirstSeason)
        XCTAssertNotNil(firstEpisodeOfSecondSeason)
        XCTAssertNotNil(secondEpisodeOfSecondSeason)
        XCTAssertNotNil(secondEpisodeOfThirdSeason)
        XCTAssertNotNil(firstEpisodeOfThirdSeason)
    }
    
    func testEpisodeEquality() {
        // Identidad
        XCTAssertEqual(firstEpisodeOfFirstSeason, firstEpisodeOfFirstSeason)
        
        // Igualdad
        let theFirst = Episode(title: "1", number: 1, airDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        XCTAssertEqual(firstEpisodeOfFirstSeason, theFirst)
        
        // Desigualdad
        XCTAssertNotEqual(firstEpisodeOfFirstSeason, secondEpisodeOfFirstSeason)
    }
    
    func testHashable() {
        XCTAssertNotNil(firstEpisodeOfFirstSeason.hashValue)
    }
    
    func testEpisodeComparision() {
        XCTAssertLessThan(firstEpisodeOfFirstSeason, secondEpisodeOfFirstSeason)
    }
    
    func testCustomStringConvertible() {
        XCTAssertNotNil(firstEpisodeOfFirstSeason.description)
 
    }
    
}
