//
//  CharacterListViewContent.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct CharacterListViewContent: View {
    @ObservedObject var viewModel: CharacterListViewModel
    let searchText: String
    let filterStatus: String
    let selectedSpecies: String
    let selectedGender: String

    var filteredCharacters: [Character] {
        viewModel.characters.filter { character in
            (searchText.isEmpty || character.name.localizedCaseInsensitiveContains(searchText))
                && (filterStatus == "All Status" || character.status == filterStatus)
                && (selectedSpecies == "All Species" || character.species == selectedSpecies)
                && (selectedGender == "All Genders" || character.gender == selectedGender)
        }
    }

    var body: some View {
        List(filteredCharacters) { character in
            NavigationLink(destination: CharacterDetailView(character: character)) {
                CharacterRowView(character: character)
            }
        }
        .listStyle(PlainListStyle())
    }
}
