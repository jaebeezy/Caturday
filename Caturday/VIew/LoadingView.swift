//
//  LoadingView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Fetching some felines...")
                .foregroundColor(.secondary)
            ProgressView()
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
