//
//  CalculatorLog.swift
//  Calculator
//
//  Created by vinova on 4/3/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import UIKit

class CalculatorLog: UIViewController {

    @IBOutlet weak var logTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        logTextView.text = ""
        // File can not read by normal way
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)


            //reading
            do {
                
                let Log = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
                //let savedText = try String(contentsOf: fileURL)
                logTextView.text += Log
            }
            catch {/* error handling here */}
        }
       
        //
        
        //File can read by normal way
//        let path = Bundle.main.path(forResource: "File", ofType: "txt") // file path for file "data.txt"
//        do {
//            let Log = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
//            logTextView.text += Log
//        } catch {}
        
    }
    
    let file = "File.txt" //this is the file. we will write to and read from it

    

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
