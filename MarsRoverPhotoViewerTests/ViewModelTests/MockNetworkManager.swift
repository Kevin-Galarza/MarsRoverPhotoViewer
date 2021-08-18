//
//  MockNetworkManager.swift
//  MarsRoverPhotoViewerTests
//
//  Created by Kevin Galarza on 8/17/21.
//

import Foundation
@testable import MarsRoverPhotoViewer

class MockNetworkManager: NetworkManagerProtocol {
    func fetchMission(for rover: Rover, completionHandler: @escaping (Mission) -> Void) {
        <#code#>
    }
    
    func fetchPhotoList(for rover: Rover, on date: Date, completionHandler: @escaping (PhotoList) -> Void) {
        <#code#>
    }
}
