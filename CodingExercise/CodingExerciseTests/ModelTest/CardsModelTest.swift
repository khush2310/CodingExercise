//
//  CardsModelTest.swift
//  CodingExerciseTests
//
//  Created by KhushRup on 23/11/21.
//

import XCTest
@testable import CodingExercise

class CardsModelTest: XCTestCase {
    
    private var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        decoder  = JSONDecoder()
    }
    
    func testRoot() {
        XCTAssertNoThrow(try decoder.decode([Cards].self, from: makeResponse()))
    }
    
    func testCards() {
        let sut = try? decoder.decode([Cards].self, from: makeResponse())
        let expected = makeCards()
        XCTAssertEqual(sut, expected)
    }
    
}
private extension CardsModelTest {
    
    func makeCards() -> [Cards] {
        [
            Cards(topLabel: "The Book Of Mormon",
                  middleLabel: "ASU Gammage - Tempe, AZ",
                  bottomLabel: "Fri, May 19 - Sun, May 28",
                  eventCount: 13,
                  image: "https://a.vsstatic.com/mobile/app/theater/book-of-mormon.jpg",
                  targetId: 25373,
                  targetType: "PERFORMER",
                  entityId: 25373,
                  entityType: "PERFORMER",
                  startDate: 1495240200000,
                  rank: 270),
            Cards(topLabel: "Eric Church",
                  middleLabel: "Verizon Center - Washington, DC",
                  bottomLabel: "Fri, May 19, 8:00PM",
                  eventCount: 1,
                  image: "https://a.vsstatic.com/mobile/app/concerts/eric-church.jpg",
                  targetId: 2119461,
                  targetType: "EVENT",
                  entityId: 9420,
                  entityType: "PERFORMER",
                  startDate: 1495242000000,
                  rank: 260)
        ]
    }
    
    func makeResponse() -> Data {
          return Data(
            """
                 [
                    {
                        "topLabel": "The Book Of Mormon",
                        "middleLabel": "ASU Gammage - Tempe, AZ",
                        "bottomLabel": "Fri, May 19 - Sun, May 28",
                        "eventCount": 13,
                        "image": "https://a.vsstatic.com/mobile/app/theater/book-of-mormon.jpg",
                        "targetId": 25373,
                        "targetType": "PERFORMER",
                        "entityId": 25373,
                        "entityType": "PERFORMER",
                        "startDate": 1495240200000,
                        "rank": 270
                    },
                    {
                        "topLabel": "Eric Church",
                        "middleLabel": "Verizon Center - Washington, DC",
                        "bottomLabel": "Fri, May 19, 8:00PM",
                        "eventCount": 1,
                        "image": "https://a.vsstatic.com/mobile/app/concerts/eric-church.jpg",
                        "targetId": 2119461,
                        "targetType": "EVENT",
                        "entityId": 9420,
                        "entityType": "PERFORMER",
                        "startDate": 1495242000000,
                        "rank": 260
                    }
                ]
            """.utf8)
    }
    
}
