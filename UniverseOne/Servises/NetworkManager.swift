//
//  NetworkManager.swift
//  APOD
//
//  Created by Ульяна Гритчина on 26.02.2022.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case badURL
    case noData
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from date: Date) async throws -> AstronomyImage {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringDate = dateFormatter.string(from: date)
        
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?date=\(stringDate)&api_key=j927yMuuumpGvzeDtYe5YUsObO9FzOEnNhp0FnZX") else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let astronomyImage = try? JSONDecoder().decode(AstronomyImage.self, from: data) else {
            throw NetworkError.noData
        }
        return astronomyImage
    }
    
    func fetchData() async throws -> AstronomyImage {
        
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?&api_key=j927yMuuumpGvzeDtYe5YUsObO9FzOEnNhp0FnZX") else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let astronomyImage = try? JSONDecoder().decode(AstronomyImage.self, from: data) else {
            throw NetworkError.noData
        }
        return astronomyImage
    }
    
    
    func fetcRandomImages() async throws -> [AstronomyImage] {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=j927yMuuumpGvzeDtYe5YUsObO9FzOEnNhp0FnZX&count=15") else {
            throw NetworkError.badURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let astronomyImage = try? JSONDecoder().decode([AstronomyImage].self, from: data) else {
            throw NetworkError.noData
        }
        
        return astronomyImage
        
    }
    
    func downloadImage(from stringUrl: String, completion: @escaping (_ image: UIImage?, _ data: Data?, _ networkState: NetworkState) -> ()) {
        
        guard let url = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, networkState in
            guard
                let data = data,
                let image = UIImage(data: data),
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    completion(nil, nil, .loadingError)
                    return
                }
            completion(image, data, .loaded)
        }
        .resume()
    }
    
}
