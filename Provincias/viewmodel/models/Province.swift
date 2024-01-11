//
//  Province.swift
//  Provincias
//
//  Created by XCode on 13/12/23.
//

import Foundation

struct Province: Identifiable, Codable{
    var id = UUID()
    var province_id: Int
    var name: String
    var population: Double
    var area: Double
    var notes: String
}
