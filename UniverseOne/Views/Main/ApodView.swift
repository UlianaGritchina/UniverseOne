//
//  ApodView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 05.06.2022.
//

import SwiftUI
import CoreData

struct ApodView: View {
    @State private var date = Date()
    @Binding var showDatePicker: Bool
    @StateObject private var viewModel = ApodViewModel()
    
    var body: some View {
        ZStack {
            
            
            MainImageView(infoAction: {viewModel.showInfo()},
                          saveAction: {
                viewModel.saveApod(viewModel.astronomyImage)
            },
                          stringUrl: viewModel.astronomyImage.url ?? "",
                          mediaType: viewModel.astronomyImage.media_type ?? "")
            
            InfoView(info: viewModel.astronomyImage.explanation ?? "",
                     title: viewModel.astronomyImage.title ?? "",
                     showInfo: $viewModel.isShowInfo)
            
            DatePickerView(show: $showDatePicker,
                           date: $date, viewModel: viewModel)
            
            
            
        }
    }
}


struct ApodView_Previews: PreviewProvider {
    static var previews: some View {
        ApodView(showDatePicker: .constant(false))
    }
}
