//
//  UtilAspectRatio.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

class UtilAspectRatio {
    
    private var currentViewSize = UIScreen.main.bounds
    private let designGuideDeviceWidth: CGFloat = 430  //디자인 기준 width
    private let designGuideDeviceHeight: CGFloat = 932 //디자인 기준 height
    
    static func get(designSize: CGFloat) -> CGFloat {
        let ob = UtilAspectRatio()
        var ratio: CGFloat = 0.0
        let designRatio = (designSize/ob.designGuideDeviceWidth)
        ratio = ob.currentViewSize.width * designRatio
        return ratio
    }
    
    static func verticalRatio(designSize: CGFloat) -> CGFloat {
        let ob = UtilAspectRatio()
        var ratio: CGFloat = 0.0
        let designRatio = (designSize/ob.designGuideDeviceHeight)
        ratio = ob.currentViewSize.width * designRatio
        return ratio
    }
}
