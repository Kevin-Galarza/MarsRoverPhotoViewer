//
//  NetworkManager.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/15/21.
//

import Foundation

// TODO: - Check if user is connected to network before making a request.

final class NetworkManager: NetworkManagerProtocol {
    func fetchMission(for rover: Rover, completionHandler: @escaping (Mission) -> Void) {
        var endpoint: APIClient.Endpoint
        switch rover {
        case .curiosity:
            endpoint = .curiosityManifest
        case .opportunity:
            endpoint = .opportunityManifest
        case .spirit:
            endpoint = .spiritManifest
        }
        
        APIClient.shared.GET(endpoint: endpoint, params: nil) { (result: Result<Mission, APIClient.APIError>) in
            switch result {
            case let .success(response):
                completionHandler(response)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func fetchPhotoList(for rover: Rover, on date: Date, completionHandler: @escaping (PhotoList) -> Void) {
        var endpoint: APIClient.Endpoint
        switch rover {
        case .curiosity:
            endpoint = .curiosityPhotos
        case .opportunity:
            endpoint = .opportunityPhotos
        case .spirit:
            endpoint = .spiritPhotos
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateFormatter.string(from: date)
        
        APIClient.shared.GET(endpoint: endpoint, params: ["earth_date": dateString]) { (result: Result<PhotoList, APIClient.APIError>) in
            switch result {
            case let .success(response):
                completionHandler(response)
            case let .failure(error):
                print(error)
            }
        }
    }
}
