//
//  APIService.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import Foundation

struct APIService: APIServiceProtocol {
   
    
    func fetchData<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlError(error)))
            } else if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode)  {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(type, from: data)
                    completion(Result.success(results))
                } catch {
                    completion(Result.failure(APIError.parsingError(error as? DecodingError)))
                }
            }
            
        }
        
        task.resume()

    }
    
    func fetchCats(url: URL?, completion: @escaping(Result<[Cat], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlError(error)))
            } else if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode)  {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let cats = try decoder.decode([Cat].self, from: data)
                    completion(Result.success(cats))
                } catch {
                    completion(Result.failure(APIError.parsingError(error as? DecodingError)))
                }
            }
            
        }
        
        task.resume()
        
    }
    
    func fetchFact(url: URL?, completion: @escaping (Result<CatFact, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlError(error)))
            } else if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let fact = try decoder.decode(CatFact.self, from: data)
                    completion(Result.success(fact))
                } catch {
                    completion(Result.failure(APIError.parsingError(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
        
    }
    
}

