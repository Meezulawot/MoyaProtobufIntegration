//
//  ImageLoadingView.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 11/10/2023.
//

import SwiftUI

struct ImageLoadingView: View {
    
    @StateObject var imageLoader : ImageLoader
    
    init(url: String?){
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    let imageSize : CGFloat = 100
    
    var body: some View {
        
        Group{
            if imageLoader.image != nil{
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: .infinity)
                    .clipped()
                
            }else{
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
//                print("Image Loading error")
            }
        }
        .onAppear{
            imageLoader.fetchImage()
        }
        
    }
}

