//
//  CharacterImageView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct CharacterImageView: View {
    @ObservedObject var viewModel: CharacterImageViewModel

    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
        } else {
            RemoteImageView(url: URL(string: viewModel.character.image), placeholder: Image(systemName: "person.fill"))
                .clipShape(Circle())
                .onAppear {
                    viewModel.loadImage()
                }
        }
    }
}

