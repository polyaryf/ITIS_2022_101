import UIKit
import PlaygroundSupport


let view = UIView()
view.backgroundColor = .clear
view.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 500))
PlaygroundPage.current.liveView = view

let layer = view.layer
let gradientLayer = CAGradientLayer()
gradientLayer.startPoint = .zero
gradientLayer.endPoint = CGPoint(x: 1, y: 1)
gradientLayer.colors = [
    UIColor.red.cgColor.copy(alpha: 0.5) as Any,
    UIColor.orange.cgColor.copy(alpha: 0.5) as Any,
    UIColor.purple.cgColor.copy(alpha: 0.5) as Any,
]
gradientLayer.frame = layer.bounds
layer.addSublayer(gradientLayer)

let circleLayer = CALayer()
circleLayer.backgroundColor = UIColor.purple.cgColor
circleLayer.frame = CGRect(
    origin: .zero, size: CGSize(width: 100, height: 100)
)
circleLayer.cornerRadius = 50
layer.addSublayer(circleLayer)
circleLayer.frame.origin = CGPoint(
    x: view.center.x
        - circleLayer.frame.width * 0.5,
    y: view.center.y
        - circleLayer.frame.height * 0.5
)

let rightEarLayer = CAShapeLayer()
let firstTrianglePath = UIBezierPath()
firstTrianglePath.move(to: CGPoint(x: 150, y: 188))
firstTrianglePath.addLine(to: CGPoint(x: 160, y: 220))
firstTrianglePath.addLine(to: CGPoint(x: 190, y: 210))
firstTrianglePath.addLine(to: CGPoint(x: 149, y: 188))
rightEarLayer.path = firstTrianglePath.cgPath
rightEarLayer.fillColor = UIColor.purple.cgColor
layer.addSublayer(rightEarLayer)

let leftEarLayer = CAShapeLayer()
let secondTrianglePath = UIBezierPath()
secondTrianglePath.move(to: CGPoint(x: 210, y: 210))
secondTrianglePath.addLine(to: CGPoint(x: 240, y: 220))
secondTrianglePath.addLine(to: CGPoint(x: 252, y: 188))
secondTrianglePath.addLine(to: CGPoint(x: 210, y: 210))
leftEarLayer.path = secondTrianglePath.cgPath
leftEarLayer.fillColor = UIColor.purple.cgColor
layer.addSublayer(leftEarLayer)

let textLayer = CATextLayer()
textLayer.string = "С днем верстки!!!!!1!!"
textLayer.font = UIFont.italicSystemFont(ofSize: 20)
textLayer.foregroundColor = UIColor.purple.cgColor
textLayer.frame = CGRect(x: 30, y: 50, width: 500, height: 50)
view.layer.addSublayer(textLayer)








