//
//  CharacterImageViewModel.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import Foundation
import UIKit

class CharacterImageViewModel: ObservableObject {
    @Published var image: UIImage?
    let character: Character

    init(character: Character) {
        self.character = character
    }

    func loadImage() {
        guard let url = URL(string: character.image) else { return }
        
        if let cachedImage = ImageCache.shared.getImage(for: url) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let downloadedImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = downloadedImage
                ImageCache.shared.setImage(downloadedImage, for: url)
            }
        }.resume()
    }
}
