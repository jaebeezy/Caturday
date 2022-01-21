//
//  NetworkManager.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var cats = [Cat]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchCatBreeds()
    }
    
    func fetchCatBreeds() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
        
        service.fetchCats(url: url) { [unowned self] res in
            DispatchQueue.main.async {
                self.isLoading = false
                switch res {
                case .success(let cats):
                    self.cats = cats
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
        
    }
    
    // MARK: previews
    
    static func errorState() -> NetworkManager {
        let manager = NetworkManager()
        manager.errorMessage = APIError.urlError(URLError.init(.notConnectedToInternet)).localizedDescription
        return manager
    }
    
    static func successState() -> NetworkManager {
        let manager = NetworkManager()
        manager.cats = [Cat.example(), Cat.exampleTwo()]
        return manager
    }
    
}
