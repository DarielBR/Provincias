//
//  MainScreen.swift
//  Provincias
//
//  Created by XCode on 13/12/23.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var isProvinceDetailOnShow: Bool = false
    @State private var sortingOrder: ComparisonResult = .orderedDescending
    @State private var sortingCriteria: String = "nombre"
    
    init(viewModel: AppViewModel? = nil){
        self.viewModel = viewModel ?? AppViewModel()
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Provincias")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                    .padding(.top, 30)
                Spacer()
                Picker(
                    "Sorting Criteria",
                    selection: $sortingCriteria
                ) {
                    Text("Nombre").tag("name")
                    Text("Población").tag("population")
                    Text("Superfice").tag("area")
                }
                .padding(.leading, 5)
                .padding(.top, 30)
                
                //Spacer()
                Button(
                    action:{
                        if(sortingOrder == ComparisonResult.orderedAscending){
                            sortingOrder = .orderedDescending
                        }else{
                            sortingOrder = .orderedAscending
                        }
                        viewModel.sortProvinces(sortingCriteria, sortingOrder)
                    }
                ){ Image(systemName: "arrow.up.arrow.down") }
                    .padding(.trailing, 15)
                    .padding(.top, 30)
                    .fullScreenCover(isPresented: $isProvinceDetailOnShow){
                        ProvinceDetail(
                            viewModel: viewModel
                        ){ isProvinceDetailOnShow = false }
                    }
                Button(// Province creation button
                    action:{
                        viewModel.clearCreationState()
                        viewModel.changeCreationState(newValue: true)
                        isProvinceDetailOnShow.toggle()
                    }
                ){ Image(systemName: "doc.badge.plus") }
                    .padding(.trailing, 20)
                    .padding(.leading, 5)
                    .padding(.top, 30)
                    .fullScreenCover(isPresented: $isProvinceDetailOnShow){
                        ProvinceDetail(
                            viewModel: viewModel
                        ){ isProvinceDetailOnShow = false }
                    }
            }
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.appState.provinces){province in
                        ProvinceButton(province: province, viewModel: viewModel){
                            // Set the State to modify the province
                            viewModel.provinceCreationState.provinceId = province.province_id
                            viewModel.provinceCreationState.provinceName = province.name
                            viewModel.provinceCreationState.provincePopulation = String(province.population)
                            viewModel.provinceCreationState.provinceArea = String(province.area)
                            viewModel.provinceCreationState.provinceNotes = province.notes
                            viewModel.changeCreationState(newValue: false)
                            isProvinceDetailOnShow.toggle()
                        }
                        .fullScreenCover(isPresented: $isProvinceDetailOnShow){
                            // Set the app to modify current province
                            ProvinceDetail(
                                viewModel: viewModel
                            ){ isProvinceDetailOnShow = false }
                        }
                    }
                }
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
