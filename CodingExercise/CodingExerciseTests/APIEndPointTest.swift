//
//  APIEndPointTest.swift
//  CodingExerciseTests
//
//  Created by KhushRup on 23/11/21.
//
import Foundation
import XCTest
import  Alamofire
@testable import CodingExercise

class APIEndPointTest: XCTestCase {

    private var endPt : EndpointItem!
    
    override func setUp() {
        super.setUp()
        endPt = makeRequest()
    }
    
    func testHttpMethod() {
        let expected = HTTPMethod.post
        XCTAssertEqual(endPt.httpMethod, expected)
    }
    
    func testBaseURL() {
        let expected = "https://ios.vividseats.com/rest/mobile"
        XCTAssertEqual(endPt.baseURL, expected)
    }
    
    func testPath() {
        let expected = "recommendations/cards"
        XCTAssertEqual(endPt.path, expected)
    }
    

}
private extension APIEndPointTest {
    
    func makeRequest() -> EndpointItem {
        return .cards(action: .recommendations)
    }
    
}
