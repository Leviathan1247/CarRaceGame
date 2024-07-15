//
//  ViewController.swift
//  CALayerCustomProject
//
//  Created by Левиафан on 2024-06-26.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragView))
        someView.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc func dragView(recognizer: UIPanGestureRecognizer){
        let state = recognizer.state
        if state == .changed{
            let translation = recognizer.translation(in: self.view)
            let newX = someView.center.x + translation.x
            let newY = someView.center.y + translation.y
            someView.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
       else if state == .ended {
            UIView.animate(withDuration: 0, delay: 0.25, options: [], animations: {
                self.someView.center = self.view.center
            })
            
        }
        
    }
    
}


    
   /* @objc func dragView(recognizer: UIPanGestureRecognizer){
        let state = recognizer.state
        if state == .changed{
            let translation = recognizer.translation(in: self.view)
            let newX = someView.center.x + translation.x
            let newY = someView.center.y + translation.y
            
            someView.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
    } */
    
       
        /* Пружинная анимация
         
         UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
        //            self.someView.center.x += 50
       })
        
    
        someView.layer.borderColor = UIColor.black.cgColor
        someView.layer.borderWidth = 2
        someView.layer.cornerRadius = 15
        someView.layer.shadowOffset = CGSize(width: 3, height: 4)
        someView.layer.shadowOpacity = 0.4
        someView.layer.shadowRadius = 0
        someView.layer.shadowColor = UIColor.gray.cgColor
        someView.layer.backgroundColor = UIColor.red.cgColor
        
        
        let animation = CABasicAnimation(keyPath: "transform.scale.x");
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = 3
        someView.layer.add(animation, forKey: "changeXSscale")
        
        
         Вариант 2
         
         let animation = CABasicAnimation(keyPath: "position");
         animation.fromValue = view.center
         animation.toValue = CGPoint(x: 100.0, y: 100.0)
         animation.duration = 3.0
         animation.autoreverses = true
         animation.repeatCount = 2
         someView.layer.add(animation, forKey: "animatePosition")
         
    
         */
     
   
