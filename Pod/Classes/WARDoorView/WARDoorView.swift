//
//  WARDoorView.swift
//  WARDoorOpenAnimation
//
//  Created by Warif Akhand Rishi on 12/2/15.
//  Copyright © 2015 war. All rights reserved.
//

import UIKit

private enum DoorType {
    case left
    case right
}

@IBDesignable
open class WARDoorView: UIView {
    
    @IBOutlet weak fileprivate var leftImageView: UIImageView!
    @IBOutlet weak fileprivate var rightImageView: UIImageView!
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            leftImageView.image = leftImage
            leftImageView.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            rightImageView.image = rightImage
            rightImageView.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        }
    }

    
    // MARK: Public Functions
    
    open func open(_ angle: Double = 90.0, duration: TimeInterval = 1.3, delay: TimeInterval = 0, completion: @escaping (() -> Void) = {}) {
        
        let rightTransform = get3DTransformationForDoorType(.right, angle: angle)
        let leftTransform = get3DTransformationForDoorType(.left, angle: angle)
        
        isUserInteractionEnabled = true
        
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseOut, .beginFromCurrentState], animations: { () -> Void in
                self.leftImageView.layer.transform = leftTransform
                self.rightImageView.layer.transform = rightTransform
            }, completion: { (finished) -> Void in
                self.isUserInteractionEnabled = false
                completion()
        })
    }
    
    open func close(_ duration: TimeInterval = 1.3, delay: TimeInterval = 0, completion: @escaping (() -> Void) = {}) {

        isUserInteractionEnabled = true
        
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseOut, .beginFromCurrentState], animations: { () -> Void in
                self.leftImageView.layer.transform = CATransform3DIdentity
                self.rightImageView.layer.transform = CATransform3DIdentity
            }, completion: { (finished) -> Void in
                self.isUserInteractionEnabled = true
                completion()
        })
    }
    
    
    // MARK: Initializers
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    
    // MARK: Private Functions

    fileprivate func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "WARDoorView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view);
    }
    
    private func get3DTransformationForDoorType(_ doorType: DoorType, angle: Double) -> CATransform3D {
        var angle = angle
        
        switch(doorType) {
        case .right: angle *= -1
        default: ()
        }
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, CGFloat(angle * M_PI / 180.0), 0, 1, 0.0)
        
        return transform
    }
}
