//
//  NetworkServiceMock.swift
//  CodingExerciseTests
//
//  Created by KhushRup on 24/11/21.
//
import Foundation
import Alamofire
import XCTest
@testable import CodingExercise

final class NetworkServiceMock<Model: Decodable>: NetworkService {
    
    var mockResult: Result<Model, Error>?
    
    func call<T>(type: EndPointType, params: Parameters?, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        if let mockResult = mockResult as? Result<T, Error> {
            handler(mockResult)
        }
        
    }
    
    func getNetworkEnv() -> NetworkEnvironment {
        return .dev
    }
    
}


