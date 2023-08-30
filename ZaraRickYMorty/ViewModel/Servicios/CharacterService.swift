//
//  CharacterService.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import Foundation

class CharacterService {
    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching characters: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(CharacterResponse.self, from: data)
                completion(response.results)
            } catch {
                print("Error decoding characters: \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
}

