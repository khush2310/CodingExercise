//
//  CardAPITests.swift
//  CodingExerciseTests
//
//  Created by KhushRup on 24/11/21.
//

import XCTest
@testable import CodingExercise

final class CardsAPITests: XCTestCase {
    
    private var service = NetworkServiceMock<[Cards]>()
    private var sut: CardsAPI!
    private let mockParam = ["":""]
    
    override func setUp() {
        super.setUp()
        sut = CardsAPI(networkService: service)
    }
    
    func testSuccess() {
        service.mockResult = .success([Cards]())
        
        let expected = [Cards]()
        var result: Result<[Cards], Error>?
        
        sut.recommendations(param: mockParam) { result = $0 }
        XCTAssertNoThrow(try result?.get())
        XCTAssertEqual(try result?.get(), expected)
    }
    
    func testFailure() {
        service.mockResult = .failure(Mocker.StubError.fake)
        
        var result: Result<[Cards], Error>?
        
        sut.recommendations(param: mockParam) { result = $0 }
        
        XCTAssertThrowsError(try result?.get())
    }
    
}
