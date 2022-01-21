//
//  APIServiceProtocol.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/13/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchCats(url: URL?, completion: @escaping(Result<[Cat], APIError>) -> Void)
}
