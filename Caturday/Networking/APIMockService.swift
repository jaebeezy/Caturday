//
//  APIMockService.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/13/22.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Cat], APIError>
    
    func fetchCats(url: URL?, completion: @escaping (Result<[Cat], APIError>) -> Void) {
        completion(result)
    }
    
    
}
