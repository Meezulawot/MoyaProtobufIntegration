//
//  AppURL.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import Foundation

struct AppURL{
    
    private struct Domains {
        static let Dev = devUrl
    }
    
    private  struct VersioningRoutes {
        static let Api = "api/v1/"
    }
    
    
    
    private struct ServiceRoutes {
        static let customerApi = "customer/"
    }
    
    struct URLCollection{
        
        static let getBanner = ServiceRoutes.customerApi + "banner-customer/images"
        
    }
    
    
    static let Route = VersioningRoutes.Api
    static let baseUrl = Domains.Dev + Route
}
