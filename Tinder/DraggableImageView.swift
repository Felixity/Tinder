//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Laura on 4/26/17.
//  Copyright © 2017 Laura. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var contentView: UIView!
    var imageCenter: CGPoint!
    
    var image: UIImage? {
        get { return profileImageView.image }
        set { profileImageView.image = newValue }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
            
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: contentView)
        
        if sender.state == .began {
            imageCenter = self.center
        }
        else if sender.state == .changed {
            
            self.center.x = imageCenter.x + translation.x
            
//            let angle: CGFloat = 90 + imageCenter.x / imageCenter.x * -70
//            profileImageView.transform = CGAffineTransform(rotationAngle: 60)        
        }
        else if sender.state == .ended {
            
        }
        
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
