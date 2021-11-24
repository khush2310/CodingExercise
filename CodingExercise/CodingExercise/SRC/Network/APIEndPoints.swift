//
//  APIEndPoints.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import Foundation
import SystemConfiguration
import Alamofire
@testable import CodingExercise

protocol EndPointType {
    
    // MARK: - Vars & Lets
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    
}
enum EndpointItem {
    
    // MARK: User actions
    case cards(action: Cards)
    
    
    enum Cards: String {
        case recommendations       = "recommendations/cards"
    }
    
    
}

// MARK: - Extensions
// MARK: - EndPointType
extension EndpointItem: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        
        switch AppFactory.shared.networkService.getNetworkEnv() {
        case .dev: return "https://ios.vividseats.com/rest/mobile"
        case .production: return "https://ios.vividseats.com/rest/mobile"
        case .stage: return "https://ios.vividseats.com/rest/mobile"
        }
    }
    
    var version: String {
        return "v2"
    }
    
    var path: String {
        switch self {
        case .cards(action: let action):
            switch action {
            case .recommendations:
                return action.rawValue
            }
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .cards(action: let action):
            switch action {
            case .recommendations:
                return .post
            }
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .cards(action: let action):
            switch action {
            case .recommendations:
                return ["Content-Type": "application/json",
                        "X-Mobile-Platform": "iOS"]
            }
        }
    }
    
    var url: URL {
        switch self {
        case .cards(action: let action):
            switch action {
            case .recommendations:
                return URL(string: self.baseURL + "/" + self.version + "/" + self.path)!
            }
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {

        case .cards(action: let action):
            switch action {
            case .recommendations:
                return JSONEncoding.default
            }
        }
    }
    
}
