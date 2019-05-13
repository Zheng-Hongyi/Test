//
//  LayerBasicVC.swift
//  AnimationDemo
//
//  Created by Yi on 2019/5/13.
//  Copyright © 2019 Yi. All rights reserved.
//

import UIKit

class LayerBasicVC: UIViewController {
    
    var animationView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true

        // Do any additional setup after loading the view.
        animationView.frame = CGRect(x: view.bounds.width / 2 - 50, y: 300, width: 100, height: 100)
        animationView.backgroundColor = UIColor.red
        view.addSubview(animationView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        animationView.center.x = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let flayRight = CABasicAnimation(keyPath: "position.x")
//        flayRight.fromValue = 300
//        flayRight.toValue = view.bounds.width / 2
//        flayRight.duration = 2.5
//        flayRight.beginTime = CACurrentMediaTime() + 5
//        flayRight.fillMode = .both
//        flayRight.isRemovedOnCompletion = false
//        flayRight.setValue("hello", forKey: "name")
//        flayRight.delegate = self
//        animationView.layer.add(flayRight, forKey: "one")
        
//        let opacity = CABasicAnimation(keyPath: "opacity")
//        opacity.fromValue = 1
//        opacity.toValue = 0
//        opacity.duration = 5
//        opacity.beginTime = CACurrentMediaTime() + 5
//        opacity.fillMode = .both
//        opacity.isRemovedOnCompletion = false
//        opacity.delegate = self
//        animationView.layer.add(opacity, forKey: "two")
//        view.backgroundColor = UIColor.green
//        animationView.layer.borderWidth = 10
//        animationView.layer.borderColor = UIColor.clear.cgColor
//
//        let flayRight = CASpringAnimation(keyPath: "cornerRadius")
//        flayRight.fromValue = 0
//        flayRight.toValue = 50
//        flayRight.duration = flayRight.settlingDuration
//        flayRight.beginTime = CACurrentMediaTime() + 2
//        flayRight.fillMode = .both
//        flayRight.isRemovedOnCompletion = false
////        flayRight.initialVelocity = 100
////        flayRight.damping = 7
////        flayRight.stiffness = 200
//        flayRight.setValue("hello", forKey: "name")
//        flayRight.delegate = self
//        animationView.layer.add(flayRight, forKey: "one")
        
        let wooble = CAKeyframeAnimation(keyPath: "transform.rotation")
        wooble.duration = 0.25
        wooble.repeatCount = 4
        wooble.values = [0.0, -.pi / 4.0, 0.0, .pi / 4.0, 0.0]
        wooble.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
        animationView.layer.add(wooble, forKey: nil)
    }

}

extension LayerBasicVC: CAAnimationDelegate {
    
    func animationDidStart(_ anim: CAAnimation) {
        debugPrint("start")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        debugPrint("stop")
        guard let name = anim.value(forKey: "name") as? String else { return }
        if name == "hello" {
            animationView.layer.removeAnimation(forKey: "two")
        }
    }
}
