//
//  CalculatorProgrammaticallyByFrameViewController.swift
//  Calculator
//
//  Created by vinova on 4/15/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import UIKit

class setStack: UIStackView {
    var sizeee: CGSize {
        return self.superview!.frame.size
    }
    override var intrinsicContentSize: CGSize {
        return sizeee
    }
}

class CalculatorProgrammaticallyByFrameViewController: UIViewController {
    
    var Calculator = calculator()
    
    var btnSize = CGFloat(0.0)
    
    var spacing = CGFloat(0.0)
    
    private let autoVC = UIViewController()
    
    //private let sss = UIView()
    ///
    lazy var result = CreatResultLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
        
        addChild(autoVC)
        view.addSubview(autoVC.view)
        
        print("1")
        
        creatVStack()
//        autoVC.view.frame.size = CGSize(width: self.view.frame.size.width, height: btnSize * 6 + 12 * 6)
            //buttonsize*6 + 12*6)
        
        //VStack.bounds.size = view.systemLayoutSizeFitting(VStack.bounds.size)
        
        autoVC.view.frame.size = CGSize(width: self.view.frame.size.width - spacing * 2, height: btnSize * 6 + spacing * 7)
        autoVC.view.frame.origin = CGPoint(x: spacing, y: (view.bounds.maxY - autoVC.view.frame.height))
        
        
         //print("\(buttonArray[1][0].frame.size.height), \(buttonsize) , \(VStack.frame), \((autoVC.view.frame)), view width: \(view.bounds.width) \n")
        

    }
    
    private func creatVStack() {
        let buttonArray: [[UIButton]] = [
                    [CreatButton(text: "AC"), CreatButton(color: UIColor.orange, text: "÷")],
                    [CreatButton(text: "7"), CreatButton(text: "8"), CreatButton(text: "9"), CreatButton(color: UIColor.orange, text: "x")],
                    [CreatButton(text: "4"), CreatButton(text: "5"), CreatButton(text: "6"), CreatButton(color: UIColor.orange, text: "-")],
                    [CreatButton(text: "1"), CreatButton(text: "2"), CreatButton(text: "3"), CreatButton(color: UIColor.orange, text: "+")],
                    [CreatButton(text: "0"),CreatButton(text: "."), CreatButton(color: UIColor.orange, text: "=")]
                    
                   ]
                
        //        let number0 = buttonArray[4][0]
        //        let special = buttonArray[4][1]
        //        let views = ["n0": number0, "sp": special]
        //        let stackView_equal_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|[n0]-[sp(==n0)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        //        view.addConstraints(stackView_equal_H)
                
               
                
                //view.addConstraints([equalWidthForNumber0])
                
                setLabel(result)
                
                let hStack0 = creatStack(buttonArray: [result])
                let hStack1 = creatStack(buttonArray: buttonArray[0], isFillEqually: false)
                let hStack2 = creatStack(buttonArray: buttonArray[1])
                let hStack3 = creatStack(buttonArray: buttonArray[2])
                let hStack4 = creatStack(buttonArray: buttonArray[3])
                let hStack5 = creatStack(buttonArray: buttonArray[4], isFillEqually: false)
                
                buttonArray[4][0].widthAnchor.constraint(equalTo: buttonArray[4][1].widthAnchor, multiplier: 2.0).isActive = true
                buttonArray[4][1].widthAnchor.constraint(equalTo: buttonArray[4][2].widthAnchor, multiplier: 1.0).isActive = true
                
                buttonArray[0][0].widthAnchor.constraint(equalTo: buttonArray[0][1].widthAnchor, multiplier: 3.0).isActive = true
                
                let VStack = setStack(arrangedSubviews: [hStack0, hStack1, hStack2, hStack3, hStack4, hStack5])
                //VStack.bounds = CGRect(x: 10.0, y: 10.0, width: 90.0, height: 90.0)
                //VStack.bounds.origin = CGPoint(x: -12, y: -(view.bounds.maxY - (buttonsize*6 + 12*5)))
                VStack.axis = .vertical
                VStack.distribution = .fillEqually
                VStack.alignment = .fill
                VStack.spacing = spacing
                VStack.translatesAutoresizingMaskIntoConstraints = false
                
                
                autoVC.view.addSubview(VStack)
                
               
                
                
                
                
        //        VStack.bounds.size = CGSize(width: autoVC.view.bounds.width, height: autoVC.view.bounds.height)
        //        autoVC.view.bounds.origin = CGPoint(x: 20, y: (view.bounds.maxY * 0.3))
                VStack.frame.origin = CGPoint(x: 0, y: 0)
                VStack.frame.size = CGSize(width: autoVC.view.frame.width, height: autoVC.view.frame.height)
                VStack.bounds.size = CGSize(width: autoVC.view.frame.width, height: autoVC.view.frame.height)
    }
    
    private func UpdateViewFromModel()
    {
        result.text = Calculator.result
    }
    
