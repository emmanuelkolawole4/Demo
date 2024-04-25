//
//  NetworkServiceImpl.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

struct NetworkResponse<T> {
   let decodedObject: T
   let rawData: Data
}


final class NetworkServiceImpl: INetworkService {
   
   let urlSession: URLSession
   
   init() {
      urlSession = URLSession.shared
   }
   
   func makeRequest<T: Codable>(
      endpoint: Endpoint,
      method: HTTPMethod = .get,
      parameters: Parameters? = nil,
      headers: [String: String]? = nil,
      responseType: T.Type
   ) async throws -> NetworkResponse<T> {
      
      guard var urlComponents = URLComponents(string: endpoint.path) else {
         throw NetworkError.invalidURL
      }
      
      guard let requestURL = urlComponents.url else {
         throw NetworkError.invalidURL
      }
      
      var urlRequest = URLRequest(url: requestURL)
      let (data, response) = try await urlSession.data(for: urlRequest)
      
      do {
         let kdata = data
         
         do {
            let response = try kdata.decode(into: T.self)
            return NetworkResponse(decodedObject: response, rawData: data)
         } catch {
            print("Decoding Error:")
            print("\(error)")
            
            throw NetworkError.decodingFailed
         }
         
      } catch {
         print("Request Failure:")
         print(error.localizedDescription)
         throw NetworkError.requestFailed
      }
   }
   
   func makeRequest<T: Codable>(
      endpoint: String,
      method: HTTPMethod,
      parameters: Parameters?,
      headers: [String: String]?,
      responseType: T.Type
   ) async throws -> NetworkResponse<T> {
      
      guard var urlComponents = URLComponents(string: endpoint) else {
         throw NetworkError.invalidURL
      }
      
      if let parameters, method == .get {
         urlComponents.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
         }
      }
      
      guard let requestURL = urlComponents.url else {
         throw NetworkError.invalidURL
      }
      
      var urlRequest = URLRequest(url: requestURL)
      
      urlRequest.httpMethod = method.rawValue
      
      let (data, response) = try await urlSession.data(for: urlRequest)
     
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
         //         throw NetworkError.badRequest
         throw NetworkError.errorCode((response as? HTTPURLResponse)?.statusCode ?? 000)
      }
      
      do {
         let kdata = data
         
         do {
            let response = try kdata.decode(into: T.self)
            return NetworkResponse(decodedObject: response, rawData: data)
         } catch {
            print("Decoding Error:")
            print("\(error)")
            
            throw NetworkError.decodingFailed
         }
         
      } catch {
         print("Request Failure:")
         print(error.localizedDescription)
         throw NetworkError.requestFailed
      }
   }
}
