//
//  CatRowView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/12/22.
//

import SwiftUI

struct CatRowView: View {
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
        }
    }
}

struct CatRowView_Previews: PreviewProvider {
    static var previews: some View {
        CatRowView(cat: Cat.example())
    }
}
