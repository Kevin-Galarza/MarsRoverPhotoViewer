//
//  CameraIdentifier.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/9/21.
//

import Foundation

/// The types of cameras onboard the rovers. Certain cameras may only be available to specific rovers.
enum CameraIdentifier: String, Decodable {
    case all     = "ALL"
    case none    = "NONE"
    case entry   = "ENTRY"
    case fhaz    = "FHAZ"
    case rhaz    = "RHAZ"
    case mast    = "MAST"
    case chemcam = "CHEMCAM"
    case mahli   = "MAHLI"
    case mardi   = "MARDI"
    case navcam  = "NAVCAM"
    case pancam  = "PANCAM"
    case minites = "MINITES"
}
