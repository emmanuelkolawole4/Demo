//
//  ElectricityBillView.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import SwiftUI

struct ElectricityBillView: View {
   
   @Environment(\.dismiss) private var dismiss
   @Environment(\.presentationMode) private var presentationMode
   
   @ObservedObject var viewModel: PaymentViewModelImpl
   
   var body: some View {
      NavigationView {
         ZStack {
            VStack {
               ZStack(alignment: .top) {
                  navBar
                     .ignoresSafeArea(edges: .top)
                     .frame(height: UIScreen.main.bounds.height * 0.15)
                  
                  VStack {
                     navContent
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                     
                     mainView
                  }
               }
            }
            .background(Color.primary)
         }
      }
      .navigationBarHidden(true)
      .onAppear {
         viewModel.getSavedElectricityBills()
         viewModel.getElectricityProviders()
         viewModel.getElectricityPlans()
      }
   }
}

private extension ElectricityBillView {
   
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
         
         Text("Electricity Bill")
            .font(.system(size: 18))
            .foregroundStyle(.white)
         
         Spacer()
      }
   }
   
   var mainView: some View {
      VStack(alignment: .leading) {
         
         SearchableDropdownNavigatorVieww<ElectricityBill>(
            labelText: viewModel.selectedSavedElectricityBill?.name ?? "Select saved bills",
            screenTitle: "Saved Bills",
            datasource: viewModel.savedElectricityBills,
            selectedItemTitle: viewModel.selectedSavedElectricityBill?.itemName
         )
         
         SearchableDropdownNavigatorVieww<ElectricityProvider>(
            labelText: viewModel.selectedElectricityProvider?.name ?? "Select a provider",
            screenTitle: "Provider",
            datasource: viewModel.providers,
            selectedItemTitle: viewModel.selectedElectricityProvider?.itemName
         )
         
         SearchableDropdownNavigatorVieww<ElectricityPlan>(
            labelText: viewModel.selectedElectricityPlan?.name ?? "Select plan",
            screenTitle: "Plan",
            datasource: viewModel.plans,
            selectedItemTitle: viewModel.selectedElectricityPlan?.itemName
         )
         
         Spacer()
         
         BaseButton(buttonText: "Continue", loadingState: false) {
            
         }
      }
      .padding()
      .background(
         Color.purple
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
}

#Preview {
   ElectricityBillView(viewModel: PaymentViewModelImpl.init())
}
