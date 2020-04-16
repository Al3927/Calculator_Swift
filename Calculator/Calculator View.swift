//
//  Calculator View.swift
//  Calculator
//
//  Created by vinova on 4/6/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import UIKit

@IBDesignable
class Calculator_View: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    @IBInspectable
    lazy var result = CreatResultLabel()
    
    func CreatResultLabel () -> UILabel {
        let resultLabel = UILabel()
        resultLabel.numberOfLines = 0
        self.addSubview(resultLabel)
        return resultLabel
    }
    
    func configureLabel () -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(36)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        return NSAttributedString(string: "", attributes: [.paragraphStyle:paragraphStyle, .font: font])
    }
    
    func setLabel(_ label: UILabel) {
        //label.text = "123456"
        label.attributedText = configureLabel()
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setLabel(result)
        result.frame.origin = bounds.origin.offsetBy(dx: bounds.size.height * 0.5, dy: bounds.size.width * 0.5)
        
    }
    

   
    
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        roundedRect.fill()
        //addSubview(result)
    }
    

}


