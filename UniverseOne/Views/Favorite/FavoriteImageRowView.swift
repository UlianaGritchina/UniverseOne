//
//  FavoriteImageRowView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 10.03.2022.
//

import SwiftUI

struct FavoriteImageRowView: View {
    var apod: Apod
    @ObservedObject var favoriteViewModel: FavoriteViewViewModel
    @State private var isShowInfo = false
    var body: some View {
        ImageView(stringUrl: apod.imageUrl ?? "", mediaType: apod.mediaType ?? "")
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding()
        
            .onTapGesture {
                isShowInfo.toggle()
            }
            .sheet(isPresented: $isShowInfo) {
                DetailView(apod: apod, favoriteViewModel: favoriteViewModel)
            }
    }
}

struct FavoriteImageRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteImageRowView(apod: Apod(), favoriteViewModel: FavoriteViewViewModel())
            .preferredColorScheme(.dark)
    }
}
