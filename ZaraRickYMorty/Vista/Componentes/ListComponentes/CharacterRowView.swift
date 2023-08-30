//
//  CharacterRowView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character
    private var characterImageViewModel: CharacterImageViewModel {
        CharacterImageViewModel(character: character)
    }

    var body: some View {
        HStack {
            CharacterImageView(viewModel: characterImageViewModel)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text("Status: \(character.status)")
                    .font(.subheadline)
            }
        }
    }
}
