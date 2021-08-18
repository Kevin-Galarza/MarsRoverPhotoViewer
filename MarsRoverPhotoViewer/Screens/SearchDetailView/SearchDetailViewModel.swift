//
//  SearchDetailViewModel.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/16/21.
//

import Foundation

final class SearchDetailViewModel: ObservableObject {
    
    let networkManager: NetworkManagerProtocol
    
    @Published var photos: [Photo] = []
    
    let selectedRover:  Rover
    let selectedDate:   Date
    let selectedCamera: CameraIdentifier
    
    init(networkManager: NetworkManagerProtocol,
         selectedRover: Rover,
         selectedDate: Date,
         selectedCamera: CameraIdentifier) {
        self.networkManager = networkManager
        self.selectedRover  = selectedRover
        self.selectedDate   = selectedDate
        self.selectedCamera = selectedCamera
        
        refreshPhotoList()
    }
    
    func refreshPhotoList() {
        networkManager.fetchPhotoList(for: selectedRover, on: selectedDate) { photoList in
            if self.selectedCamera == .all {
                self.photos = photoList.photos
            } else {
                self.photos = photoList.photos.filter({ $0.camera.name == self.selectedCamera })
            }
        }
    }
 }
