//
//  Cat.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import Foundation

// MARK: cat model from 'thecatapi'

struct Cat: Codable, Identifiable {
    
    // cat texts
    let id: String
    let name: String
    let temperament: String
    let breedExplanation: String
    let lifeSpan: String
    let origin: String
    let wikiURL: String?
    
    // cat levels (int) from 1 to 5
    let affectionLevel: Int
    let adaptability: Int
    let childFriendly: Int
    let dogFriendly: Int
    let energyLevel: Int
    let grooming: Int
    let healthIssues: Int
    let intelligence: Int
    let shedding: Int
    let socialNeeds: Int
    let strangerFriendly: Int
    let vocalisation: Int
    
    // cat booleans
    let isHairless: Bool
    
    // cat image
    let image: CatImage?
        
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplanation = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
        case lifeSpan = "life_span"
        case origin
        case wikiURL = "wikipedia_url"
        
        case affectionLevel = "affection_level"
        case adaptability
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case shedding = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplanation = try values.decode(String.self, forKey: .breedExplanation)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        lifeSpan = try values.decode(String.self, forKey: .lifeSpan)
        origin = try values.decode(String.self, forKey: .origin)
        
        wikiURL = try values.decodeIfPresent(String.self, forKey: .wikiURL)
        
        affectionLevel = try values.decode(Int.self, forKey: .affectionLevel)
        adaptability = try values.decode(Int.self, forKey: .adaptability)
        childFriendly = try values.decode(Int.self, forKey: .childFriendly)
        dogFriendly = try values.decode(Int.self, forKey: .dogFriendly)
        grooming = try values.decode(Int.self, forKey: .grooming)
        healthIssues = try values.decode(Int.self, forKey: .healthIssues)
        intelligence = try values.decode(Int.self, forKey: .intelligence)
        shedding = try values.decode(Int.self, forKey: .shedding)
        socialNeeds = try values.decode(Int.self, forKey: .socialNeeds)
        strangerFriendly = try values.decode(Int.self, forKey: .strangerFriendly)
        vocalisation = try values.decode(Int.self, forKey: .vocalisation)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
        image = try values.decodeIfPresent(CatImage.self, forKey: .image)
        
    }
    
    init(name: String, id: String, temperament: String, breedExplanation: String, energyLevel: Int, isHairless: Bool, image: CatImage?, lifeSpan: String, origin: String, affectionLevel: Int, adaptability: Int, childFriendly: Int,
         dogFriendly: Int, grooming: Int, healthIssues: Int, intelligence: Int, shedding: Int, socialNeeds: Int, strangerFriendly: Int, vocalisation: Int, wikiURL: String) {
        self.name = name
        self.id = id
        self.temperament = temperament
        self.breedExplanation = breedExplanation
        self.lifeSpan = lifeSpan
        self.energyLevel = energyLevel
        self.isHairless = isHairless
        self.image = image
        self.origin = origin
        self.wikiURL = wikiURL
        self.affectionLevel = affectionLevel
        self.adaptability = adaptability
        self.childFriendly = childFriendly
        self.dogFriendly = dogFriendly
        self.grooming = grooming
        self.healthIssues = healthIssues
        self.intelligence = intelligence
        self.shedding = shedding
        self.socialNeeds = socialNeeds
        self.strangerFriendly = strangerFriendly
        self.vocalisation = vocalisation
    }
    
    static func example() -> Cat {
        return Cat(name: "Abyssinian", id: "abys", temperament: "Active, Energetic, Independent, Gentle", breedExplanation: "The Abyssinian is easy to care for, and a joy to have in your home.", energyLevel: 4, isHairless: false, image: nil, lifeSpan: "5 - 10", origin: "Anywhere", affectionLevel: 1, adaptability: 1, childFriendly: 1, dogFriendly: 1, grooming: 1, healthIssues: 1, intelligence: 1, shedding: 1, socialNeeds: 1, strangerFriendly: 1, vocalisation: 1, wikiURL: "https://")
    }
    
    static func exampleTwo() -> Cat {
        return Cat(name: "AbyssinianAbyssinian", id: "a", temperament: "AbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinian", breedExplanation: "AbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinianAbyssinian", energyLevel: 1, isHairless: true, image: nil, lifeSpan: "5-10", origin: "Anywhere", affectionLevel: 1, adaptability: 1, childFriendly: 1, dogFriendly: 1, grooming: 1, healthIssues: 1, intelligence: 1, shedding: 1, socialNeeds: 1, strangerFriendly: 1, vocalisation: 1, wikiURL: "https://")
    }
}

