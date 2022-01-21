//
//  CatDetailView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/12/22.
//

import SwiftUI

struct CatDetailView: View {
    
    @State private var selectedTab = Tabs.allCases.first!
    
    let cat: Cat
    let tabs = Tabs.allCases
    
    var body: some View {
        VStack {
            if cat.image?.url != nil {
                AsyncImage(url: URL(string: cat.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 350)
                            .clipped()
                    } else if phase.error != nil {
                        ZStack {
                            Color.red
                                .frame(height: 300)
                                .clipped()
                            Text("😿")
                                .font(.system(size: 30))
                        }
                    } else {
                        ProgressView()
                    }
                }
            } else {
                ZStack() {
                    Color.gray
                        .frame(height: 350)
                        .clipped()
                    VStack {
                        Text("🐈")
                            .font(.system(size: 30))
                        Text("No photo found.")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                    
                }
            }
            
            TabMenuView(selectedTab: $selectedTab, tabs: tabs)
            CatPageView(selectedTab: $selectedTab, tabs: tabs, cat: cat)
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailView(cat: Cat.example())
    }
}
