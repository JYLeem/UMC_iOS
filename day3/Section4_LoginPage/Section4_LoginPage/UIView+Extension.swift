//
//  UIView+Extension.swift
//  Section4_LoginPage
//
//  Created by Jinyoung Leem on 4/8/24.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat{ // 모서리
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        
        
    }
    
    
}
