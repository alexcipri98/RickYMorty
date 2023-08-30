//
//  CharacterListView.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    @State private var searchText: String = ""
    @State private var showFilters: Bool = false
    @State private var filters = CharacterFilter(status: .all,
                                                 species: .all,
                                                 gender: .all)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                content
            }
            .navigationBarTitle("Characters")
        }
    }
    
    @ViewBuilder
    var content: some View {
        if viewModel.isLoading {
            ZStack {
                Color.gray
                VStack{
                    ProgressView(gifName: "RickDancing")
                        .frame(width: 200, height: 200)
                    Text("Cargando...").onAppear {
                        viewModel.fetchCharacters()
                    }
                }
            }
        } else {
            SearchBarView(searchText: $searchText, showFilters: $showFilters)
            
            if showFilters {
                FiltersView(filterStatus: $filters.status,
                            selectedSpecies: $filters.species,
                            selectedGender: $filters.gender)
            }
            
            CharacterListViewContent(viewModel: viewModel,
                                     searchText: searchText,
                                     filterStatus: filters.status.rawValue,
                                     selectedSpecies: filters.species.rawValue,
                                     selectedGender: filters.gender.rawValue)
        }
    }
}
