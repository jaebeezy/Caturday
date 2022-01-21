//
//  CatMainView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/18/22.
//

import SwiftUI

struct CatMainView: View {
    
    let cat: Cat
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                
                Text(cat.name)
                    .font(.largeTitle)
                Text(cat.temperament)
                    .lineLimit(2)
                    .font(.footnote)
                Text(cat.breedExplanation)
                    .font(.body)
                    .padding(.vertical)
                Text("Life Span: \(cat.lifeSpan) years")
                    .font(.caption)
                Text("County of Origin: \(cat.origin)")
                    .font(.caption)
            }
            
        }
    }
}

struct CatMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView(cat: Cat.example())
    }
}
