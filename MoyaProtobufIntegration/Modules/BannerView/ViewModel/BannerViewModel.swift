//
//  BannerViewModel.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import Foundation


class BannerViewModel: ObservableObject{
    
    @Published var bannerImages = Bfi_Banner_getBannerCustomerResponse()
    @Published var errorMessage: String = ""
    fileprivate let networkManager = NetworkManager()
    
    init(){
        fetchBanners()
    }
    
    func fetchBanners(){
        var params = Bfi_Banner_getBannerCustomerRequest()
        params.bannerType = "Login Screen"
        params.interfaceType = "Customer-Mobile"
        networkManager.requestForBannerResponse(request: params, completion: {[weak self] (response, error) in
            guard self != nil else { return }
            
            guard let response = response else{
                self?.errorMessage = error ?? ""
                return
            }
            print("Fetched Response: \(response)")
            self?.bannerImages = response
            
        })
    }
}
