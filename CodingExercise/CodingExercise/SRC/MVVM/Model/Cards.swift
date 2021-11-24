//
//  Cards.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import Foundation


struct Cards : Codable, Equatable {
    let topLabel : String?
    let middleLabel : String?
    let bottomLabel : String?
    let eventCount : Int?
    let image : String?
    let targetId : Int?
    let targetType : String?
    let entityId : Int?
    let entityType : String?
    let startDate : Int?
    let rank : Int?

    enum CodingKeys: String, CodingKey {

        case topLabel = "topLabel"
        case middleLabel = "middleLabel"
        case bottomLabel = "bottomLabel"
        case eventCount = "eventCount"
        case image = "image"
        case targetId = "targetId"
        case targetType = "targetType"
        case entityId = "entityId"
        case entityType = "entityType"
        case startDate = "startDate"
        case rank = "rank"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        topLabel = try values.decodeIfPresent(String.self, forKey: .topLabel)
        middleLabel = try values.decodeIfPresent(String.self, forKey: .middleLabel)
        bottomLabel = try values.decodeIfPresent(String.self, forKey: .bottomLabel)
        eventCount = try values.decodeIfPresent(Int.self, forKey: .eventCount)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        targetId = try values.decodeIfPresent(Int.self, forKey: .targetId)
        targetType = try values.decodeIfPresent(String.self, forKey: .targetType)
        entityId = try values.decodeIfPresent(Int.self, forKey: .entityId)
        entityType = try values.decodeIfPresent(String.self, forKey: .entityType)
        startDate = try values.decodeIfPresent(Int.self, forKey: .startDate)
        rank = try values.decodeIfPresent(Int.self, forKey: .rank)
    }
    
    init(topLabel : String?, middleLabel : String?, bottomLabel : String?, eventCount : Int?, image : String?, targetId : Int?, targetType : String?, entityId : Int?, entityType : String?, startDate : Int?, rank : Int?) {
        self.topLabel = topLabel
        self.middleLabel = middleLabel
        self.bottomLabel = bottomLabel
        self.eventCount = eventCount
        self.image = image
        self.targetId = targetId
        self.targetType = targetType
        self.entityId = entityId
        self.entityType = entityType
        self.startDate = startDate
        self.rank = rank
    }

}
