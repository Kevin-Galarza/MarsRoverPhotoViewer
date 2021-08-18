//
//  TestUtility.swift
//  MarsRoverPhotoViewerTests
//
//  Created by Kevin Galarza on 8/9/21.
//

import XCTest

class ModelTestsHelper {
    
    static func makeDate(from dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: dateString)!
    }
    
    static func dataFromJSONFileNamed(_ name: String) throws -> Data {
        let url = try XCTUnwrap(Bundle(for: self).url(forResource: name, withExtension: "json"))
        return try Data(contentsOf: url)
    }
    
    static func getAndDecodeJSON<T>(_ type: T.Type, fileName: String) throws -> T where
        T : Decodable {
        let data = try ModelTestsHelper.dataFromJSONFileNamed(fileName)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return try decoder.decode(type, from: data)
    }
}
