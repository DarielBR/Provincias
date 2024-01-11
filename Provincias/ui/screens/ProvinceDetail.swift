//
//  ProvinceDetail.swift
//  Provincias
//
//  Created by XCode on 13/12/23.
//

import SwiftUI
import UIKit

struct ProvinceDetail: View {
    @ObservedObject var viewModel: AppViewModel
    var onClick: () -> Void
    
    init(
        viewModel: AppViewModel? = nil,
        onClick: @escaping () -> Void
    ){
        self.viewModel = viewModel ?? AppViewModel()
        self.onClick = onClick
    }
    
    var body: some View {
        VStack{
            HStack{
                Button(action: onClick){ // Button Back
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
                Spacer()
                Button(
                    action: {// Button done
                        var province = Province(
                            province_id: 0,
                            name: viewModel.provinceCreationState.provinceName,
                            population: Double(viewModel.provinceCreationState.provincePopulation) ?? 0,
                            area: Double(viewModel.provinceCreationState.provinceArea) ?? 0,
                            notes: viewModel.provinceCreationState.provinceNotes
                        )
                        if(viewModel.provinceCreationState.isNewCreation){
                            viewModel.addProvince(province: province)
                        }else{
                            province.province_id = viewModel.provinceCreationState.provinceId
                            viewModel.updateProvince(province: province)
                        }
                        viewModel.changeCreationState(newValue: false)
                        onClick()
                    }
                ){
                    HStack{
                        Text("Done")
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            VStack{// Province Name Edit Block
                Text("nombre: ")
                    .fontWeight(.light)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                TextField(
                    "nombre de la provincia",
                    text: Binding(
                        get: { viewModel.provinceCreationState.provinceName },
                        set: {newValue in
                            let filteredValue = newValue.filter { $0.isLetter || $0 == " " }
                            viewModel.provinceCreationState.provinceName = filteredValue
                        }
                    )
                )
                .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 20)
            .padding(.bottom)
            HStack{// Population and Area Edit Block
                VStack{// Population
                    Text("población: ")
                        .fontWeight(.light)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    TextField(
                        "millones de habitantes",
                        text: Binding(
                            get: { viewModel.provinceCreationState.provincePopulation },
                            set: { newValue in
                                let filteredValue = newValue.filter { $0.isNumber || $0 == "."}
                                viewModel.provinceCreationState.provincePopulation = filteredValue
                            }
                        )
                    )
                    .textFieldStyle(.roundedBorder)
                }
                .padding(.leading, 20)
                .padding(.trailing, 5)
                Spacer()
                VStack{// Area
                    Text("superficie: ")
                        .fontWeight(.light)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    TextField(
                        "Kilómetros cuadrados",
                        text: Binding(
                            get: { viewModel.provinceCreationState.provinceArea },
                            set: {newValue in
                                let filteredValue = newValue.filter{ $0.isNumber || $0.isNumber}
                                viewModel.provinceCreationState.provinceArea = filteredValue
                            }
                        )
                    )
                    .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
                .padding(.leading, 5)
            }
            VStack{// Province Notes
                Text("notas: ")
                    .fontWeight(.light)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                TextEditor(
                    text: $viewModel.provinceCreationState.provinceNotes
                )
                .border(Color.gray.opacity(0.2), width: 1)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            Spacer()
        }
        .padding(.top, 30)
    }
}

struct ProvinceDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProvinceDetail(){}
    }
}
