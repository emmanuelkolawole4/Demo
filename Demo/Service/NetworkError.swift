//
//  NetworkError.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

enum NetworkError: Error {
   case invalidURL
   case requestFailed
   case errorCode(Int)
   case noInternetConnection
   case decodingFailed
   case badRequest
   case invalidDataPrettyJson
}

extension NetworkError: LocalizedError {
   var errorDescription: String? {
      switch self {
      case .invalidURL:
         return "Invalid url, confirm full URL is correct and try again"
      case .requestFailed:
         return "Request failed"
      case .errorCode(let code):
         return "Error \(code) - Something went wrong"
      case .noInternetConnection:
         return "No internet connection, check your internet and try again"
      case .decodingFailed:
         return "Failed to decode model from the service"
      case .badRequest:
         return "Bad request"
      case .invalidDataPrettyJson:
         return "Error converting to pretty json"
      }
   }
}
