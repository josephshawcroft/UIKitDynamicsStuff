//
//  ViewController.swift
//  UIKitDynamicsStuff
//
//  Created by Joseph Shawcroft on 02/01/2019.
//  Copyright © 2019 Joseph Shawcroft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!
    var gravityBehavior: UIGravityBehavior!
    var collisionBehavior: UICollisionBehavior!
    
    var behaviourItems = [UIDynamicItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)

        gravityBehavior = UIGravityBehavior(items: behaviourItems)
        collisionBehavior = UICollisionBehavior(items: behaviourItems)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true

    }

    func addBox(x : CGFloat, y : CGFloat) {
        let box = UIView(frame: CGRect(x: x - 50.0, y: y - 50.0, width: 100, height: 100))
        box.backgroundColor = .gray
        view.addSubview(box)
        behaviourItems.append(box)
        
        animator.removeBehavior(gravityBehavior)
        animator.removeBehavior(collisionBehavior)
        
        gravityBehavior = UIGravityBehavior(items: behaviourItems)
        collisionBehavior = UICollisionBehavior(items: behaviourItems)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true

        animator.addBehavior(gravityBehavior)
        animator.addBehavior(collisionBehavior)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("tapped")
        let touchPoint = sender.location(in: self.view)
        addBox(x: touchPoint.x , y: touchPoint.y)
    }
}

