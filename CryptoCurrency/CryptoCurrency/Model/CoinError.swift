//
//  Error.swift
//  CryptoCurrency
//
//  Created by mohamdan on 07/12/2023.
//

import Foundation
enum CoinError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return ("The URL is invaild")
        case .serverError:
            return ("There is an error with the server")
        case .invalidData:
            return ("The coin data is invalied")
        case .unkown(let error):
            return error.localizedDescription
        }
    }
    
}
