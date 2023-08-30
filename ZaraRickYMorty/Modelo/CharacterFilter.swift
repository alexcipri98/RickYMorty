//
//  CharacterFilter.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import Foundation

struct CharacterFilter {
    var status: Status
    var species: Species
    var gender: Gender

    enum Status: String, CaseIterable {
        case all = "All Status"
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
    
    enum Species: String, CaseIterable {
        case all = "All Species"
        case human = "Human"
        case alien = "Alien"
    }
    
    enum Gender: String, CaseIterable {
        case all = "All Genders"
        case female = "Female"
        case male = "Male"
    }
}