//    private func rowSize(forView view: UIView) -> CGSize {
//        return view.systemLayoutSizeFitting(
//            CGSize(width: view.bounds.width,
//                   height: UIView.layoutFittingCompressedSize.height)
//        )
//    }
//
//    override func systemLayoutFittingSizeDidChange(forChildContentContainer: UIContentContainer) {
//        view.setNeedsLayout()
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //creatVStack()

         autoVC.view.frame.size = CGSize(width: self.view.frame.size.width - spacing * 2, height: btnSize * 6 + spacing * 7)
        
        autoVC.view.frame.origin = CGPoint(x: spacing, y: (view.bounds.maxY - autoVC.view.frame.height))
        //autoVC.view.frame.size = CGSize(width: self.view.frame.size.width, height: buttonsize2*6 + 12*6)
        
//        autoVC.view.frame.origin = CGPoint(x: 20, y: (view.bounds.maxY - autoVC.view.frame.height))
        
//        autoVC.view.frame.origin = CGPoint(x: 20, y: (view.bounds.maxY * 0.3))
        //autoVC.view.frame.origin = CGPoint(x: 20, y: (view.bounds.maxY - autoVC.view.frame.height))
        
        print(" \((autoVC.view.frame)), view width: \(view.frame.width) \n")
    }
    
   // var frm = self.frame
    
    

   
    
    func CreatButton(color: UIColor = UIColor.gray, text: String, isCorner: Bool = true) -> UIButton {
        
//        GeometryReader { geometry in
//            //screenWidth: geometry.size.width //CG Float
//        }
        
        let newButton = UIButton()
        newButton.frame.size = CGSize(width: btnSize, height: btnSize)
        newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        newButton.backgroundColor = color
        newButton.setTitle(text, for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        if isCorner {
            newButton.layer.cornerRadius = newButton.bounds.size.width / 4
            newButton.clipsToBounds = true
        }
        //self.view.addSubview(newButton)
        
        return newButton
    }
    
    @objc func buttonAction(sender: UIButton!) {
      
        if let buttonTitle = sender.title(for: .normal)
       {
          Calculator.HandleEvent(buttonTitle)
      }
      
      UpdateViewFromModel()
    }
    
    func creatStack(buttonArray: [UIView], isFillEqually: Bool = true) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.frame.size = CGSize(width: self.view.frame.size.width, height: btnSize)
        //stackView.bounds.size = CGSize(width: self.view.frame.size.width, height: btnSize)
        //stackView.bounds.origin = CGPoint(x: -12, y: -view.bounds.maxY + buttonsize * 6 + 12 * 4)
        stackView.axis = .horizontal
        if isFillEqually {
            stackView.distribution = .fillEqually
        } else {
            stackView.distribution = .fill
        }
        
        stackView.alignment = .fill
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        autoVC.view.addSubview(stackView)
        
        return stackView
        
    }
    
    
    
    
    func CreatResultLabel () -> UILabel {
        let resultLabel = UILabel()
        resultLabel.numberOfLines = 1
        //self.view.addSubview(resultLabel)
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
        label.frame.size = CGSize(width: self.view.frame.width, height: btnSize)
        //label.sizeToFit()
    }

    func layoutTrait(traitCollection: UITraitCollection)
    {
        if traitCollection.horizontalSizeClass == .compact, traitCollection.verticalSizeClass == .regular {
            
            spacing = 12
            
            btnSize = buttonsize
            
            
            //autoVC.view.frame.size = CGSize(width: self.view.frame.size.width, height: btnSize * 6 + 12 * 6)
            
        }
        else {
            
            spacing = 24
            
            btnSize = buttonsize1
            
            
            //autoVC.view.frame.size = CGSize(width: self.view.frame.size.width, height: btnSize * 6 + 12 * 6)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        super.traitCollectionDidChange(previousTraitCollection)

        layoutTrait(traitCollection: traitCollection)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CalculatorProgrammaticallyByFrameViewController {
    
    private var buttonsize: CGFloat {
        return (self.view.bounds.width - spacing * 5)/4
    }
    
    private var buttonsize1: CGFloat {
        
        
           return (self.view.bounds.height - spacing * 7)/6
        
       }
    
    private var buttonsize2: CGFloat {
           return (414 - 12 * 5)/4
       }
}
