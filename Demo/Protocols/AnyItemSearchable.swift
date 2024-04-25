//
//  AnyItemSearchable.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

protocol AnyItemSearchable {
   
   associatedtype Item
   
   var id: String { get }
   var itemName: String { get }
   var type: Item? { get }
}
