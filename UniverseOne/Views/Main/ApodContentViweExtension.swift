//
//  ApodContentViweExtension.swift
//  PocketSpace
//
//  Created by Ульяна Гритчина on 10.06.2022.
//

import SwiftUI

extension ApodContentView: DateDelegate {
    
    func findImage(url: String) {
        vm.fetchImage(stringUrl: url)
    }
    
    
    var imageContent: some View {
        VStack {
            switch vm.network {
            case .loading: ProgressView()
            case .loaded: image
            case .loadingError: Text("error")
            }
        }
    }
    
    private var image: some View {
        Image(uiImage: vm.image)
            .resizable()
            .cornerRadius(20)
            .aspectRatio(contentMode: .fit)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray,lineWidth: 1)
                        .opacity(0.5))
            .shadow(color: .black, radius: 10, x: 0, y: 0)
            .onTapGesture {
                vm.isShowingShareView = true
            }
    }
    
}
