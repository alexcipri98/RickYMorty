//
//  ZaraRickYMortyApp.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

@main
struct ZaraRickYMortyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: CharacterListViewModel())
        }
    }
}
