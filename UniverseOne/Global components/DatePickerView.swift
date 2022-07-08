//
//  DatePickerView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 19.03.2022.
//

import SwiftUI

struct DatePickerView: View {
    let mainHeight = UIScreen.main.bounds.height
    let mainWidth = UIScreen.main.bounds.width
    @Binding var show: Bool
    @Binding var date: Date
    let viewModel: ApodViewModel
    var body: some View {
        VStack {
            DatePicker("Start Date",
                       selection: $date,
                       displayedComponents: [.date])
                .datePickerStyle(.graphical)
            
            Button(action: {findImage(date: date)}) {
                ZStack {
                    Capsule()
                        .stroke()
                        .frame(width: mainWidth / 2, height: mainHeight / 20)
                    Text("Find")
                        .font(.system(size: mainHeight / 45))
                        .bold()
                }
            }
        }
        .padding()
        .background(Rectangle()
                        .frame(width: mainWidth - 20, height: mainHeight / 2)
                        .opacity(0)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20))
     
        .opacity(show ? 1 : 0)
        .animation(.default, value: show)
    }
    private func findImage(date: Date)  {
        viewModel.fetchAstronomyData(from: date)
        show.toggle()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(show: .constant(true),
                       date: .constant(Date()),
                       viewModel: ApodViewModel())
    }
}

