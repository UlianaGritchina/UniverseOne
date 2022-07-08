//
//  DownloadImageTestView.swift
//  PocketSpace
//
//  Created by Ульяна Гритчина on 08.06.2022.
//

import SwiftUI

class Global {
    
    static let shared = Global()
    
    var favorites = CoreDataManager.shered.fetchApods()
    var imageData: Data? = nil
    
}

struct ApodContentView: View {
    @StateObject var vm: ApodContentViewViewModel
    var body: some View {
        VStack {
            switch vm.mediaTapy {
            case "image" : imageContent
            case "video": VideoCard(stringUrl: vm.stringUrl)
            default: Text("sdb")
            }
            
        }
        .animation(.default, value: vm.network)
        
        .sheet(isPresented: $vm.isShowingShareView) {
            ShareView(imageData: vm.imageData,
                      isShowingShereView: $vm.isShowingShareView)
        }
        
    }
}

struct ApodContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApodContentView(
            vm: ApodContentViewViewModel(
                mediaTapy: "image",
                stringUrl: "https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Mahadev-Bhagwan-Photo-for-Devotee.jpg")
        )
    }
}

