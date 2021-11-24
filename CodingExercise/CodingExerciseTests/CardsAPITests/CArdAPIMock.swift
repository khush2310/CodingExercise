//
//  CArdAPIMock.swift
//  CodingExerciseTests
//
//  Created by KhushRup on 24/11/21.
//

//import Foundation
//import Alamofire
//import XCTest
//@testable import CodingExercise
//
//final class CardAPITests: XCTestCase {
//
//    private var sut: CardsAPI!
//    private let repository = MockCardApi()
//    private let networkService = NetworkServiceMock<Mocker.EmptyResponse>()
//    private let mockParam = ["":""]
//    
//    override func setUp() {
//        super.setUp()
//        sut = CardsAPI(networkService: networkService)
//    }
//    
//    func testSuccess() {
//            self.repository.recommendations(param: self.mockParam) { result in
//                            switch result {
//                            case .success(let root):
//                                let expected = [Cards]()
//                                XCTAssertEqual(root, expected)
//                            case .failure(_):
//                                XCTFail()
//                            }
//                        }
//    }
//    
//    func testFailure() {
//        repository.success = false
//        self.repository.recommendations(param: mockParam) { result in
//                            switch result {
//                            case .success(_):
//                                XCTFail()
//                            case .failure(let error):
//                                XCTAssertEqual(error as! Mocker.StubError, Mocker.StubError.fake)
//                            }
//                        }
//    }
//}
//
//private final class MockCardApi: CardsAPIProtocol {
//    
//    var success = true
//    
//    func recommendations(param: [String : Any], handler: @escaping (Result<[Cards], Error>) -> Void) {
//        guard success else {
//            handler(.failure(Mocker.StubError.fake))
//            return
//        }
//        
//        handler(.success( [Cards]()))
//    }
//    
//}
//extension XCTestCase {
//    
//    func expectation(timeout: TimeInterval = 3.0,
//                     handler: @escaping (XCTestExpectation) -> Void) {
//        let expectation = XCTestExpectation(description: "com.demo.app.async.expectation")
//        handler(expectation)
//        wait(for: [expectation], timeout: timeout)
//    }
//    
//}
