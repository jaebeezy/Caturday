//
//  CatStatsView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/18/22.
//

import SwiftUI

struct CatStatsView: View {
    
    let cat: Cat
    
    var starArray: [Int] {
        [cat.adaptability, cat.affectionLevel, cat.childFriendly, cat.dogFriendly, cat.energyLevel, cat.grooming, cat.healthIssues, cat.intelligence, cat.shedding, cat.socialNeeds, cat.strangerFriendly, cat.vocalisation]
    }
    var textArray: [String] {
        ["Adaptability", "Affection Level", "Child Friendly", "Dog Friendly", "Energy Level", "Grooming", "Health Issues", "Intelligence", "Shedding Level", "Social Needs", "Stranger Friendly", "Vocalisation"]
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(0..<starArray.count) {num in
                    StarView(catDetail: starArray[num], text: textArray[num])
                }
            }
        }
    }
}

struct CatStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatStatsView(cat: Cat.example())
    }
}
