//
//  classCall.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import Foundation

protocol CardsAPIProtocol {
    func recommendations(param:[String:Any], handler: @escaping (Result<[Cards], Error>) -> Void)
}

struct CardsAPI:CardsAPIProtocol {
    
    let networkService: NetworkService
    
    func recommendations(param:[String:Any], handler: @escaping (Result<[Cards], Error>) -> Void) {
        networkService.call(type: EndpointItem.cards(action: .recommendations), params: param, handler: handler)
        
    }

}
