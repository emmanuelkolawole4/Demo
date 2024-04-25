//
//  View+.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation
import SwiftUI

extension View {
   func centerHorizontally() -> some View {
      HStack {
         Spacer()
         self
         Spacer()
      }
   }
   
   @ViewBuilder
   func visible(_ value: Bool) -> some View {
      if value {
         self
      } else {
         EmptyView()
      }
   }
   
   func placeholder<Content: View>(
      when shouldShow: Bool,
      alignment: Alignment = .leading,
      @ViewBuilder placeholder: () -> Content
   ) -> some View {
      ZStack(alignment: alignment) {
         placeholder().opacity(shouldShow ? 1 : 0)
         self
      }
   }
   
   func disableWithOpacity(_ condition:Bool) -> some View {
      self
         .disabled(condition)
         .opacity(condition ? 0.6 : 1)
   }
}

struct MaxLengthSpacer: View {
   var maxLength: CGFloat?
   
   var body: some View {
      Spacer()
         .frame(maxWidth: maxLength, maxHeight: maxLength)
   }
}
