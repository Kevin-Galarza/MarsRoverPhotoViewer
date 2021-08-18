//
//  NetworkManagerProtocol.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/17/21.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchMission(for rover: Rover, completionHandler: @escaping (Mission) -> Void)
    func fetchPhotoList(for rover: Rover, on date: Date, completionHandler: @escaping (PhotoList) -> Void)
}
