//
//  MissionManifestTests.swift
//  MarsRoverPhotoViewerTests
//
//  Created by Kevin Galarza on 8/9/21.
//

import XCTest
@testable import MarsRoverPhotoViewer

class PhotoManifestTests: XCTestCase {
    
    var sut: PhotoManifest!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let mission = try ModelTestsHelper.getAndDecodeJSON(Mission.self, fileName: "mission")
        
        sut = mission.photoManifest
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func photoMetaPropertyIsPopulatedWithExpectedValues() -> Bool {
        guard let photo = sut.photoMeta.first else { return false }
        
        if photo.sol == 1 &&
            photo.earthDate == ModelTestsHelper.makeDate(from: "2004-01-26") &&
            photo.totalPhotos == 95 &&
            photo.availableCameras == [.entry, .fhaz, .navcam, .pancam, .rhaz] {
            return true
        }
        
        return false
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_namePropertyEqualToExpectedValue() {
        let expectedValue = Rover.opportunity
        XCTAssertEqual(expectedValue, sut.name)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_landingDatePropertyEqualToExpectedValue() {
        let expectedValue = ModelTestsHelper.makeDate(from: "2004-01-25")
        XCTAssertEqual(expectedValue, sut.landingDate)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_launchDatePropertyEqualToExpectedValue() {
        let expectedValue = ModelTestsHelper.makeDate(from: "2003-07-07")
        XCTAssertEqual(expectedValue, sut.launchDate)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_statusPropertyEqualToExpectedValue() {
        let expectedValue = "complete"
        XCTAssertEqual(expectedValue, sut.status)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_maxSolPropertyEqualToExpectedValue() {
        let expectedValue = 5111
        XCTAssertEqual(expectedValue, sut.maxSol)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_maxDatePropertyEqualToExpectedValue() {
        let expectedValue = ModelTestsHelper.makeDate(from: "2018-06-11")
        XCTAssertEqual(expectedValue, sut.maxDate)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_totalPhotosPropertyEqualToExpectedValue() {
        let expectedValue = 198439
        XCTAssertEqual(expectedValue, sut.totalPhotos)
    }
    
    func testPhotoManifest_whenDecodedFromJSONData_photoMetaPropertiesArePopulatedWithExpectedValues() {
        XCTAssertTrue(photoMetaPropertyIsPopulatedWithExpectedValues())
    }
}
