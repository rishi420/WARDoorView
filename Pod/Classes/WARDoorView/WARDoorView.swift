//
//  WARDoorView.swift
//  WARDoorOpenAnimation
//
//  Created by Warif Akhand Rishi on 12/2/15.
//  Copyright © 2015 war. All rights reserved.
//

import UIKit

private enum DoorType {
    case Left
    case Right
}

@IBDesignable
public class WARDoorView: UIView {
    
    @IBOutlet weak private var leftImageView: UIImageView!
    @IBOutlet weak private var rightImageView: UIImageView!
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            leftImageView.image = leftImage
            leftImageView.layer.anchorPoint = CGPointMake(0.0, 0.5)
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            rightImageView.image = rightImage
            rightImageView.layer.anchorPoint = CGPointMake(1.0, 0.5)
        }
    }

    
    // MARK: Public Functions
    
    public func doorOpen(angle: Double = 90.0, duration: NSTimeInterval = 2, delay: NSTimeInterval = 2, completion: (() -> Void) = {}) {
        
        let rightTransform = get3DTransformationForDoorType(.Right, angle: angle)
        let leftTransform = get3DTransformationForDoorType(.Left, angle: angle)
        
        UIView.animateWithDuration(1.3, delay: 1, options: .TransitionNone, animations: { () -> Void in
                self.leftImageView.layer.transform = leftTransform
                self.rightImageView.layer.transform = rightTransform
            }, completion: { (finished) -> Void in
                self.alpha = 0.0
                completion()
        })
    }
    
    public func doorClose(duration: NSTimeInterval = 1.3, delay: NSTimeInterval = 0, completion: (() -> Void) = {}) {

        self.alpha = 1.0
        
        UIView.animateWithDuration(duration, delay: delay, options: .TransitionNone, animations: { () -> Void in
                self.leftImageView.layer.transform = CATransform3DIdentity
                self.rightImageView.layer.transform = CATransform3DIdentity
            }, completion: { (finished) -> Void in
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

    private func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "WARDoorView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(view);
    }
    
    private func get3DTransformationForDoorType(doorType: DoorType, var angle: Double) -> CATransform3D {
        
        switch(doorType) {
        case .Right: angle *= -1
        default: ()
        }
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, CGFloat(angle * M_PI / 180.0), 0, 1, 0.0)
        
        return transform
    }
}
