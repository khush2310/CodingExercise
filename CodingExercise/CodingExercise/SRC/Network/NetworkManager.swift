//
//  NetworkManager.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD
import SystemConfiguration

class ErrorObject: Codable {
    
    let message: String
    let key: String?
    
}

class AlertMessage {
    
    var title = Constants.defaultAlertTitle
    var body = Constants.defaultAlertMessage
    
    init(title:String, body:String) {
        self.title = title
        self.body = body
    }
}

class Constants {
    static let defaultAlertTitle = "Demo"
    static let defaultAlertMessage = "Something went wrong. Please try again."
}


import Alamofire

protocol NetworkService {
    
    func call<T:Codable>(type: EndPointType, params: Parameters?, handler: @escaping (Result<T, Error>) -> Void)
    func getNetworkEnv() -> NetworkEnvironment
}

final class NetworkServiceImpl: NetworkService {
    
    private let queue: DispatchQueue
    private let session: Session
    private let decoder: JSONDecoder
    private let networkEnviroment: NetworkEnvironment
    
    init(queue: DispatchQueue, session: Session, decoder: JSONDecoder, networkEnviroment: NetworkEnvironment) {
        self.queue = queue
        self.session = session
        self.decoder = decoder
        self.networkEnviroment = networkEnviroment
    }
    
    func getNetworkEnv() -> NetworkEnvironment {
        return networkEnviroment
    }
    func call<T:Codable>(type: EndPointType, params: Parameters? = nil, handler: @escaping (Result<T, Error>)->()) {
        SVProgressHUD.show()
        self.session.request(type.url,
                             method: type.httpMethod,
                             parameters: params!,
                             encoding: type.encoding,
                             headers: type.headers)
            .validate(statusCode: 200..<300)
            .responseJSON { data in
                SVProgressHUD.dismiss()
                switch data.result {
                
                
                case .success(_):
                    do {
                        if let jsonData = data.data {
                            let model = try self.decoder.decode(T.self, from: jsonData)
                            handler(.success(model))
                        }
                        
                    } catch let error {
                        handler(.failure(error))
                    }
                case .failure(let error):
                    handler(.failure(error))
                    
                }
            }
    }
}


struct AppFactory {
    
    let networkService: NetworkService
    
    // MARK: - Accessors
    static let shared = AppFactory()
    
    private init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        networkService = NetworkServiceImpl(queue: DispatchQueue(label: "queue.network.parser"),
                                            session: .default,
                                            decoder: decoder, networkEnviroment: .dev)
    }
    
    
    
}
