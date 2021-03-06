//
//  CatRowView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/12/22.
//

import SwiftUI

struct CatRowView: View {
    
    @EnvironmentObject var favorites: Favorites
    
    let cat: Cat
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            
            if cat.image?.url != nil {
                AsyncImage(url: URL(string: cat.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                            .cornerRadius(4)
                            .padding(5)
                            .shadow(color: Color.black.opacity(0.25), radius: 25, x: 0, y: 20)
                        
                    } else if phase.error != nil {
                        ZStack {
                            Color.red
                                .frame(width: imageSize, height: imageSize)
                                .cornerRadius(4)
                            .padding(5)
                            Text("😿")
                                .font(.system(size: 30))
                        }
                        
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                            .cornerRadius(4)
                            .padding(5)
                    }
                }
            } else {
                ZStack() {
                    Color.gray.frame(width: imageSize, height: imageSize)
                        .clipped()
                        .cornerRadius(4)
                        .padding(5)
                    
                    Text("🐈")
                        .font(.system(size: 30))
                    
                }
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text(cat.name)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            if favorites.contains(cat) {
                Spacer()
                
                Image(systemName: "heart.fill" )
                    .foregroundColor(.red)
            }
            
        }
    }
}

struct CatRowView_Previews: PreviewProvider {
    static var previews: some View {
        CatRowView(cat: Cat.example())
    }
}
