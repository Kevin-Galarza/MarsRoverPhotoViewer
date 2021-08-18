//
//  SearchViewModel.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/16/21.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    let networkManager: NetworkManagerProtocol
    
    var missions: [Rover: Mission] = [:]
    
    @Published var selectedRover: Rover = .curiosity {
        didSet {
            dateRange = getDateRange()
            availableCameras = getAvailableCameras()
            selectedDate = dateRange.upperBound
        }
    }
    @Published var selectedDate: Date = Date() {
        didSet {
            availableCameras = getAvailableCameras()
        }
    }
    @Published var selectedCamera:   CameraIdentifier   = .none
    @Published var dateRange:        ClosedRange<Date>  = Date()...Date()
    @Published var availableCameras: [CameraIdentifier] = [.none]
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        refreshMissions()
    }
    
    func refreshMissions() {
        for rover in Rover.allCases {
            networkManager.fetchMission(for: rover) { mission in
                self.missions[rover] = mission
                
                if rover == self.selectedRover {
                    self.dateRange = self.getDateRange()
                    self.availableCameras = self.getAvailableCameras()
                    self.selectedDate = self.dateRange.upperBound
                }
            }
        }
    }
    
    private func getDateRange() -> ClosedRange<Date> {
        guard let startDate = missions[selectedRover]?.photoManifest.landingDate,
              let endDate   = missions[selectedRover]?.photoManifest.maxDate
        else {
            print("Unable to get date range from photo manifest.")
            return Date()...Date()
        }
        
        return startDate...endDate
    }
    
    private func getAvailableCameras() -> [CameraIdentifier] {
        guard let photoMeta = missions[selectedRover]?.photoManifest.photoMeta else {
            print("Unable to get available cameras from photo manifest.")
            selectedCamera = .none
            return [.none]
        }
        
        for record in photoMeta {
            if record.earthDate == selectedDate {
                selectedCamera = .all
                var availableCameras = record.availableCameras
                availableCameras.insert(.all, at: 0)
                return availableCameras
            }
        }
        
        selectedCamera = .none
        return [.none]
    }
}
