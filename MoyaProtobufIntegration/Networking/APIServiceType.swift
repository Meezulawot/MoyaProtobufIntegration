//
//  APIServiceType.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import Foundation
import SwiftProtobuf

enum ContentType: String {
    case protobuf = "application/octet-stream"
    case json = "application/json"
    
    var headers: [String: String] {
        return [
            "Accept":        rawValue,
            "Content-Type":  rawValue
        ]
    }
}

//MARK:- Method to convert data to protobuf response or json respectively as per the contentType
func convertData<T: SwiftProtobuf.Message>(_ data: Data, to contentType: ContentType) -> T {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useBytes] // optional: restricts the units to MB only
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(data.count))
         print("formatted size: \(string)")
    
    switch contentType {
    case .protobuf:
        do {
            let genericData = try T(serializedData: data)
             print("Response: \(genericData)")
            
            return genericData
        } catch(let error) {
             print("Error: \(error.localizedDescription)")
        }
    case .json:
        do {
            let genericData = try T(jsonUTF8Data: data)
            return genericData
        } catch(let error) {
             print("Error: \(error.localizedDescription)")
        }
    }
    return T()
}
