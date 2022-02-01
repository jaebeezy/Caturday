//
//  CatDetailView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/12/22.
//

import SwiftUI

struct CatDetailView: View {
    
    @State private var selectedTab = Tabs.allCases.first!
    
    @EnvironmentObject var favorites: Favorites
    
    let cat: Cat
    let tabs = Tabs.allCases
    
    let frameHeight = UIScreen.main.bounds.size.height / 2.6
    
    /// MARK: to-do
    /// adding an tapgesture for the cat image
    /// once tapped, you open a new catimage view with the full resolution pic of the cat that's clipped on the catdetailview
    
    var body: some View {
        VStack {
            if cat.image?.url != nil {
                AsyncImage(url: URL(string: cat.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(height: frameHeight)
                            .clipped()
                            
                    } else if phase.error != nil {
                        ZStack {
                            Color.red
                                .frame(height: frameHeight)
                                .clipped()
                            Text("😿")
                                .font(.system(size: 30))
                        }
                    } else {
                        ProgressView()
                            .frame(height: frameHeight)
                            .clipped()

                    }
                }
            } else {
                ZStack() {
                    Color.gray
                        .frame(height: frameHeight)
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if favorites.contains(cat) {
                        favorites.remove(cat)
                    } else {
                        favorites.add(cat)
                    }
                } label: {
                    Image(systemName: favorites.contains(cat) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }

            }
        }
    }
}

struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailView(cat: Cat.example())
    }
}
