//
//  UIColor-Extension.swift
//  Chat App3(firebase)
//
//  Created by Kyohei Morinaka on 2021/04/11.
//

import UIKit

extension UIColor {
    
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

