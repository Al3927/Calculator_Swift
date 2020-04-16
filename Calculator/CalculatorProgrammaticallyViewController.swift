//
//  CalculatorProgrammaticallyViewController.swift
//  Calculator
//
//  Created by vinova on 4/14/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import UIKit

class CalculatorProgrammaticallyViewController: UIViewController {
    
    var Calculator = calculator()
    
    lazy var result = CreatResultLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("1")
        
        view.backgroundColor = UIColor.black
        
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
        
        let VStack = UIStackView(arrangedSubviews: [hStack0, hStack1, hStack2, hStack3, hStack4, hStack5])
        //VStack.bounds = CGRect(x: 10.0, y: 10.0, width: 90.0, height: 90.0)
        //VStack.bounds.origin = CGPoint(x: -12, y: -(view.bounds.maxY - (buttonsize*6 + 12*5)))
        VStack.axis = .vertical
        VStack.distribution = .fillEqually
        VStack.alignment = .fill
        VStack.spacing = 12
        VStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(VStack)
        
        //https://stackoverflow.com/questions/26180822/how-to-add-constraints-programmatically-using-swift
        
                     //autolayout the stack view - pin 30 up 20 left 20 right 30 down
        let viewsDictionary = ["stackView":VStack]
        let stackView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[stackView]-30-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: viewsDictionary)
        view.addConstraints(stackView_H)
        view.addConstraints(stackView_V)
        //self.hStack1.style.flexBasis = ASDimensionMake("40%")
        // Do any additional setup after loading the view.
    }
    
    private func UpdateViewFromModel()
    {
        result.text = Calculator.result
    }
    
   // var frm = self.frame
    
    
    
   
    
    func CreatButton(color: UIColor = UIColor.gray, text: String, isCorner: Bool = true) -> UIButton {
        
//        GeometryReader { geometry in
//            //screenWidth: geometry.size.width //CG Float
//        }
        
        let newButton = UIButton()
        newButton.frame.size = CGSize(width: buttonsize, height: buttonsize)
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
        //stackView.bounds.origin = CGPoint(x: -12, y: -view.bounds.maxY + buttonsize * 6 + 12 * 4)
        stackView.axis = .horizontal
        if isFillEqually {
            stackView.distribution = .fillEqually
        } else {
            stackView.distribution = .fill
        }
        
        stackView.alignment = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //self.view.addSubview(stackView)
        
        return stackView
        
    }
    
    
    
    
    func CreatResultLabel () -> UILabel {
        let resultLabel = UILabel()
        resultLabel.numberOfLines = 0
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
        label.textColor = UIColor.white
        label.frame.size = CGSize.zero
        label.sizeToFit()
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

extension CalculatorProgrammaticallyViewController {
    
    private var buttonsize: CGFloat {
        return (self.view.bounds.width - 12 * 5)/4
    }
}
