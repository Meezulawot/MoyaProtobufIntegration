//
//  BannerAPI.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import Foundation
import Moya
import SwiftProtobuf

enum BannerAPI{
    case getBanner(params: Bfi_Banner_getBannerCustomerRequest)
}

extension BannerAPI: TargetType{

    var baseURL: URL{
        guard let url = URL(string: AppURL.baseUrl) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self{
        case .getBanner:
            return AppURL.URLCollection.getBanner
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getBanner:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .getBanner(params: let param):
            return .requestParameters(parameters: ["filter": ["bannerType": param.bannerType, "interfaceType" : param.interfaceType]], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ContentType.protobuf.headers
    }
    
    
}
