//
//  AnimateButton.swift
//  ButtonAnimation
//
//  Created by YUMIKO HARAGUCHI on 2016/10/20.
//  Copyright © 2016年 YUMIKO HARAGUCHI. All rights reserved.
//

import UIKit

protocol ButtonDelegate : class{
    ///タップイベントが必要であれば。。
    func ButtonTapEvent(button : UIButton, isCancel: Bool)
}

@IBDesignable class AnimateButton: UIButton {
    
    fileprivate let RADIUS : CGFloat = 7.0
    fileprivate let DURATION : TimeInterval = 0.5
    fileprivate let DAMPING : CGFloat = 0.5
    fileprivate let VELOCITY : CGFloat = 0.0
    
    @IBInspectable var cornerRadius: Bool{
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = RADIUS }
    }
    
    weak var buttonDelegate : ButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.initView()
    }

    
    //MARK: タップイベント

    func tapBegin() {
        self.layer.transform = CATransform3DIdentity
        
        UIView.animate(withDuration: DURATION, delay: 0.0, usingSpringWithDamping: DAMPING, initialSpringVelocity: VELOCITY, options: UIViewAnimationOptions.curveEaseIn, animations: { [weak self] () -> Void  in
            self?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
        }) { (Bool) -> Void in
            
        }
    }
    
    func tapEnd() {
        
        UIView.animate(withDuration: DURATION, delay: 0.0, usingSpringWithDamping: DAMPING, initialSpringVelocity: VELOCITY, options: UIViewAnimationOptions.curveEaseIn, animations: { [weak self] () -> Void in
            self?.layer.transform = CATransform3DIdentity
            
        }) { (Bool) -> Void in
            
        }
        buttonDelegate?.ButtonTapEvent(button: self, isCancel: false)
        
    }
    
    func tapUpOutSide() {
        
        UIView.animate(withDuration: DURATION, delay: 0.0, usingSpringWithDamping: DAMPING, initialSpringVelocity: VELOCITY, options: UIViewAnimationOptions.curveEaseIn, animations: { [weak self] () -> Void in
            self?.layer.transform = CATransform3DIdentity
            
        }) { (Bool) -> Void in
        }
        
        buttonDelegate?.ButtonTapEvent(button: self, isCancel: true)

    }
}


//MARK: - プライベート
extension AnimateButton {
    fileprivate func initView() {
        self.addTarget(self, action: #selector(AnimateButton.tapBegin), for: UIControlEvents.touchDown)
        self.addTarget(self, action: #selector(AnimateButton.tapEnd), for: UIControlEvents.touchUpInside)
        self.addTarget(self, action: #selector(AnimateButton.tapUpOutSide), for: UIControlEvents.touchUpOutside)
        self.addTarget(self, action: #selector(AnimateButton.tapUpOutSide), for: UIControlEvents.touchCancel)
    }
}
