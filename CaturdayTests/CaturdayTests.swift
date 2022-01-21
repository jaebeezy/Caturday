//
//  CaturdayTests.swift
//  CaturdayTests
//
//  Created by Jae Young Choi on 1/11/22.
//

import XCTest
import Combine
@testable import Caturday

class CaturdayTests: XCTestCase {
    
    override func setUp() {
    
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()

    func test_getting_cats_success() {
        let result = Result<[Cat], APIError>.success([Cat.example()])
        let networkManager = NetworkManager(service: APIMockService(result: result))
        let promise = expectation(description: "getting cats")
        
        networkManager.$cats.sink { cat in
            if cat.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    func test_loading_url_error() {
        let result = Result<[Cat], APIError>.failure(.badURL)
        let networkManager = NetworkManager(service: APIMockService(result: result))
        let promise = expectation(description: "how bad url error")
        
        networkManager.$cats.sink { cat in
            if !cat.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        networkManager.$errorMessage.sink { error in
            if error != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }

}
