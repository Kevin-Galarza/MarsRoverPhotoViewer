//
//  Rover.swift
//  MarsRoverPhotoViewer
//
//  Created by Kevin Galarza on 8/9/21.
//

import Foundation

/// The types of rovers on Mars for which photos are available.
enum Rover: String, Decodable, CaseIterable {
    case curiosity   = "Curiosity"
    case opportunity = "Opportunity"
    case spirit      = "Spirit"
}
