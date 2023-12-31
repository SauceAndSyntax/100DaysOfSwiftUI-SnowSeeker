//
//  Resort.swift
//  SnowSeeker
//
//  Created by Nicolò Perino on 18.07.23.
//

import Foundation

enum Flag {
    case rectangular, square
}

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    var flagRatio:Flag {
        country == "Switzerland" ? Flag.square : Flag.rectangular
    }
    
    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
}

