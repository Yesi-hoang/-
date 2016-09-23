//
//  NewFeatureCell.swift
//  照抄花田小憩
//
//  Created by Yesi on 16/9/9.
//  Copyright © 2016年 Yesi. All rights reserved.
//

import UIKit

class NewFeatureCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            if let img = image{
                imageView.image = img
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
