//
//  CharacterDetailView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    private var characterImageViewModel: CharacterImageViewModel {
        CharacterImageViewModel(character: character)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                CharacterImageView(viewModel: characterImageViewModel)
                    .frame(width: 200, height: 200)
                    .shadow(radius: 10)
                
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                VStack(alignment: .leading, spacing: 8) {
                    InfoRow(title: "Status", value: character.status)
                    InfoRow(title: "Species", value: character.species)
                    InfoRow(title: "Type", value: character.type ?? "Unknown")
                    InfoRow(title: "Gender", value: character.gender)
                    InfoRow(title: "Origin", value: character.origin.name)
                    InfoRow(title: "Location", value: character.location.name)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle(character.name)
    }
}
