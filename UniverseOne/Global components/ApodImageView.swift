//
//  ApodImageView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

class ApodImageViewViewModel: ObservableObject {
    
    @Published var iamge: UIImage? = nil
    @Published var isLoading = false
    
    init() {
        getImage()
    }
    
    private func getImage() {
        
    }
}

struct ApodImageView: View {
    @StateObject var vm = ApodImageViewViewModel()
    var body: some View {
        ZStack {
            if let image = vm.iamge {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
            }
        }
    }
}

struct ApodImageView_Previews: PreviewProvider {
    static var previews: some View {
        ApodImageView()
    }
}
