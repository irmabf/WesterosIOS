//
//  Episode.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 24/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import Foundation

final class Episode {
    
    // Mark: - Properties
    let title: String
    let number: Int
    let airDate: Date
    weak var season: Season?
    
    // Mark: - Initialization
    init(title: String, number: Int, airDate: Date, season: Season) {
        self.title = title
        self.airDate = airDate
        self.season = season
        self.number = number
    }
}



// Mark: - CustomStringConvertible
extension Episode: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.string(from: airDate)
        return "\(title), season: \(season?.name ?? "") air date: \(date)"
    }
}

// Mark: - Proxy
extension Episode {
    var proxyForEquality: String {
        return "\(title) \(season?.name ?? "") \(airDate)"
    }
    
    var proxyForComparison: Date {
        return airDate
    }
}

// Mark: - Equatable
extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}
// MARK: - Hashable
extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

//MARK: - Comparable
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
