import UIKit
import PlaygroundSupport

let parentView = UIView()
parentView.backgroundColor = .red
parentView.frame = CGRect(x: 0, y: 0, width: 400, height: 700)

let view1 = UIView()
view1.backgroundColor = .blue

let view2 = UIView()
view2.backgroundColor = .orange

let view3 = UIView()
view3.backgroundColor = .yellow

let view4 = UIView()
view4.backgroundColor = .gray

let view5 = UIView()
view5.backgroundColor = .green

parentView.addSubview(view1)
view1.set(.leading(parentView,8), .size(50, 50), .top(parentView,8))

parentView.addSubview(view2)
view2.set(.after(view1,8), .size(50, 50), .top(parentView,8))

parentView.addSubview(view3)
view3.set(.after(view2,8), .top(parentView,8), .trailing(parentView,8), .height(50))

parentView.addSubview(view4)
view4.set(.below(view1, 8), .height(100), .leading(parentView,8), .trailing(parentView,8))

view4.addSubview(view5)
view5.set(.fillSuperView(view4, 8))

PlaygroundPage.current.liveView = parentView
parentView.layoutIfNeeded()
