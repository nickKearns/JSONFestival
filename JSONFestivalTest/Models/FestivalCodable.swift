//
//  FestivalCodable.swift
//  JSONFestivalTest
//
//  Created by Nicholas Kearns on 4/15/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
//struct Festivals: Codable {
//    let festivals: [Festival]
//
//    enum CodingKeys: String, CodingKey {
//        case festivals = "Festivals"
//    }
//}

struct Festivals: Codable {
    let festivals: [Festival]

    enum CodingKeys: String, CodingKey {
        case festivals = "Festivals"
    }
}

// MARK: - Festival
struct Festival: Codable {
    let date, name, city: String
    let lineup: [Lineup]
    let type: String?
}

// MARK: - Lineup
struct Lineup: Codable {
    let name, id: String
    
    
}
