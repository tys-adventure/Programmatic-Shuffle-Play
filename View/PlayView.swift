//
//  PlayView.swift
//  CustomControl
//
//  Created by Thom Pheijffer on 02/12/2018.
//  Copyright © 2018 Thom Pheijffer. All rights reserved.
//

import UIKit

@IBDesignable class PlayView: UIView {

    @IBInspectable var lineWidth: CGFloat = 1.0
    @IBInspectable var iconSize: CGFloat = 32.0
    
    private var shapeLayer: CAShapeLayer!
    var button: UIButton!
    
    var isPlaying = false
    var playHandler: (() -> ())?
    var stopHandler: (() -> ())?
    
    var fractionComplete: CGFloat = 0 {
        didSet {
            shapeLayer.strokeEnd = fractionComplete
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shapeLayer == nil {
            shapeLayer = CAShapeLayer()
            shapeLayer.anchorPoint = .zero
            shapeLayer.strokeEnd = fractionComplete
            layer.addSublayer(shapeLayer)
            
            button = UIButton(type: .system)
            button.frame = bounds
            //button.tintColor = .white
            button.tintColor = UIColor(white: 1, alpha: 0.9)
            addSubview(button)
            
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
        shapeLayer.bounds = bounds
        applySettings()
    }
    
    func applySettings() {
        if lineWidth <= 0 {
            shapeLayer.strokeColor = UIColor.clear.cgColor
        } else {
            //shapeLayer.strokeColor = tintColor.cgColor
            //shapeLayer.strokeColor = UIColor.white.cgColor
            shapeLayer.strokeColor = UIColor(white: 1, alpha: 0.9).cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = lineWidth
            
            let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
            
            let startAngle = -CGFloat.pi / 2
            let endAngle = CGFloat.pi + CGFloat.pi / 2
            
            let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            shapeLayer.path = path.cgPath
            
            button.setImage(renderPlay(), for: .normal)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applySettings()
    }
    
    private func renderPlay() -> UIImage {
        let drawRect = CGRect(x: 0, y: 0, width: iconSize, height: iconSize)
        let renderer = UIGraphicsImageRenderer(bounds: drawRect)
        return renderer.image(actions: { ctx in
            let path = UIBezierPath()
            path.move(to: CGPoint(x: iconSize / 4, y: 0))
            path.addLine(to: CGPoint(x: iconSize / 4, y: iconSize))
            path.addLine(to: CGPoint(x: iconSize, y: iconSize / 2))
            
            UIColor.black.set()
            path.fill()
        })
    }
    
    private func renderStop() -> UIImage {
        let drawRect = CGRect(x: 5, y: 5, width: iconSize - 5, height: iconSize - 5)
        let renderer = UIGraphicsImageRenderer(bounds: drawRect)
        return renderer.image(actions: { ctx in
            UIColor.black.set()
            ctx.fill(drawRect)
        })
    }
    
    @objc private func buttonTapped() {
        
        if isPlaying {
            isPlaying = false
            
            
            DispatchQueue.main.async {
                self.button.setImage(self.renderPlay(), for: .normal)
            }
            
            
            if let stopHandler = stopHandler {
                stopHandler()
            }
        } else {
            isPlaying = true
            
            DispatchQueue.main.async {
                self.button.setImage(self.renderStop(), for: .normal)
            }
            
            if let playHandler = playHandler {
                playHandler()
            }
            
        }
    }

}
