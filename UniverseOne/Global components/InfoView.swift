//
//  InfoView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 25.02.2022.
//

import SwiftUI

struct InfoView: View {
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    let info: String
    let title: String
    @Binding var showInfo: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0.1)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            ScrollView(showsIndicators: false){
                VStack {
                    Text(title)
                        .font(.system(size: mainHeight / 30))
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Text(info)
                        .font(.system(size: mainHeight / 40))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
        }
        .frame(width: mainWidth - 20, height: mainHeight / 1.35)
        .opacity(showInfo ? 1 : 0)
        .onTapGesture {
            showInfo.toggle()
        }
        .animation(.default, value: showInfo)
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(info: "Info", title: "Title", showInfo: .constant(true))
    }
}
