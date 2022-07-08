//
//  DetailView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 14.03.2022.
//

import SwiftUI

struct DetailView: View {
    let apod: Apod
    @ObservedObject var favoriteViewModel: FavoriteViewViewModel
    var body: some View {
        ZStack {
            Color(.black)
            Image(UserDefaults.standard.string(forKey: "backgroundImage") ?? "Back0")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .opacity(0.4)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(apod.title ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: UIScreen.main.bounds.height / 30))
                        .padding()
                        Spacer()
                        CircleButtonView(imageName: "heart.fill",
                                         action: {favoriteViewModel.delete(apod)},
                                         color: .red)
                    }
                    
                    Text(apod.explanation ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: UIScreen.main.bounds.height / 35))
                }
                .padding()
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(apod: Apod(), favoriteViewModel: FavoriteViewViewModel())
    }
}
