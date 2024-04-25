//
//  SearchableDropdownContentVieww.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct SearchableDropdownContentVieww<T: AnyItemSearchable>: View {
   
   var screenTitle: String = "Title"
   var title: String = "Select an Item"
   var lightImageResource: ImageResource = .defaultIcon
   var darkImageResource: ImageResource = .defaultIcon
   
   @Binding var selectedItemTitle: String
   
   var filteredDatasource: [any AnyItemSearchable]
   
   @Environment(\.colorScheme) var colorScheme
   @Environment(\.dismiss) private var dismiss
   @Environment(\.presentationMode) var presentationMode
   
   @State var searchText = ""
   
   var body: some View {
      VStack {
         ZStack(alignment: .top) {
            navBar
               .ignoresSafeArea(edges: .top)
               .frame(height: UIScreen.main.bounds.height * 0.15)
            
            VStack {
               navContent
                  .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 15))
               
               mainView
            }
         }
      }
      .background(Color.white)
      .navigationBarHidden(true)
   }
}

private extension SearchableDropdownContentVieww {
   
   var navBar: some View {
      Rectangle()
         .fill(Color.blue)
   }
   
   var navContent: some View {
      HStack {
         Button {
            handleDismiss()
         } label: {
            Image("arrow.left")
               .resizable()
               .scaledToFit()
               .frame(width: 25, height: 25)
               .padding(8)
               .background(Color.orange)
               .clipShape(Circle())
               .frame(width: 25, height: 25)
         }
         
         Spacer()
         
         Text(screenTitle)
            .font(.system(size: 18))
            .foregroundStyle(.white)
         
         Spacer()
         
         Button {
            
         } label: {
            Image(
               image(
                  lightName: lightImageResource,
                  darkName: darkImageResource,
                  forColorScheme: colorScheme
               )
            )
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .padding(8)
            .background(Color.orange)
            .clipShape(Circle())
//            .foregroundStyle(.white)
         }
      }
   }
   
   var mainView: some View {
      VStack(alignment: .leading) {
         SearchBarTextField(text: $searchText)
            .padding(.vertical)
         
         ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
               ForEach(filteredDatasource, id: \.id) { item in
                  Button(action: {
//                     i think this is where i want to be able to send what i selected back to the previous view, and go back automatically
                     selectedItemTitle = item.itemName
                     handleDismiss()
                  }) {
                     SearchableDropdownContentItemView(
                        itemName: item.itemName
                     )
                  }
               }
            }
         }
      }
      .padding()
      .background(
         Color.white
            .ignoresSafeArea()
      )
      .clipShape(RoundedShape(corners: [.topLeft, .topRight]))
   }
   
   func handleDismiss() {
      if #available(iOS 15, *) {
         dismiss()
      } else {
         presentationMode.wrappedValue.dismiss()
      }
   }
   
   private func image(
      lightName: ImageResource,
      darkName: ImageResource,
      forColorScheme colorScheme: ColorScheme
   ) -> ImageResource {
      switch colorScheme {
      case .light:
         return lightName
      case .dark:
         return darkName
      @unknown default:
         return lightName
      }
   }
}

#Preview(traits: .sizeThatFitsLayout) {
   SearchableDropdownContentVieww<ElectricityBill>(
      screenTitle: "Provider",
      title: "AEDC Prepaid",
      lightImageResource: .defaultIcon,
      darkImageResource: .defaultIcon,
      selectedItemTitle: .constant("AEDC Prepaid"),
      filteredDatasource: [
         ElectricityBill(name: "AEDC", number: "7023658921", planType: .prepaid),
         ElectricityBill(name: "Jos Electricity", number: "7023658921", planType: .postpaid),
         ElectricityBill(name: "BEDC Electricity", number: "7023658921", planType: .prepaid),
         ElectricityBill(name: "IBEDC", number: "7023658921", planType: .prepaid),
         ElectricityBill(name: "KAEDCO", number: "7023658921", planType: .postpaid)
      ]
   )
}
