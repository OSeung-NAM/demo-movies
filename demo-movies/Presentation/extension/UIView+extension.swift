//
//  UIView+extension.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

extension UIView {
    
    class ClickListener: UITapGestureRecognizer {
        var onClick : (() -> Void)? = nil
    }
    
    func setOnClickListener(action :@escaping () -> Void){
        let tapRecogniser = ClickListener(target: self, action: #selector(onViewClicked(sender:)))
        tapRecogniser.onClick = action
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapRecogniser)
    }
     
    @objc func onViewClicked(sender: ClickListener) {
        if let onClick = sender.onClick {
            onClick()
        }
    }
}
