//
//  AppViewModel.swift
//  Provincias
//
//  Created by XCode on 13/12/23.
//

import Foundation

class AppViewModel: ObservableObject{
    @Published var appState = AppState()
    @Published var provinceCreationState = ProvinceCreationState()
    
    // init block
    init(){
        self.loadProvinces()
    }
    
    private func buildProvinceList(){
        appState.provinces = [
            Province(province_id: 1, name: "Albacete", population: 0.38, area: 14924, notes: ""),
            Province(province_id: 2, name: "Alicante", population: 1.97, area: 5817, notes: ""),
            Province(province_id: 3, name: "Almería", population: 0.73, area: 8775, notes: ""),
            Province(province_id: 4, name: "Álava", population: 0.33, area: 3037, notes: ""),
            Province(province_id: 5, name: "Asturias", population: 1.0, area: 10604, notes: ""),
            Province(province_id: 6, name: "Ávila", population: 0.16, area: 8050, notes: ""),
            Province(province_id: 7, name: "Badajoz", population: 0.67, area: 21766, notes: ""),
            Province(province_id: 8, name: "Baleares", population: 1.23, area: 4992, notes: ""),
            Province(province_id: 9, name: "Barcelona", population: 5.7, area: 7728, notes: ""),
            Province(province_id: 10,name: "Bizkaia",  population: 1.14, area: 2217, notes: ""),
            Province(province_id: 11, name: "Burgos", population: 0.35, area: 14292, notes: ""),
            Province(province_id: 12, name: "Cáceres", population: 0.39, area: 19868, notes: ""),
            Province(province_id: 13, name: "Cádiz",  population: 1.3, area: 7440, notes: ""),
            Province(province_id: 14, name: "Cantabria", population: 0.59, area: 5321, notes: ""),
            Province(province_id: 15, name: "Castellón", population: 0.58, area: 6636, notes: ""),
            Province(province_id: 16, name: "Ciudad Real", population: 0.49, area: 19813, notes: ""),
            Province(province_id: 17, name: "Córdoba", population: 0.78, area: 13771, notes: ""),
            Province(province_id: 18, name: "Coruña, A", population: 1.1, area: 7950, notes: ""),
            Province(province_id: 19, name: "Cuenca", population: 0.2, area: 17140, notes: ""),
            Province(province_id: 20, name: "Gipuzcoa", population: 0.71, area: 1980, notes: ""),
            Province(province_id: 21, name: "Girona", population: 0.78, area: 5910, notes: ""),
            Province(province_id: 22, name: "Granada", population: 0.93, area: 12647, notes: ""),
            Province(province_id: 23, name: "Guadalajara", population: 0.26, area: 12214, notes: ""),
            Province(province_id: 24, name: "Huelva", population: 0.53, area: 10128, notes: ""),
            Province(province_id: 25, name: "Huesca", population: 0.22, area: 15636, notes: ""),
            Province(province_id: 26, name: "Jaén", population: 0.62, area: 13496, notes: ""),
            Province(province_id: 27, name: "León", population: 0.45, area: 15581, notes: ""),
            Province(province_id: 28, name: "Lleida", population: 0.44, area: 12172, notes: ""),
            Province(province_id: 29, name: "Lugo", population: 0.32, area: 9856, notes: ""),
            Province(province_id: 30, name: "Madrid", population: 6.83, area: 8028, notes: ""),
            Province(province_id: 32, name: "Málaga", population: 1.72, area: 7306, notes: ""),
            Province(province_id: 33, name: "Murcia", population: 1.53, area: 11314, notes: ""),
            Province(province_id: 34, name: "Navarra", population: 0.66, area: 10391, notes: ""),
            Province(province_id: 35, name: "Ourense", population: 0.30, area: 7273, notes: ""),
            Province(province_id: 36, name: "Palmas, Las", population: 1.16, area: 4066, notes: ""),
            Province(province_id: 37, name: "Pontevedra", population: 0.94, area: 4495, notes: ""),
            Province(province_id: 38, name: "Rioja, La", population: 0.32, area: 5045, notes: ""),
            Province(province_id: 39, name: "Salamanca", population: 0.33, area: 12350, notes: ""),
            Province(province_id: 40, name: "Santa Cruz de Tenerife", population: 1.10, area: 3381, notes: ""),
            Province(province_id: 41, name: "Segovia", population: 0.15, area: 6921, notes: ""),
            Province(province_id: 42, name: "Sevilla", population: 1.96, area: 14036, notes: ""),
            Province(province_id: 43, name: "Soria", population: 0.09, area: 10306, notes: ""),
            Province(province_id: 44, name: "Tarragona", population: 0.83, area: 6303, notes: ""),
            Province(province_id: 45, name: "Teruel", population: 0.13, area: 14810, notes: ""),
            Province(province_id: 46, name: "Toledo", population: 0.72, area: 15370, notes: ""),
            Province(province_id: 47, name: "Valencia", population: 2.6, area: 10807, notes: ""),
            Province(province_id: 48, name: "Valladolid", population: 0.52, area: 8110, notes: ""),
            Province(province_id: 49, name: "Zamora", population: 0.17, area: 10561, notes: ""),
            Province(province_id: 50, name: "Zaragoza", population: 0.96, area: 17274, notes: ""),
            Province(province_id: 51, name: "Ceuta", population: 0.083, area: 19, notes: ""),
            Province(province_id: 52, name: "Melilla", population: 0.085, area: 13, notes: "")
        ]
    }
    
