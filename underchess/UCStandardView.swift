//
//  UCStandardView.swift
//  Underchess
//
//  Created by Apollonian on 3/7/16.
//  Copyright © 2016 WWITDC. All rights reserved.
//



enum UCInterfaceOrientation{
    case Potrait, Landscape
    
    init(input: UIInterfaceOrientation){
        switch input{
        case .Portrait, .PortraitUpsideDown: self = .Potrait
        case .LandscapeLeft, .LandscapeRight: self = .Landscape
        case .Unknown: fatalError("Can not convert Unknown Interface Orientation")
        }
    }
}


import UIKit

// Creat a 3 * 4 (potrait) or 4 * 3 (landscape) view in the center of the superview
@IBDesignable class UCStandardView: UIView {
    
    var margin: CGFloat = 5 {
        didSet{
            setup(frame: superview?.frame)
        }
    }
    
    init(father: UIView){
        let superFrame = father.frame
        super.init(frame: superFrame)
        setup(frame: superFrame)
    }
    
    func setup(frame temp: CGRect?){
        let fatherFrame = temp ?? superview?.frame ?? UIScreen.mainScreen().bounds
        var targetWidth, targetHeight: CGFloat
        if fatherFrame.height > fatherFrame.width{
            let arg1 = Int(fatherFrame.height - 2 * margin) / 4
            let arg2 = Int(fatherFrame.width - 2 * margin) / 3
            let scale = CGFloat(min(arg1,arg2))
            targetHeight = scale * 4
            targetWidth = scale * 3
        } else {
            let scale = CGFloat(min(Int(fatherFrame.height - 2 * margin) / 4,Int(fatherFrame.width - 2 * margin) / 3))
            targetHeight = scale * 3
            targetWidth = scale * 4
        }
        let targetX = fatherFrame.midX - targetWidth / 2
        let targetY = fatherFrame.midY - targetHeight / 2
        self.frame = CGRect(x: targetX, y: targetY, width: targetWidth, height: targetHeight)
    }
    
    func standardFrameInFrame(frame temp: CGRect?) -> CGRect{
        let fatherFrame = temp ?? superview?.frame ?? UIScreen.mainScreen().bounds
        var targetWidth, targetHeight: CGFloat
        if fatherFrame.height > fatherFrame.width{
            let arg1 = Int(fatherFrame.height - 2 * margin) / 4
            let arg2 = Int(fatherFrame.width - 2 * margin) / 3
            let scale = CGFloat(min(arg1,arg2))
            targetHeight = scale * 4
            targetWidth = scale * 3
        } else {
            let arg1 = Int(fatherFrame.height - 2 * margin) / 3
            let arg2 = Int(fatherFrame.width - 2 * margin) / 4
            let scale = CGFloat(min(arg1, arg2))
            targetHeight = scale * 3
            targetWidth = scale * 4
        }
        let targetX = fatherFrame.midX - targetWidth / 2
        let targetY = fatherFrame.midY - targetHeight / 2
        return CGRect(x: targetX, y: targetY, width: targetWidth, height: targetHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}