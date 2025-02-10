//
//  customeCycle.swift
//  test001
//
//  Created by ppx on 2025/2/10.
//

import UIKit


class CustomDrawView: UIView {
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                      radius: rect.width / 2,
                                      startAngle: 0,
                                      endAngle: CGFloat.pi * 2,
                                      clockwise: true)
        UIColor.red.setFill()
        circlePath.fill()
    }
}
