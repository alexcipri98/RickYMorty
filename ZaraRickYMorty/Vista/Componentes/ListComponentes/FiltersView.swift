//
//  FiltersView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct FiltersView: View {
    @Binding var filterStatus: CharacterFilter.Status
    @Binding var selectedSpecies: CharacterFilter.Species
    @Binding var selectedGender: CharacterFilter.Gender

    var body: some View {
        VStack(spacing: 16) {
            Picker("Status", selection: $filterStatus) {
                ForEach(CharacterFilter.Status.allCases, id: \.self) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Species", selection: $selectedSpecies) {
                ForEach(CharacterFilter.Species.allCases, id: \.self) { species in
                    Text(species.rawValue).tag(species)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Gender", selection: $selectedGender) {
                ForEach(CharacterFilter.Gender.allCases, id: \.self) { gender in
                    Text(gender.rawValue).tag(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(16)
        .background(Color(UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)))
    }
}
