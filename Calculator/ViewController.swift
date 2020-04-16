//
//  ViewController.swift
//  Calculator
//
//  Created by vinova on 4/3/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var arrayRoundButton: [UIButton]!
    
    var Calculator = calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundButton(arrayRoundButton)
        
    }

    @IBAction func touchButton(_ sender: UIButton) {
        
       
            //Handle Event by Tag
        //Phan nay em can identify cho button 123456789 nua, gio identify cua no deu la 0 nen chua lam xong a.
//        let buttonTag = sender.tag
//
//        print("\(buttonTag)")
//
//        Calculator.HandleEventByTag(buttonTag)
            
            //Handle Event by String
             if let buttonTitle = sender.title(for: .normal)
             {
                Calculator.HandleEvent(buttonTitle)
            }
            
            UpdateViewFromModel()
    }
    
    private func UpdateViewFromModel()
    {
        resultLabel.text = Calculator.result
    }
    

    func roundButton(_ button: [UIButton]!)
    {
        for i in button.indices
        {
            button[i].layer.cornerRadius = button[i].bounds.size.width / 6
            // button.layer.masksToBounds = true
             button[i].clipsToBounds = true
        }
        
    }
}

