//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Igor Tkach on 5/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {


    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var imageSender: UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSender.image = UIImage(named: restaurant.image)
        backgroundImageView.image = UIImage(named: restaurant.image)

       let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
//        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        // CloseButtonMove
        let translateTransformButton = CGAffineTransform.init(translationX:100, y: 0)
        closeButton.transform = translateTransformButton
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.containerView.transform = CGAffineTransform.identity}
        
            UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {self.containerView.transform = CGAffineTransform.identity}, completion: nil)
        
         UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: .curveLinear, animations: {self.closeButton.transform = CGAffineTransform.identity}, completion: nil)
        
        
        }
    

}
