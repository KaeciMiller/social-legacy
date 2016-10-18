//
//  FancyField.swift
//  Social Legacy 2
//
//  Created by Kaeci Mill on 10/17/16.
//  Copyright © 2016 Clout, Inc. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 3.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
}
