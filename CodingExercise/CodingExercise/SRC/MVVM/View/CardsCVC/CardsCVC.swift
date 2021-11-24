//
//  CardsCVC.swift
//  CodingExercise
//
//  Created by KhushRup on 22/11/21.
//

import UIKit
import SDWebImage

class CardsCVC: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data:Cards) {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.lbTitle.text = data.topLabel ?? ""
        self.imgView.sd_setImage(with: URL(string: data.image ?? ""), completed: nil)
        
    }

}
