//
//  SearchableDropdownNavigatorVieww.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct SearchableDropdownNavigatorVieww<T: AnyItemSearchable>: View {
   
   var labelText = "Select option"
   var screenTitle = "Option"
   var datasource: [any AnyItemSearchable] = []
   
   @Binding var selectedItemTitle: String
   
   var body: some View {
      NavigationLink {
         SearchableDropdownContentVieww<T>(
            title: labelText,
            selectedItemTitle: $selectedItemTitle,
            filteredDatasource: datasource
         )
      } label: {
         HStack {
            Text(labelText)
               .foregroundStyle(Color.primary)
            
            Spacer()
            
            Image(systemName: "chevron.down")
               .foregroundColor(.primary)
         }
         .padding()
         .background(Color.secondary.opacity(0.1))
      }

   }
}

//#Preview {
//   SearchableDropdownNavigatorVieww<T: AnyItemSearchable>()
//}
