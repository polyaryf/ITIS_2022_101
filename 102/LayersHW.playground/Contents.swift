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
textLayer.font = UIFont.systemFont(ofSize: 20)
textLayer.foregroundColor = UIColor.purple.cgColor
textLayer.frame = CGRect(x: 30, y: 50, width: 370, height: 50)
view.layer.addSublayer(textLayer)

let square1 = CAShapeLayer()
let square1Path = UIBezierPath()
square1Path.move(to: CGPoint(x: 20, y: 50))
square1Path.addLine(to: CGPoint(x: 380, y: 50))
square1Path.addLine(to: CGPoint(x: 380, y: 100))
square1Path.addLine(to: CGPoint(x: 20, y: 100))
square1Path.addLine(to: CGPoint(x: 20, y: 50))
square1.path = square1Path.cgPath
square1.lineWidth = 1
square1.strokeColor = UIColor.purple.cgColor
square1.borderColor = UIColor.purple.cgColor
square1.fillColor = UIColor.clear.cgColor
layer.addSublayer(square1)

let square2 = CAShapeLayer()
let square2Path = UIBezierPath()
square2Path.move(to: CGPoint(x: 130, y: 170))
square2Path.addLine(to: CGPoint(x: 130, y: 310))
square2Path.addLine(to: CGPoint(x: 270, y: 310))
square2Path.addLine(to: CGPoint(x: 270, y: 170))
square2Path.addLine(to: CGPoint(x: 130, y: 170))
square2.path = square2Path.cgPath
square2.lineWidth = 1
square2.strokeColor = UIColor.purple.cgColor
square2.borderColor = UIColor.purple.cgColor
square2.fillColor = UIColor.clear.cgColor
layer.addSublayer(square2)

let square3 = CAShapeLayer()
let square3Path = UIBezierPath()
square3Path.move(to: CGPoint(x: 30, y: 320))
square3Path.addLine(to: CGPoint(x: 30, y: 370))
square3Path.addLine(to: CGPoint(x: 80, y: 370))
square3Path.addLine(to: CGPoint(x: 80, y: 320))
square3Path.addLine(to: CGPoint(x: 30, y: 320))
square3.path = square3Path.cgPath
square3.lineWidth = 1
square3.strokeColor = UIColor.purple.cgColor
square3.borderColor = UIColor.purple.cgColor
square3.fillColor = UIColor.clear.cgColor
layer.addSublayer(square3)

let square4 = CAShapeLayer()
let square4Path = UIBezierPath()
square4Path.move(to: CGPoint(x: 50, y: 350))
square4Path.addLine(to: CGPoint(x: 50, y: 450))
square4Path.addLine(to: CGPoint(x: 150, y: 450))
square4Path.addLine(to: CGPoint(x: 150, y: 350))
square4Path.addLine(to: CGPoint(x: 50, y: 350))
square4.path = square4Path.cgPath
square4.lineWidth = 1.5
square4.strokeColor = UIColor.purple.cgColor
square4.borderColor = UIColor.purple.cgColor
square4.fillColor = UIColor.clear.cgColor
layer.addSublayer(square4)

let square5 = CAShapeLayer()
let square5Path = UIBezierPath()
square5Path.move(to: CGPoint(x: 320, y: 110))
square5Path.addLine(to: CGPoint(x: 320, y: 200))
square5Path.addLine(to: CGPoint(x: 370, y: 200))
square5Path.addLine(to: CGPoint(x: 370, y: 110))
square5Path.addLine(to: CGPoint(x: 320, y: 110))
square5.path = square5Path.cgPath
square5.lineWidth = 1
square5.strokeColor = UIColor.purple.cgColor
square5.borderColor = UIColor.purple.cgColor
square5.fillColor = UIColor.clear.cgColor
layer.addSublayer(square5)

let square6 = CAShapeLayer()
let square6Path = UIBezierPath()
square6Path.move(to: CGPoint(x: 330, y: 160))
square6Path.addLine(to: CGPoint(x: 330, y: 240))
square6Path.addLine(to: CGPoint(x: 360, y: 240))
square6Path.addLine(to: CGPoint(x: 360, y: 160))
square6Path.addLine(to: CGPoint(x: 330, y: 160))
square6.path = square6Path.cgPath
square6.lineWidth = 1.5
square6.strokeColor = UIColor.purple.cgColor
square6.borderColor = UIColor.purple.cgColor
square6.fillColor = UIColor.clear.cgColor
layer.addSublayer(square6)









