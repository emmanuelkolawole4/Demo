//
//  SearchBarTextField.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct SearchBarTextField: View {
   
   @Binding var text:String
   
   var body: some View {
      HStack{
         Image(systemName: "magnifyingglass")
            .resizable()
            .scaledToFit()
            .frame(width:20,height:20)
            .foregroundColor(Color.primary)
         
         TextField("", text: $text)
            .placeholder(when: text.isEmpty) {
               Text("Search messages").foregroundColor(.gray)
            }
            .foregroundColor(Color.primary)
      }
      .padding(.horizontal,10)
      .padding(.vertical,10)
      .clipped()
      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.purple, lineWidth: 1))
   }
}

#Preview {
   SearchBarTextField(text: .constant(""))
}
