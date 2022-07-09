//
//  MainView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 25.02.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    var body: some View {
        ZStack {
            BackView(back: vm.back)
            
            selectedScreen
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height / 1.2)
            
            VStack {
                TitleView(title: vm.screen.rawValue,
                          findAction: {vm.showDatePicker.toggle()},
                          date: vm.date)
                    .padding(.top, -UIScreen.main.bounds.height / 60)
                
                Spacer()
                
                CustomTabBarView(screen: $vm.screen)
                    .padding(.bottom, -UIScreen.main.bounds.height / 50)
            }
            
            LogoView(isShowingLounh: vm.isShowingLounh, isDown: vm.isDown)
            
        }
        .preferredColorScheme(.dark)
        .onAppear { vm.animateLounch() }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    private var selectedScreen: some View {
        ZStack {
            ApodView(showDatePicker: $vm.showDatePicker)
                .opacity(vm.screen == .apod ? 1 : 0)
            FavoriteView()
                .opacity(vm.screen == .favorite ? 1 : 0)
            RandomView()
                .opacity(vm.screen == .random ? 1 : 0)
            VStack {
                SettingsView(back: $vm.back)
                    .opacity(vm.screen == .settings ? 1 : 0)
                Spacer()
            }
        }
    }
}

struct LogoView: View {
    let isShowingLounh: Bool
    let isDown: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.black)
                .ignoresSafeArea()
                .opacity(isShowingLounh ? 1 : 0)
                .animation(.default, value: isShowingLounh)
            
            VStack(spacing: 0) {
                Text("🛸")
                    .font(.system(size: isShowingLounh
                                  ? UIScreen.main.bounds.height / 10
                                  : 0))
                LinearGradient(colors: [.blue,.green],
                               startPoint: .leading,
                               endPoint: .trailing)
                    .mask(
                        Text("Universe One")
                            .bold()
                            .font(.system(size: isShowingLounh
                                          ? UIScreen.main.bounds.height / 25
                                          : 0))
                    )
                    .frame(height: UIScreen.main.bounds.height / 20)
            }
            .opacity(isShowingLounh ? 1 : 0)
            .rotationEffect(Angle(degrees: isShowingLounh ? 0 : 500))
            .animation(.default, value: isShowingLounh)
            .offset(x: 0, y: isDown ? 0 : -UIScreen.main.bounds.height)
            .animation(
                .spring(response: 0.9,
                        dampingFraction: 0.6,
                        blendDuration: 1),
                value: isDown)
        }
    }
}

