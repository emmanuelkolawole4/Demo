//
//  Models.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation
import SwiftUI

enum Action: CaseIterable {
   case withdraw
   case swap
   case recharge
   case electricity
   case cableTV
   
   var title: String {
      switch self {
      case .withdraw:
         return "Withdraw"
      case .swap:
         return "Swap"
      case .recharge:
         return "Recharge"
      case .electricity:
         return "Electricity"
      case .cableTV:
         return "Cable TV"
      }
   }
   
   var image: ImageResource {
      switch self {
//      case .withdraw:
//         return .withdrawIcon
//      case .swap:
//         return .swapIcon
//      case .recharge:
//         return .rechargeIcon
//      case .electricity:
//         return .electricityIcon
//      case .cableTV:
//         return .cableTvIcon
      default:
         return .defaultIcon
      }
   }
   
   var backgroundcolor: Color {
      switch self {
      case .withdraw:
         return Color.gray
      default:
         return Color.white
      }
   }
   
   var tint: Color {
      switch self {
      case .withdraw:
         return Color.red
      default:
         return Color.purple
      }
   }
   
   var stroke: Color {
      switch self {
      case .withdraw:
         return Color.red
      default:
         return Color.secondary
      }
   }
}

struct ElectricityBill {
   var name: String
   var number: String
   var planType: PlanType
   
   enum PlanType: String {
      case prepaid, postpaid
   }
}

extension ElectricityBill: AnyItemSearchable {

   typealias Item = PlanType
   
   var type: PlanType? { planType }
   
   var id: String { UUID().uuidString }
   
   private(set) var itemName: String {
      get {
         if planType == .prepaid {
            "\(name) (\(planType.rawValue.capitalized))"
         } else {
            name
         }
      }
      
      set {
         
      }
   }
}

struct ElectricityProvider {
   var name: String
}

extension ElectricityProvider: AnyItemSearchable {
   
   typealias Item = String
   
   var type: String? { nil }
   
   var id: String { UUID().uuidString }
   
   private(set) var itemName: String {
      get { name }
      set {}
   }
}

struct ElectricityPlan {
   var name: String
}

extension ElectricityPlan: AnyItemSearchable {
   
   typealias Item = String
   
   var type: String? { nil }
   
   var id: String { UUID().uuidString }
   
   private(set) var itemName: String {
      get { name }
      set {}
   }
}
