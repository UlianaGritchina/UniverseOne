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
                .frame(height: UIScreen.main.bounds.height / 1.2)
            
            VStack {
                TitleView(title: vm.screen.rawValue,
                          findAction: {vm.showDatePicker.toggle()},
                          date: vm.date)
                    .padding(.top, -UIScreen.main.bounds.height / 60)
                
                Spacer()
                
                CustomTabBarView(screen: $vm.screen)
                    .padding(.bottom, -UIScreen.main.bounds.height / 50)
            }
        }
        .preferredColorScheme(.dark)
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




