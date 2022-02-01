//
//  StarView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/18/22.
//

import SwiftUI

struct StarView: View {
    let catDetail: Int
    let text: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .font(.caption)
                .fontWeight(.black)
                .padding(4)
                .foregroundColor(.white)
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
            
            Spacer()
            
            ForEach(0..<5) { id in
                Image(systemName: "star.fill")
                    .foregroundColor(catDetail > id ? .pink : .gray)
            }
            
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(catDetail: 1, text: "hey")
    }
}
