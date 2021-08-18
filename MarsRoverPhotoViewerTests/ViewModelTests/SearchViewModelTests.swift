//
//  SearchViewModelTests.swift
//  MarsRoverPhotoViewerTests
//
//  Created by Kevin Galarza on 8/17/21.
//

import XCTest
@testable import MarsRoverPhotoViewer

class SearchViewModelTests: XCTestCase {
    
    var sut: SearchViewModel!

    override func setUp() {
        super.setUp()
        sut = SearchViewModel(networkManager: MockNetworkManager())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
