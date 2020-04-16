//
//  CalculatorViewProgrammatically.swift
//  Calculator
//
//  Created by vinova on 4/13/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import UIKit

class CalculatorViewProgrammatically: UIView {

    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    lazy var result = CreatResultLabel()
    
    override func draw(_ rect: CGRect) {
        
        
        let buttonArray: [[UIButton]] = [
            
                [CreatButton(text: "AC", isCorner: false), CreatButton(color: UIColor.orange, text: "÷")],
                [CreatButton(text: "7"), CreatButton(text: "8"), CreatButton(text: "9"), CreatButton(color: UIColor.orange, text: "x")],
                [CreatButton(text: "4"), CreatButton(text: "5"), CreatButton(text: "6"), CreatButton(color: UIColor.orange, text: "-")],
                [CreatButton(text: "1"), CreatButton(text: "2"), CreatButton(text: "3"), CreatButton(color: UIColor.orange, text: "+")],
                [CreatButton(text: "0", isCorner: false), CreatButton(color: UIColor.orange, text: "=")]
                   
                ]
               
               
        setLabel(result)
               
        let hStack0 = creatStack(buttonArray: [result])
        let hStack1 = creatStack(buttonArray: buttonArray[0])
        let hStack2 = creatStack(buttonArray: buttonArray[1])
        let hStack3 = creatStack(buttonArray: buttonArray[2])
        let hStack4 = creatStack(buttonArray: buttonArray[3])
        let hStack5 = creatStack(buttonArray: buttonArray[4])
               
               
               
        let VStack = UIStackView(arrangedSubviews: [hStack0, hStack1, hStack2, hStack3, hStack4, hStack5])
               //VStack.bounds = CGRect(x: -200.0, y: 10.0, width: 90.0, height: 90.0)
               //VStack.frame = CGRect(x: 200.0, y: 200.0, width: 900.0, height: 900.0)
        //VStack.bounds.size = CGSize(width: spacing*4+12*3, height: spacing*6+12*5)
      
        //VStack.bounds.size.width = bounds.size.width - 12 * 2
        VStack.bounds.origin = CGPoint(x: 0, y: -bounds.maxY)
            .offsetBy(dx: -12, dy: (spacing*6+12*5))
       
       // VStack.frame.origin = CGPoint(x:0, y:bounds.maxY).offsetBy(dx: 12, dy: -VStack.frame.size.height)
        
        print("result: \(result.frame.width),\(bounds.maxY), \(VStack.bounds.maxX), \(VStack.bounds.maxY), \(VStack.frame.maxX), \(VStack.frame.maxY)")
        
        VStack.axis = .vertical
        VStack.distribution = .fillEqually
        VStack.alignment = .fill
        VStack.spacing = 12
        VStack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(VStack)
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
           setNeedsDisplay()
           setNeedsLayout()
       }
    
    func CreatButton(color: UIColor = UIColor.gray, text: String, isCorner: Bool = true) -> UIButton {
             
     //        GeometryReader { geometry in
     //            //screenWidth: geometry.size.width //CG Float
     //        }
             
        let newButton = UIButton()
        newButton.frame.size = CGSize(width: spacing, height: spacing)
        newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        newButton.backgroundColor = color
        newButton.setTitle(text, for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        if isCorner {
            //newButton.layer.cornerRadius = newButton.bounds.size.width / 4
            newButton.clipsToBounds = true
            }
             //self.addSubview(newButton)
             
        return newButton
        
         }
    
         
    @objc func buttonAction(sender: UIButton!) {
           
    }
         
    func creatStack(buttonArray: [UIView]) -> UIStackView {
             
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //self.addSubview(stackView)
             
        return stackView
             
    }
         
         
         
         
    func CreatResultLabel () -> UILabel {
        let resultLabel = UILabel()
        resultLabel.numberOfLines = 0
        //self.addSubview(resultLabel)
        return resultLabel
    }
         
    func configureLabel () -> NSAttributedString {
             
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(36)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
             
        return NSAttributedString(string: "_", attributes: [.paragraphStyle:paragraphStyle, .font: font])
    }
         
    func setLabel(_ label: UILabel) {
        //label.text = "123456"
        label.attributedText = configureLabel()
        label.frame.size = CGSize.zero
        label.sizeToFit()
        label.frame.size.height = spacing
    }
}

extension CalculatorViewProgrammatically{
    
    private var spacing: CGFloat {
        return (bounds.size.width - 12 * 5)/4
    }
    
    private var heightOrigin: CGFloat {
        return bounds.size.height
            //- (6 * (bounds.size.width - 12 * 5) + 12 * 7)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
