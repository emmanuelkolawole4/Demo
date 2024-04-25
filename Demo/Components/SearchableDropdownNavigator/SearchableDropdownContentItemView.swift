//
//  SearchableDropdownContentItemView.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct SearchableDropdownContentItemView: View {
   
   let itemName: String
   var isSelected: Bool = false
   
   var body: some View {
      ZStack(alignment: .leading) {
         RoundedRectangle(cornerRadius: 10)
            .fill(isSelected ? Color.purple.opacity(0.15) : .clear)
            .frame(height: 50)
         
         Text(itemName)
            .foregroundStyle(Color.primary)
            .font(.system(size: 13))
            .padding()
      }
   }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchableDropdownContentItemView(itemName: "AEDC Prepaid", isSelected: true)
}
