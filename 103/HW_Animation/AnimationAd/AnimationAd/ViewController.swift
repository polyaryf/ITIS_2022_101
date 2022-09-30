//
//  ViewController.swift
//  AnimationAd
//
//  Created by Полина Рыфтина on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        view.backgroundColor = .clear
        NotificationCenter.default.addObserver(self, selector: #selector(reanimate), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func reanimate() {
        animateBorder()
        animateImg()
        animateText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateBorder()
        animateImg()
        animateText()
        animate()
    }
    
    private let adLayer: CALayer = .init()
    private let imgView: UIImageView = .init()
    private let textImgView: UIImageView = .init()
    private let emojiLabel1: UILabel = .init()
    private let emojiLabel2: UILabel = .init()
    private let emojiLabel3: UILabel = .init()
    private let emojiLabel4: UILabel = .init()
    private let emojiLabel5: UILabel = .init()
    
    private func setUp(){
        view.layer.addSublayer(adLayer)
        adLayer.frame = CGRect(x: 10, y: 250, width: 400, height: 400)
        adLayer.backgroundColor = UIColor.white.cgColor
        
        view.addSubview(imgView)
        imgView.frame = CGRect(x: 220, y: 300, width: 150, height: 300)
        imgView.backgroundColor = .clear
        
        view.addSubview(textImgView)
        textImgView.frame = CGRect(x: 30, y: 350, width: 200, height: 100)
        
        view.addSubview(emojiLabel1)
        emojiLabel1.frame = CGRect(x: 30, y: 270, width: 23, height: 23)
        emojiLabel1.text = "🤣"
        
        view.addSubview(emojiLabel2)
        emojiLabel2.frame = CGRect(x: 30, y: 600, width: 30, height: 30)
        emojiLabel2.text = "😈"
        
        
        view.addSubview(emojiLabel3)
        emojiLabel3.frame = CGRect(x: 100, y: 580, width: 30, height: 30)
        emojiLabel3.text = "😘"
        
        view.addSubview(emojiLabel4)
        emojiLabel4.frame = CGRect(x: 300, y: 580, width: 30, height: 30)
        emojiLabel4.text = "🤡"
        
        view.addSubview(emojiLabel5)
        emojiLabel5.frame = CGRect(x: 340, y: 270, width: 30, height: 30)
        emojiLabel5.text = "😻"
    }
    
    private func animateBorder(){
        adLayer.borderColor = UIColor.green.cgColor
        adLayer.borderWidth = 10
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimation.fromValue = adLayer.borderColor
        borderColorAnimation.toValue = UIColor.red.cgColor
        borderColorAnimation.duration = 0.5
        borderColorAnimation.repeatCount = .infinity
        borderColorAnimation.autoreverses = true
        adLayer.add(borderColorAnimation, forKey: "borderColor")
        }
    
    private func animateImg(){
        guard let image1 = UIImage(named: "tree1") else {return}
        guard let image2 = UIImage(named: "tree2") else {return}
        let imgAnimation = CABasicAnimation(keyPath: "contents")
        switch imgView.image {
            case image1:
                imgAnimation.fromValue = image1
                imgAnimation.toValue = image2
                imgView.image = image2
            default:
                imgAnimation.fromValue = image2
                imgAnimation.toValue = image1
                imgView.image = image1
        }
        imgAnimation.duration = 3.5
        imgAnimation.repeatCount = .infinity
        imgView.layer.add(imgAnimation, forKey: "contents")
    }
    
    private func animateText(){
        guard let text1 = UIImage(named: "text1") else {return}
        guard let txet2 = UIImage(named: "text2") else {return}
        let textAnimation = CABasicAnimation(keyPath: "contents")
        switch textImgView.image {
            case text1:
                textAnimation.fromValue = text1
                textAnimation.toValue = txet2
                textImgView.image = txet2
            default:
                textAnimation.fromValue = txet2
                textAnimation.toValue = text1
                textImgView.image = text1
        }
        textAnimation.duration = 3.5
        textAnimation.repeatCount = .infinity
        textImgView.layer.add(textAnimation, forKey: "contents")
    }
    
    private func animate(){
        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: [.repeat, .autoreverse]
        ) { [self] in
            UIView.addKeyframe(
                withRelativeStartTime: 0, relativeDuration: 1
            ) { [self] in
                emojiLabel1.frame.origin.x = 40
                emojiLabel1.frame.origin.y = 320
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.45, relativeDuration: 0.5
            ) { [self] in
                emojiLabel1.frame.origin.x = 60
                emojiLabel1.frame.origin.y = 290
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.15, relativeDuration: 0.35
            ) { [self] in
                emojiLabel2.frame.origin.x = 60
                emojiLabel2.frame.origin.y = 450
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.25, relativeDuration: 0.25
            ) { [self] in
                emojiLabel2.frame.origin.x = 90
                emojiLabel2.frame.origin.y = 600
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0, relativeDuration: 0.5
            ) { [self] in
                emojiLabel3.frame.origin.x = 150
                emojiLabel3.frame.origin.y = 600
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.15, relativeDuration: 0.25
            ) { [self] in
                emojiLabel3.frame.origin.x = 170
                emojiLabel3.frame.origin.y = 500
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.15, relativeDuration: 0.45
            ) { [self] in
                emojiLabel4.frame.origin.x = 30
                emojiLabel4.frame.origin.y = 540
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0, relativeDuration: 0.35
            ) { [self] in
                emojiLabel5.frame.origin.x = 150
                emojiLabel5.frame.origin.y = 280
            }
        }
    }
}


