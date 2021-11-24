//
//  CardsViewModel.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import Foundation

class CardsViewModel : NSObject {
    
    
    private(set) var recCards : [Cards]! {
        didSet {
            self.reloadData()
        }
    }
    
    lazy var dateFormatter : DateFormatter! = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    var reloadData : (() -> ()) = {}
    
    var cardsAPIStruct : CardsAPI!
    
    override init() {
        super.init()
        cardsAPIStruct = CardsAPI(networkService: AppFactory.shared.networkService)
        getCardsRecommendations()
    }
    
    
    func getCardsRecommendations() {
        cardsAPIStruct.recommendations(param: ["startDate": getStartDate(),
                                         "endDate": getEndDate(),
                                         "includeSuggested": true] ) { result in
            switch result {
            case .success(let cardsData):
                if (cardsData != nil) {
                let sorted = cardsData.sorted(by: {
                                                if ($0.startDate ?? 0 != $1.startDate ?? 0){
                                                    return $0.startDate ?? 0 < $1.startDate ?? 0
                                                } else{
                                                    return $0.rank ?? 0 < $1.rank ?? 0
                                                }})
                self.recCards = sorted;
                self.reloadData()
            }
            case .failure(let error):
                print("error",error);
                break
                
            }
        }
    }
    
    func numberOfItems() -> Int {
        return recCards?.count ?? 0
    }
    
    func itemForIndex(index:Int) -> Cards {
        return recCards[index]
    }
    private func getStartDate() -> String{
        let today = Date()
        let date = dateFormatter.string(from: today)
        return date
    }
    
    private func getEndDate() -> String{
        let otherDate = Calendar.current.date(byAdding: .day, value: 3, to: Date())
        let date = dateFormatter.string(from: otherDate ?? Date())
        return date
    }
    
}
