//
//  TitleView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 25.02.2022.
//

import SwiftUI

struct TitleView: View {
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    @State private var isShowingFindApod = false
    let title: String
    let findAction: () -> Void
    let date: Date
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYY"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: mainWidth - 20, height: mainHeight / 13)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .opacity(0.2)
                )
            
            Gradient(title: title)
            
                .mask(
                    VStack {
                        Text(title)
                            .bold()
                            .font(.system(size: mainHeight / 25))
                    }
                )
                .frame(width: mainWidth - 20, height: mainHeight / 10)
        }
        
        .onTapGesture {
            if title == "APOD" {
                isShowingFindApod = true
            }
        }
        
        .sheet(isPresented: $isShowingFindApod) {
            FoundApodView()
        }
        
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "APOD", findAction: {}, date: Date())
    }
}


struct Gradient: View {
    let title: String
    var body: some View {
        VStack {
            if title == "APOD" {
                LinearGradient(colors: [.blue, .purple],
                               startPoint: .leading,
                               endPoint: .trailing)
            }
            if title == "Favorite" {
                LinearGradient(colors: [.pink, .purple],
                               startPoint: .leading,
                               endPoint: .trailing)
            }
            if title == "Random" {
                LinearGradient(colors: [.green, .blue],
                               startPoint: .leading,
                               endPoint: .trailing)
            }
            if title == "Settings" {
                LinearGradient(colors: [.white, .gray],
                               startPoint: .leading,
                               endPoint: .trailing)
            }
        }
    }
}
