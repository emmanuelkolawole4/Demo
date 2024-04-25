//
//  Endpoint.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

enum Endpoint {
   case test
   case invalidURL
   
   var kpath: String {
      switch self {
      case .test:
         return "test"
      case .invalidURL:
         return ""
      }
   }
   
   var path: String {
      switch self {
      case .invalidURL:
         return ""
      default:
         return "https:baseurl.com/\(kpath)"
      }
   }
}
