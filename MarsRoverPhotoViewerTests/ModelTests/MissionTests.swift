//
//  MissionTests.swift
//  MarsRoverPhotoViewerTests
//
//  Created by Kevin Galarza on 8/9/21.
//

import XCTest
@testable import MarsRoverPhotoViewer

class MissionTests: XCTestCase {
    
    var sut: Mission!
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMission_whenDecodedFromJSONData_doesNotThrowError() {
        XCTAssertNoThrow(sut = try ModelTestsHelper.getAndDecodeJSON(Mission.self, fileName: "mission"))
    }
}
