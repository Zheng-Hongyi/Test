//
//  TransitionVC.swift
//  AnimationDemo
//
//  Created by Yi on 2019/5/13.
//  Copyright © 2019 Yi. All rights reserved.
//

import UIKit
import SnapKit

class TransitionVC: UIViewController {

    var animationContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animationContainerView = UIView()
        view.addSubview(animationContainerView)
        animationContainerView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let newView = UIImageView(image: UIImage(named: "test"))
//        newView.center = animationContainerView.center
        self.animationContainerView.addSubview(newView)
        newView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        let aNotherView = UIImageView(image: UIImage(named: "test1"))
//        aNotherView.center = animationContainerView.center
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            UIView.transition(with: self.animationContainerView, duration: 0.33, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
//
////                newView.removeFromSuperview()
//                self.animationContainerView.addSubview(newView)
//                newView.snp.makeConstraints({ (make) in
//                    make.centerX.equalToSuperview()
//                    make.centerY.equalToSuperview()
//                })
//            }, completion: nil)
            UIView.transition(from: newView, to: aNotherView, duration: 0.33, options: [.transitionFlipFromTop], completion: { (_) in
            })
            aNotherView.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
            })
            
//            UIView.transition(with: newView, duration: 0.33, options: [.transitionCurlDown], animations: {
//                newView.isHidden = false
//            }, completion: nil)
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
