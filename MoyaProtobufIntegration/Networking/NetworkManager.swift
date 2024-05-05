//
//  NetworkManager.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import Foundation
import Moya
import SwiftProtobuf

protocol Networkable {
    var provider: MoyaProvider<BannerAPI> { get }
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<BannerAPI>(plugins: [NetworkLoggerPlugin()])
    
}

extension NetworkManager {
    
    
    func requestForBannerResponse(request: Bfi_Banner_getBannerCustomerRequest, completion: @escaping (Bfi_Banner_getBannerCustomerResponse?, String?) -> ()){
        provider.request(.getBanner(params: request)) { response in
            
            switch response {
            case let .success(value):
                let bannerResponse:Bfi_Banner_getBannerCustomerResponse = convertData(value.data, to: .protobuf)
                guard value.response?.statusCode == 200 else {
                    completion(bannerResponse,value.response.debugDescription)
                    break
                }
                DispatchQueue.main.async {
                    completion(bannerResponse,nil)
                }
                break
            case let .failure(error):
                
                print(error)
                
            }
        }
    }
    
}



