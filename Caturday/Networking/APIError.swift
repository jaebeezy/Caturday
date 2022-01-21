//
//  APIError.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case urlError(URLError?)
    case parsingError(DecodingError?)
    case unknownError
    
    var localizedDescription: String {
        // for the user
        switch self {
        case .badURL, .parsingError, .unknownError:
            return "Sorry, something went wrong."
        case .badResponse(statusCode: _):
            return "Cannot connect to servers."
        case .urlError(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    var description: String {
        // for debugging
        switch self {
        case .unknownError:
            return "Unknown Error"
        case .badURL:
            return "Invalid URL"
        case .urlError(let error):
            return error?.localizedDescription ?? "some error"
        case .parsingError(let error):
            return "parsing error: \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response: status code \(statusCode)"
        }
    }
}
