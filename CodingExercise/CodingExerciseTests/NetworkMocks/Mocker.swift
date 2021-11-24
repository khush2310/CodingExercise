//
//  Mocker.swift
//  CodingExerciseTests
//
//  Created by KhushRup on 24/11/21.
//

enum Mocker {
    
    struct EmptyResponse: Decodable {}
    
    enum StubError: Error {
        case fake
    }
}
