//
//  CatPageView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/21/22.
//

import SwiftUI

struct CatPageView: View {
    @Binding var selectedTab: Tabs
    
    let tabs: [Tabs]
    let cat: Cat
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs, id: \.rawValue) { tab in
                
                Group {
                    switch tab {
                    case .main:
                        CatMainView(cat: cat)
                            .tag(tab)
                    case .details:
                        CatStatsView(cat: cat)
                            .tag(tab)
                    case .etc:
                        CatEtcView(cat: cat)
                            .tag(tab)
                        
                    }
                }
                .padding(.horizontal)
                
            }
        }.tabViewStyle(.page(indexDisplayMode: .automatic))
    }
}



