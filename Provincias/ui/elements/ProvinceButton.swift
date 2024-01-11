//
//  ProvinceButton.swift
//  Provincias
//
//  Created by XCode on 13/12/23.
//

import SwiftUI

struct ProvinceButton: View {
    var province: Province?
    var viewModel: AppViewModel?
    var onClick: () -> Void
    
    var body: some View {
        Button(
            action: onClick,
            label: {
                VStack{
                    HStack{
                        Text(province?.name ?? "MockName")//name
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.leading, 20)
                            .padding(.top, 5)
                            .padding(.bottom, 2)
                            .frame(
                                maxWidth: .infinity,
                                alignment:  .leading
                            )
                        Spacer()
                        Button(
                            action:{ viewModel?.deleteProvince(province: province!) }
                        ){ Image(systemName: "trash") }
                            .padding(.trailing, 10)
                            .padding(.top, 5)
                    }
                    HStack{
                        VStack{// Population
                            Text("Población:")
                                .fontWeight(.light)
                                .foregroundColor(.primary)
                                .padding(.leading, 20)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment:  .leading
                                )
                            Text(String(province?.population ?? 5) + " millones hab.")// Value
                                .fontWeight(.none)
                                .foregroundColor(.primary)
                                .padding(.leading, 20)
                                .padding(.bottom, 5)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment:  .leading
                                )
                        }
                        Spacer()
                        VStack{// Area
                            Text("Superfice:")
                                .fontWeight(.light)
                                .foregroundColor(.primary)
                                .padding(.trailing, 20)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment:  .leading
                                )
                            Text(String(province?.area ?? 5) + " mil Km\u{00B2}")// Value
                                .fontWeight(.none)
                                .foregroundColor(.primary)
                                .padding(.trailing, 20)
                                .padding(.bottom, 5)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment:  .leading
                                )
                        }
                    }
                }
                .background(Color.secondary.opacity(0.25))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            }
        )
        .frame(maxWidth: .infinity)
        .cornerRadius(30.0)
    }
}

struct ProvinceButton_Previews: PreviewProvider {
    static var previews: some View {
        ProvinceButton(){}
    }
}
