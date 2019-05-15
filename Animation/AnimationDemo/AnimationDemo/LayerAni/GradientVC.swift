//
//  GradientVC.swift
//  AnimationDemo
//
//  Created by Yi on 2019/5/15.
//  Copyright © 2019 Yi. All rights reserved.
//

import UIKit

class AnimatedMaskLabel: UIView {
    
    var gradientLayer = CAGradientLayer()
    var testLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.colors = colors
        let locations: [NSNumber] = [0.25, 0.5, 0.75]
        gradientLayer.locations = locations
        
//        addSubview(testLabel)
//        testLabel.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect(x: -bounds.width, y: bounds.origin.y, width: bounds.width * 3, height: bounds.height)
//        testLabel.frame = bounds.offsetBy(dx: bounds.size.width, dy: 0)
        
        let textAttributes: [NSAttributedString.Key: AnyObject] = {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            return [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28),
                NSAttributedString.Key.paragraphStyle: style
            ]
        }()
        let image = UIGraphicsImageRenderer(size: bounds.size).image { (_) in
            NSString(string: "Hello World").draw(in: bounds, withAttributes: textAttributes)
        }
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame = bounds.offsetBy(dx: bounds.width, dy: 0)
        maskLayer.contents = image.cgImage
        gradientLayer.mask = maskLayer
    }
    
    override func didMoveToWindow() {
        layer.addSublayer(gradientLayer)
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0, 1.0]
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = .infinity
        gradientLayer.add(gradientAnimation, forKey: nil)
        
//        gradientLayer.mask = testLabel.layer
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class GradientVC: UIViewController {
    
    var animatedLabel = AnimatedMaskLabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(animatedLabel)
        animatedLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                // Fallback on earlier versions
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.height.equalTo(200)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
