//
//  TabMenuView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/17/22.
//

import SwiftUI

struct TabMenuView: View {
    @Binding var selectedTab: Tabs
    @Namespace var namespace
    
    let tabs: [Tabs]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            buttons
            underline
        }
        .padding(.horizontal)
    }
    
    var buttons: some View {
        HStack {
            ForEach(tabs, id: \.rawValue) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    Text(tab.title)
                        .foregroundColor(tab == selectedTab ? .black : .gray)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(.vertical, 8)
                        .matchedGeometryEffect(id: tab, in: namespace, properties: .frame, isSource: true)
                }
            }
            
            Spacer()
            
        }
    }
    
    var underline: some View {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
            .fill(.pink)
            .frame(height: 3)
            .matchedGeometryEffect(id: selectedTab, in: namespace, properties: .frame, isSource: false)
            .animation(.easeOut(duration: 0.2), value: selectedTab)
    }
}
