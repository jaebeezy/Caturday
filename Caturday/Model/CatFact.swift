//
//  CatFact.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import Foundation

struct CatFact: Codable {
    let fact: String
    let length: Int
    
    enum CodingKeys: CodingKey {
        case fact
        case length
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        fact = try values.decode(String.self, forKey: .fact)
        length = try values.decode(Int.self, forKey: .length)
    }
    
    init(fact: String, length: Int) {
        self.fact = fact
        self.length = length
    }

    static func example() -> CatFact {
        return CatFact(fact: "hi", length: 2)
    }
}