    private func loadProvinces() {
        if let data = UserDefaults.standard.data(forKey: "provinces") {
            do {
                appState.provinces = try JSONDecoder().decode([Province].self, from: data)
                if (appState.provinces.isEmpty){ self.buildProvinceList() }
            } catch {
                self.buildProvinceList()
            }
        }else{
            self.buildProvinceList()
        }
    }
    
    private func getNewId() -> Int{
        let sortedProvinces = appState.provinces.sorted(by: {$0.province_id < $1.province_id})
        return sortedProvinces.last?.province_id ?? 1
    }
    
    func saveProvinces() {
        do {
            let data = try JSONEncoder().encode(appState.provinces)
            UserDefaults.standard.set(data, forKey: "provinces")
        } catch {
            print("Error encoding provinces: \(error.localizedDescription)")
        }
    }
    
    // Province creation/modification/deletion functionality
    func clearCreationState(){
        provinceCreationState.provinceName = ""
        provinceCreationState.provincePopulation = ""
        provinceCreationState.provinceArea = ""
        provinceCreationState.provinceNotes = ""
    }
    
    func changeCreationState(newValue: Bool){
        provinceCreationState.isNewCreation = newValue
    }
    
    func addProvince(province: Province){
        let newId = getNewId()
        var newProvince = province
        newProvince.province_id = newId
        appState.provinces.append(newProvince)
        
        self.saveProvinces()
    }
    
    func updateProvince(province: Province){
        if let index = appState.provinces.firstIndex(where: { $0.province_id == province.province_id } ){
            appState.provinces[index] = province
            self.saveProvinces()
        }
    }
    
    func deleteProvince(province: Province){
        if let index = appState.provinces.firstIndex(where: { $0.name == province.name } ){
            appState.provinces.remove(at: index)
            self.saveProvinces()
        }
    }
    
    // Ui functionality
    func sortProvinces(_ criteria: String, _ order: ComparisonResult){
        switch(criteria){
        case "nombre":
            appState.provinces = appState.provinces.sorted {
                $0.name.localizedCompare($1.name) == order
            }
        case "population":
            appState.provinces = appState.provinces.sorted {
                order == .orderedAscending ? $0.population < $1.population : $0.population > $1.population
            }
        case "area":
            appState.provinces = appState.provinces.sorted {
                order == .orderedAscending ? $0.area < $1.area : $0.area > $1.area
            }
        default:
            appState.provinces = appState.provinces.sorted {
                $0.name.localizedCompare($1.name) == order
            }
        }
    }
}
