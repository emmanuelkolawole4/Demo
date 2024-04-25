//
//  SwiftUIView.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct ActionsGridView: View {
   
   @ObservedObject var viewModel: PaymentViewModelImpl
   
   let actions = Action.allCases
   
   var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
         HStack(spacing: 10) {
            ForEach(actions, id: \.self) { action in
               Button {
                  switch action {
                  default:
                     viewModel.action = action
                  }
               } label: {
                  ActionButtonView(action: action)
               }
            }
         }
      }
   }
}

#Preview {
   ActionsGridView(viewModel: .init())
}
