//
//  PaymentRemoteDatasourceImpl.swift
//  Demo
//
//  Created by MacBook on 4/25/24.
//

import Foundation

final class PaymentRemoteDatasourceImpl: IPaymentRemoteDatasource {
   
   private let service: INetworkService
   
   init(service: INetworkService = NetworkServiceImpl()) {
      self.service = service
   }
   
}
