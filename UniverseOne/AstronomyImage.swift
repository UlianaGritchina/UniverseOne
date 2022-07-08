//
//  AstronomyImage.swift
//  PocketSpace
//
//  Created by Ульяна Гритчина on 06.02.2022.
//

import Foundation

struct AstronomyImage: Hashable, Decodable {
    let title: String?
    let date: String?
    let explanation: String?
    let url: String?
    let media_type: String?
}
