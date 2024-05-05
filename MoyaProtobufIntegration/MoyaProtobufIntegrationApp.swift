//
//  MoyaProtobufIntegrationApp.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import SwiftUI

@main
struct MoyaProtobufIntegrationApp: App {
    @StateObject var viewmodel = BannerViewModel()
    var body: some Scene {
        WindowGroup {
            BannerView()
                .environmentObject(viewmodel)
        }
    }
}
