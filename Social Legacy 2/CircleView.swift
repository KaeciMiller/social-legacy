//
//  CircleView.swift
//  Social Legacy 2
//
//  Created by Kaeci Mill on 10/28/16.
//  Copyright © 2016 Clout, Inc. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = self.frame.width / 2
        
    }

}
