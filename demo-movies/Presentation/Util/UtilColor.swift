//
//  UtilColor.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

class UtilColor {
    static func get(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    //TrueSafe BrandColor
    static func getBrand() -> UIColor {
        return UIColor(red: 130/255, green: 200/255, blue: 20/255, alpha: 1)
    }
}
