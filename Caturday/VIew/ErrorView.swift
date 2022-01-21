//
//  ErrorView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        VStack(spacing: 5) {
            Text("😿")
                .font(.system(size: 80))
            Text(networkManager.errorMessage ?? "")
            Button {
                networkManager.fetchCatBreeds()
            } label: {
                Text("Try Again")
            }

        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(networkManager: NetworkManager())
    }
}
