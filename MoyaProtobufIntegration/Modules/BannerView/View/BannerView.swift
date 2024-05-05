//
//  BannerView.swift
//  MoyaProtobufIntegration
//
//  Created by Meezu Lawot on 17/10/2023.
//

import SwiftUI

struct BannerView: View {
    
    @EnvironmentObject var viewModel: BannerViewModel
    @State var pageIndex: Int = 0
    
    var body: some View {
        VStack{
            
            TabView(selection: $pageIndex){
                ForEach(viewModel.bannerImages.dataList.indices, id: \.self, content: {index in
                    VStack{
                        ImageLoadingView(url: viewModel.bannerImages.dataList[index].urlPath)
                        
                    }
                    .tag(index)
                    
                })
            }
            .tabViewStyle(.page)
            
        }
    }
}

//struct BannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerView()
//    }
//}
