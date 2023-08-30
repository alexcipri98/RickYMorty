//
//  CharacterListViewModel.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import Foundation
import SwiftUI

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = true
    private let characterService = CharacterService()

    func fetchCharacters() {
        isLoading = true
        characterService.fetchCharacters { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters = characters
                self?.isLoading = false
            }
        }
    }
}
