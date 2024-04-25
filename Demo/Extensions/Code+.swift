//
//  Code+.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

typealias Parameters = [String: Any]
typealias VoidAction = (() -> Void)
typealias ArgumentAction<T> = ((T) -> Void)

extension Data {
   func decode<T: Decodable>(into objectType: T.Type) throws -> T {
      try JSONDecoder().decode(T.self, from: self)
   }
   
   func prettyJson() throws -> String {
      let jsonObject = try JSONSerialization.jsonObject(with: self, options: [])
      let prettyJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
      
      return String(data: prettyJsonData, encoding: .utf8) ?? "--unable--to--get--prettyJson--"
   }
}
