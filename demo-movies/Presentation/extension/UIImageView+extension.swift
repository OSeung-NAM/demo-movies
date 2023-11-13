//
//  UIImageView.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func imageDownLoad(url: String) {
        self.kf.indicatorType = .activity
        (self.kf.indicator?.view as? UIActivityIndicatorView)?.color = UtilColor.get(r: 130, g: 130, b: 130, alpha: 1)
        self.kf.setImage(with: URL(string: url))
    }
}
