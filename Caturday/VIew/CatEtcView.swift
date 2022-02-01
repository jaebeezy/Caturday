//
//  CatEtcView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/18/22.
//

import SwiftUI

struct CatEtcView: View {
    let cat: Cat
    var body: some View {
        if cat.wikiURL != nil {
            Link(destination: URL(string: cat.wikiURL!)!) {
                VStack {
                    Image(systemName: "paperplane")
                        .font(.title)
                    Text("Wikipedia Page")
                }
                .padding()
            }
        } else {
            Text("Meow... nothing to be seen here.")
                .font(.title2)
                .padding()
            
        }
    }
}

struct CatEtcView_Previews: PreviewProvider {
    static var previews: some View {
        CatEtcView(cat: Cat.example())
    }
}
