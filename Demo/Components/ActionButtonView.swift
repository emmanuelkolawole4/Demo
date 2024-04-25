//
//  ActionButtonView.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct ActionButtonView: View {
   
   let action: Action
   
   var body: some View {
      ZStack {
         VStack(spacing: 8) {
            ZStack {
               Circle()
                  .strokeBorder(action.stroke, lineWidth: 0.6)
               
               Image(action.image)
                  .renderingMode(.template)
                  .resizable()
                  .tint(action.tint)
                  .scaledToFit()
                  .frame(width: 25, height: 25)
                  .padding()
            }
            .background(action.backgroundcolor)
            .clipShape(Circle())
            
            Text(action.title)
               .multilineTextAlignment(.center)
               .lineLimit(nil)
               .font(.system(size: 9))
               .foregroundStyle(Color.black)
         }
      }
      .frame(width: 70, height: 90)
   }
}
