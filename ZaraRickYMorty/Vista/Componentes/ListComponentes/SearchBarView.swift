//
//  SearchBarView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var showFilters: Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(16)
                .background(Color(UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)))
            
            Button(action: {
                showFilters.toggle()
            }) {
                Text("Filters")
                    .font(.headline)
            }
            .padding(.trailing, 16)
        }
    }
}
