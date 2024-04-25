//
//  BaseButton.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct BaseButton: View {
   
   let buttonText: String
   var loadingState: Bool
   var condition: Bool? = false
   let action: () -> Void
   
   var body: some View {
      HStack {
         Button {
            action()
         } label: {
            ZStack(alignment: .center) {
               if !loadingState {
                  Text(buttonText)
                     .font(.system(size: 15))
                     .foregroundStyle(.white)
               } else {
                  ProgressView()
                     .frame(width: 50, height: 25)
               }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(Color.primary)
            .cornerRadius(10)
            
         }
         .disableWithOpacity(condition ?? false)
      }
   }
}

#Preview {
   BaseButton(buttonText: "Done", loadingState: false) {
      print("called here...")
   }
}
