//
//  FoundApodView.swift
//  UniverseOne
//
//  Created by Ульяна Гритчина on 18.07.2022.
//

import SwiftUI

struct FindApodView: View {
    @StateObject var vm  = FindApodViewViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack {
                    switch vm.imageState {
                    case .noImage: noImage
                    case .downloading: progress
                    case .image: image
                    }
                    Spacer()
                    datePicker.opacity(vm.isShowDetail ? 0.5 : 1)
                    findButton.opacity(vm.isShowDetail ? 0.5 : 1)
                }
            }
            .animation(.default, value: vm.imageState)
        }
        .onAppear{ vm.findImage() }
        .sheet(isPresented: $vm.isShowingDetailView) {
            ShareView(imageData: Global.shared.imageData!, isShowingShereView: $vm.isShowingDetailView)
        }
        .preferredColorScheme(.dark)
    }
    
}


struct FoundApodView_Previews: PreviewProvider {
    static var previews: some View {
        FindApodView()
    }
}

extension FindApodView {
    
    var datePicker: some View {
        DatePicker("",
                   selection: $vm.date,
                   displayedComponents: [.date])
            .datePickerStyle(.graphical)
    }
    
    var findButton: some View {
        Button(action: {vm.findImage()}) {
            Text("Find")
                .bold()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 80,
                       height: UIScreen.main.bounds.height / 20)
                .background(Color.blue .cornerRadius(10))
                .padding()
            
        }
    }
    
    var noImage: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: UIScreen.main.bounds.width - 40,
                   height: UIScreen.main.bounds.height / 3)
            .opacity(0.5)
    }
    
    var progress: some View {
        VStack {
           
            ProgressView()
                .frame(width: UIScreen.main.bounds.width - 40,
                       height: UIScreen.main.bounds.height / 3)
           
        }
    }
    
    var image: some View {
        VStack {
            if let data = vm.imageData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width - 40,
                           height: UIScreen.main.bounds.height / 3)
                    .onTapGesture {
                        withAnimation {
                            vm.isShowDetail.toggle()
                        }
                    }
            }
            
            HStack {
                Button(action: {
                    withAnimation {
                        vm.isShowDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: vm.isShowDetail ? 0 : -90))
                }
                Spacer()
            }
            .padding(.horizontal)
            
            if vm.isShowDetail {
                VStack {
                    Text(vm.astronomyImage.title ?? "")
                        .bold()
                    Text(vm.astronomyImage.explanation ?? "")
                }
                .padding(.horizontal)
            }
        }
    }
    
}
