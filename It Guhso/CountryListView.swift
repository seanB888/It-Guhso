//
//  CountryListView.swift
//  CountryListView
//
//  Created by SEAN BLAKE on 9/5/21.
//

import SwiftUI

struct CountryListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var country: Country
    var body: some View {
        List(Country.countries) { country in
            HStack {
                Text("\(country.flag) \(country.name)")
                Spacer()
            }.contentShape(Rectangle())
                .onTapGesture {
                    self.country = country
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

