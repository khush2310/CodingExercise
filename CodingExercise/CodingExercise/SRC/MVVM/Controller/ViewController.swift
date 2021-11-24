//
//  ViewController.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collView: UICollectionView!
    private var cardsViewMiodel : CardsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    func setUp() {
        cardsViewMiodel = CardsViewModel()
        cardsViewMiodel.reloadData = {
            self.collView.reloadData()
        }
        
        collView.register(UINib(nibName: "CardsCVC", bundle: nil), forCellWithReuseIdentifier: "CardsCVC")
        
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 20

        let layout = UICollectionViewCompositionalLayout(section: section)
        collView.collectionViewLayout = layout
        
        
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cardsViewMiodel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CardsCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsCVC", for: indexPath) as! CardsCVC
        cell.configure(data: cardsViewMiodel.itemForIndex(index: indexPath.row))
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegate{
    
}
