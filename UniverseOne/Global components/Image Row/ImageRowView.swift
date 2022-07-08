//
//  RandomImageRowView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 05.06.2022.
//

import SwiftUI

struct ImageRowView: View {
    @StateObject var vm: ImageRowViewViewModel
    @State private var delegate: FavoriteView = FavoriteView()
    let deleteAction: () -> ()
    let saveAction: () -> ()
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    var body: some View {
        VStack() {
            Text(vm.apod.title ?? "")
                .bold()
                .font(.system(size: UIScreen.main.bounds.height / 40))
            
            ApodContentView(vm: ApodContentViewViewModel(
                mediaTapy: vm.apod.media_type ?? "",
                stringUrl: vm.apod.url ?? "")
            )
            
            rowView
            
            if vm.isShowinInfo { Text(vm.apod.explanation ?? "") }
            
        }
        .onAppear {
            
        }
        
        .preferredColorScheme(.dark)
        .padding()
        .frame(width: width - 40)
        .background(Rectangle()
                        .opacity(0)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20))
        
        .actionSheet(isPresented: $vm.isShowingAction) {
            ActionSheet(
                title: Text("Delete this apod?"),
                buttons: [
                   // .default(Text("Use like wallpaper")) {
                        
                   // },
                    .destructive(Text("Delete")) {
                        deleteAction()
                        print(Global.shared.favorites.count)
                    },
                    
                        .cancel()
                ]
            )
        }
        
        .onAppear {
            if vm.fromScreen == .favorite {
                vm.isFavorite = true
            }
        }
    }
}

struct RandomImageRowView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRowView(
            vm: ImageRowViewViewModel(
                apod: AstronomyImage(
                    title: "title", date: "date",
                    explanation: "adf",
                    url: "",
                    media_type: ""
                ),
                fromScreen: .favorite
            ), deleteAction: {}, saveAction: {}
        )
            .preferredColorScheme(.dark)
    }
}

//MARK: - ImageRowViewExtension

extension ImageRowView {
    
    private var rowView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(vm.apod.date ?? "")
                    .font(.system(size: height / 45))
                
                infoButton
            }
            
            Spacer()
            
            if vm.fromScreen == .favorite {
                Button(action: {vm.isShowingAction.toggle()}) {
                    ZStack {
                        Rectangle()
                            .opacity(0)
                            .background(.ultraThinMaterial)
                            .frame(width: width / 6, height: height / 35)
                            .cornerRadius(5)
                        
                        Image(systemName: "ellipsis")
                    }
                }
                
            } else {
                Button(action: {
                    CoreDataManager.shered.addApod(astonomyImage: vm.apod)
                    delegate.updateApods()
                    vm.isFavorite.toggle()
                }) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: height / 40))
                        .foregroundColor(vm.isFavorite ? .red : .gray)
                }
            }
        }
    }
    
    private var infoButton: some View {
        VStack {
            Button(action: {
                withAnimation { vm.showInfo() }
            }) {
                Text(vm.isShowinInfo ? "Close" : "Show info")
            }
        }
    }
    
}

