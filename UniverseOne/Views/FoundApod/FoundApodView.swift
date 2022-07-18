//
//  FoundApodView.swift
//  UniverseOne
//
//  Created by Ульяна Гритчина on 18.07.2022.
//

import SwiftUI

struct FoundApodView: View {
    @State private var date = Date()
    var body: some View {
        ZStack {
            BackView(back: .back)
            VStack {
                Spacer()
                ImageView(stringUrl: "https://apod.nasa.gov/apod/image/2207/Quintet_JwstHstEtcGendler_2413.jpg",
                          mediaType: "image")
                    .frame(width: UIScreen.main.bounds.width - 40,
                           height: UIScreen.main.bounds.height / 3)
                Spacer()
                
                DatePicker("",
                           selection: $date,
                           displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                
                Button(action: {}) {
                    Text("Find")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 80,
                               height: UIScreen.main.bounds.height / 20)
                        .background(Color.blue .cornerRadius(10))
                        .padding()
                        
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct FoundApodView_Previews: PreviewProvider {
    static var previews: some View {
        FoundApodView()
    }
}
