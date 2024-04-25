//
//  INetworkService.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

protocol INetworkService {
   func makeRequest<T: Codable>(
      endpoint: Endpoint,
      method: HTTPMethod,
      parameters: Parameters?,
      headers: [String: String]?,
      responseType: T.Type
   ) async throws -> NetworkResponse<T>
   
   func makeRequest<T: Codable>(
      endpoint: String,
      method: HTTPMethod,
      parameters: Parameters?,
      headers: [String: String]?,
      responseType: T.Type
   ) async throws -> NetworkResponse<T>
}
