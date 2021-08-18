//
//  PhotoManifest.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/9/21.
//

import Foundation

/**
 The Photo Manifest will list details of the rover's overall mission and photo data. The manifest can be used to help users search for and filter the available photos for a selected rover.
 */
struct PhotoManifest: Decodable {
    let name:        Rover
    let landingDate: Date
    let launchDate:  Date
    let status:      String
    let maxSol:      Int
    let maxDate:     Date
    let totalPhotos: Int
    let photoMeta:   [PhotoMeta]
    
    enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate  = "launch_date"
        case status
        case maxSol      = "max_sol"
        case maxDate     = "max_date"
        case totalPhotos = "total_photos"
        case photoMeta   = "photos"
    }
    
    struct PhotoMeta: Decodable {
        let sol:              Int
        let earthDate:        Date
        let totalPhotos:      Int
        let availableCameras: [CameraIdentifier]
        
        enum CodingKeys: String, CodingKey {
            case sol
            case earthDate        = "earth_date"
            case totalPhotos      = "total_photos"
            case availableCameras = "cameras"
        }
    }
}
