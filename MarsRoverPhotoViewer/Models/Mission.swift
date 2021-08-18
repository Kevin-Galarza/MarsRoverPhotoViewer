//
//  Mission.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/9/21.
//

import Foundation

struct Mission: Decodable {
    let photoManifest: PhotoManifest
    
    enum CodingKeys: String, CodingKey {
        case photoManifest = "photo_manifest"
    }
}
