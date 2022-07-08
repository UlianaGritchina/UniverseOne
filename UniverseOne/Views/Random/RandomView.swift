//
//  RandomView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 21.03.2022.
//

import SwiftUI

struct RandomView: View {
    @StateObject private var viewModel = RandomViewViewModel()
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Text("").padding()
                if viewModel.apods.isEmpty {
                    ProgressView().tint(.white)
                } else {
                    ForEach(viewModel.apods, id: \.self) { apod in
                        VStack() {
                            ImageRowView(
                                vm: ImageRowViewViewModel(apod: apod,
                                                          fromScreen: .random),
                                deleteAction: {}, saveAction: {
                                    CoreDataManager.shered.addApod(astonomyImage: apod)
                                }
                            )
                        }
                        .padding()
                    }
                    moreButton.padding()
                }
                Text("").padding()
            }
        }
        
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView().preferredColorScheme(.dark)
    }
}

extension RandomView {
    private var moreButton: some View {
        Button(action: {viewModel.fetchAstronomyData()}) {
            ZStack {
                Capsule()
                    .stroke()
                    .frame(width: UIScreen.main.bounds.width / 2,
                           height: UIScreen.main.bounds.height / 20)
                Text("More")
                    .font(.system(size: UIScreen.main.bounds.height / 45))
                    .bold()
            }
        }
    }
}
