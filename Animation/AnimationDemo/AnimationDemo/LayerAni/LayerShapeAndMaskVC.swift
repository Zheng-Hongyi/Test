//
//  LayerShapeAndMaskVC.swift
//  AnimationDemo
//
//  Created by Yi on 2019/5/15.
//  Copyright © 2019 Yi. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    var photoLayer = CALayer()
    var circleLayer = CAShapeLayer()
    var maskLayer = CAShapeLayer()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        photoLayer.mask = maskLayer
        layer.addSublayer(circleLayer)
        addSubview(label)
    }
}

class LayerShapeAndMaskVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
