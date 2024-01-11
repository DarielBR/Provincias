//
//  AppState.swift
//  Provincias
//
//  Created by XCode on 13/12/23.
//

import Foundation

struct AppState{
    var provinces: [Province] = []
}

struct ProvinceCreationState{
    var provinceId: Int = 0
    var provinceName: String = ""
    var provincePopulation: String = ""
    var provinceArea: String = ""
    var provinceNotes: String = ""
    var isNewCreation: Bool = false
}
