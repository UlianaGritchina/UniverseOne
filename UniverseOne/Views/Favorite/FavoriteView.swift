//
//  FavoriteView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 10.03.2022.
//

import SwiftUI

protocol ImageRowDelegate {
    func updateApods()
}

struct FavoriteView: View {
    @State var viewModel = FavoriteViewViewModel()
    @State var apods = Global.shared.favorites
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("").padding()
            
            ForEach(apods) { apod in
                ZStack {
                    ImageRowView(vm:ImageRowViewViewModel(
                        apod: AstronomyImage(
                            title: apod.title,
                            date: apod.stringDate,
                            explanation: apod.explanation,
                            url: apod.imageUrl,
                            media_type: apod.mediaType),
                        fromScreen: .favorite), deleteAction: {
                            viewModel.delete(apod)
                            Global.shared.favorites = CoreDataManager.shered.fetchApods()
                            apods = Global.shared.favorites
                        }, saveAction: {
                        }
                    )
                }
                .padding()
            }
            
            Text("").padding()
        }
        .animation(.default, value: apods)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .preferredColorScheme(.dark)
    }
}

extension FavoriteView: ImageRowDelegate {
    func updateApods() {
        apods = CoreDataManager.shered.fetchApods()
        print(apods.count)
    }
    
}

