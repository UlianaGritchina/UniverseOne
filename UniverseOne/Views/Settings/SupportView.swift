//
//  SupportView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 10.04.2022.
//

import SwiftUI

struct SupportView: View {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment: .leading) {
            Text("Support")
                .bold()
                .padding(.top)
                .font(.system(size: height / 35))
            Text("This app can be better becouse of you")
            
            Rectangle()
                .frame(width: width - 40, height: height / 10)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    HStack() {
                        ReviewButton()
                        TinkoffButton()
                    }
                )
        }
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
            .preferredColorScheme(.dark)
    }
}

struct PriceRectangle: View {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    let text: String
    var body: some View {
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Rectangle()
                .frame(width: width / 3, height: height / 20)
                .foregroundColor(.white)
                .opacity(0.2)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                .overlay(
                    Text(text)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: height / 40))
                )
        }
    }
}

struct TinkoffButton: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width / 2.5, height: height / 20)
                    .foregroundColor(.yellow)
                
                Link(destination: URL(string: "https://www.tinkoff.ru/cf/1yvFPYgx2ff")!) {
                    Text("Tinkoff")
                        .bold()
                        .font(.system(size: height / 45))
                        .foregroundColor(.black)
                        .frame(width: width / 2.5, height: height / 20)
                }
            }
        }
    }
}

struct ReviewButton: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width / 2.5, height: height / 20)
                    .foregroundColor(Color("Color"))
            
                Link(destination: URL(string: "https://apps.apple.com/ru/app/pocket-universe/id1620311799")!) {
                    Text("Write a review")
                        .bold()
                        .font(.system(size: height / 45))
                        .foregroundColor(.white)
                        .frame(width: width / 2.5, height: height / 20)
                }
            }
        }
    }
}

