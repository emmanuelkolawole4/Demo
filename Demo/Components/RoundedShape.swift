//
//  RoundedShape.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct RoundedShape:Shape {
   
   var corners: UIRectCorner
   
   func path(in rect: CGRect) -> Path {
      let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 32, height: 32))
      return Path(path.cgPath)
   }
}

struct RoundedCorner: Shape {
   var radius: CGFloat
   var corners: UIRectCorner
   
   func path(in rect: CGRect) -> Path {
      let path = UIBezierPath(
         roundedRect: rect,
         byRoundingCorners: corners,
         cornerRadii: CGSize(width: radius, height: radius)
      )
      return Path(path.cgPath)
   }
}
