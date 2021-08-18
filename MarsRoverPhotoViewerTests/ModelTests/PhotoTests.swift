//
//  PhotoTests.swift
//  MarsRoverPhotoViewerTests
//
//  Created by Kevin Galarza on 8/9/21.
//

import XCTest
@testable import MarsRoverPhotoViewer

class PhotoTests: XCTestCase {

    var sut: Photo!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let photoList = try ModelTestsHelper.getAndDecodeJSON(PhotoList.self, fileName: "photos")
        
        sut = photoList.photos.first
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func cameraPropertyIsPopulatedWithExpectedValues() -> Bool {
        let camera = sut.camera
        
        if camera.id == 22 &&
            camera.name == .mast &&
            camera.roverID == 5 &&
            camera.fullName == "Mast Camera" {
            return true
        }
        
        return false
    }
    
    func roverPropertyIsPopulatedWithExpectedValues() -> Bool {
        let rover = sut.rover
        
        if rover.id == 5 &&
            rover.name == "Curiosity" {
            return true
        }
        
        return false
    }
    
    func testPhoto_whenDecodedFromJSONData_idPropertyEqualToExpectedValue() {
        let expectedValue = 4477
        XCTAssertEqual(expectedValue, sut.id)
    }
    
    func testPhoto_whenDecodedFromJSONData_solPropertyEqualToExpectedValue() {
        let expectedValue = 1
        XCTAssertEqual(expectedValue, sut.sol)
    }
    
    func testPhotos_whenDecodedFromJSONData_imgSrcPropertyEqualToExpectedValue() {
        let expectedValue = URL(string: "http://mars.jpl.nasa.gov/msl-raw-images/msss/00001/mcam/0001ML0000001000I1_DXXX.jpg")
        XCTAssertEqual(expectedValue, sut.imgSrc)
    }
    
    func testPhotos_whenDecodedFromJSONData_earthDatePropertyEqualToExpectedValue() {
        let expectedValue = ModelTestsHelper.makeDate(from: "2012-08-07")
        XCTAssertEqual(expectedValue, sut.earthDate)
    }
    
    func testPhotos_whenDecodedFromJSONData_cameraPropertiesArePopulatedWithExpectedValues() {
        XCTAssertTrue(cameraPropertyIsPopulatedWithExpectedValues())
    }
    
    func testPhotos_whenDecodedFromJSONData_roverPropertiesArePopulatedWithExpectedValues() {
        XCTAssertTrue(roverPropertyIsPopulatedWithExpectedValues())
    }
}
