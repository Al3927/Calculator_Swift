//
//  Calculator.swift
//  Calculator
//
//  Created by vinova on 4/6/20.
//  Copyright © 2020 vinova.test.Calculator. All rights reserved.
//

import Foundation

struct calculator
{
    
    let file = "File.txt"
    var Log = ""
    var result = ""
    var nearestOperator = ""
    var previousNumber = 0.0
    var isNewLife = true
    var ppNumber = 1.0
    var ppNumber1 = 1.0

    
    
    
    
    mutating func HandleEvent(_ buttonTitle: String?)
        {
            if isNewLife {
                //previousNumber = 0.0
                result = ""
            }
            //let buttonTitle = button.title(for: .normal)
            if buttonTitle != "="
            {
                //isNewLife = false
                if buttonTitle == "x"
                {
                    //previousNumber = result

                   Log += " x "
                   
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                      if previousNumber == 0.0 {
                            
                            if Double(result)! == 0.0
                            {
                                ppNumber1 = 0.0
                            }
                            previousNumber = Double(result)!
                            
                                       } else {
                            
                            handleOperator()
                        }
                        
                        if previousNumber != 0.0, ppNumber1 == 0.0
                        {
                            previousNumber = 0.0
                            ppNumber1 = 1
                        }
                    }
                    nearestOperator = "x"
                    result = ""
                    
                } else if buttonTitle == "÷" {
                    
                    Log += " ÷ "
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                        if previousNumber == 0.0 {
                            
                            if Double(result)! == 0.0
                            {
                                ppNumber = 0.0
                            }
                            previousNumber = Double(result)!
                            
                                       } else {
                            
                            handleOperator()
                        }
                        
                        if previousNumber != 0.0, ppNumber == 0.0
                        {
                            previousNumber = 0.0
                            ppNumber = 1
                        }
                    }
                    nearestOperator = "/"
                    result = ""
                    
                } else if buttonTitle == "-" {
                    
                    Log += " - "
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                        if previousNumber == 0.0 {
                                           previousNumber = Double(result)!
                                       }
                        else {
                           
                            handleOperator()
                            
                        }
                    }
                    nearestOperator = "-"
                    result = ""
                    
                } else if buttonTitle == "+" {
                    
                    Log += " + "
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                        if previousNumber == 0.0 {
                                           previousNumber = Double(result)!
                                       }
                        else {
                            
                            handleOperator()
                        }
                    }
                    nearestOperator = "+"
                    result = ""
                    
                    
                } else if buttonTitle == "AC" {
                    result = ""
                    Log = ""
                    isNewLife = true
                    previousNumber = 0.0
                    
                } else {
                    if isNewLife, nearestOperator == "" {
                        previousNumber = 0.0
                    }
                result += buttonTitle ?? "?"
                Log += buttonTitle ?? "?"
                }
                isNewLife = false
            } else {
                handleOperator()
                result = String(previousNumber)
                nearestOperator = ""
                isNewLife = true
                
                Log += " = " + "\(result)" + "\n"
    //            //File
    //
                //let Log1 = Log.data(using: .utf8)

                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = dir.appendingPathComponent(file)


                    do {
                        try Log.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                        //try Log1?.write(to: fileURL, options: .atomic)
                        print("writted!")
                    }
                    catch {
                        print("can't write!")
                    }
                }

                print("Log: \(Log)")
            }

            //bo
            //resultLabel.text = result
        }
    
    mutating func HandleEventByTag(_ buttonTag: Int)
        {
            if isNewLife {
                //previousNumber = 0.0
                result = ""
            }
            //let buttonTitle = button.title(for: .normal)
            if buttonTag != 1
            {
                //isNewLife = false
                if buttonTag == 4
                {
                    //previousNumber = result

                   Log += " x "
                   
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                      if previousNumber == 0.0 {
                            
                            if Double(result)! == 0.0
                            {
                                ppNumber1 = 0.0
                            }
                            previousNumber = Double(result)!
                            
                                       } else {
                            
                            handleOperator()
                        }
                        
                        if previousNumber != 0.0, ppNumber1 == 0.0
                        {
                            previousNumber = 0.0
                            ppNumber1 = 1
                        }
                    }
                    nearestOperator = "x"
                    result = ""
                    
                } else if buttonTag == 5 {
                    
                    Log += " / "
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                        if previousNumber == 0.0 {
                            
                            if Double(result)! == 0.0
                            {
                                ppNumber = 0.0
                            }
                            previousNumber = Double(result)!
                            
                                       } else {
                            
                            handleOperator()
                        }
                        
                        if previousNumber != 0.0, ppNumber == 0.0
                        {
                            previousNumber = 0.0
                            ppNumber = 1
                        }
                    }
                    nearestOperator = "/"
                    result = ""
                    
                } else if buttonTag == 3 {
                    
                    Log += " - "
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                        if previousNumber == 0.0 {
                                           previousNumber = Double(result)!
                                       }
                        else {
                           
                            handleOperator()
                            
                        }
                    }
                    nearestOperator = "-"
                    result = ""
                    
                } else if buttonTag == 2 {
                    
                    Log += " + "
                    
                    if result == "" || result == "." {
                        
                    } else {
                        
                        if previousNumber == 0.0 {
                                           previousNumber = Double(result)!
                                       }
                        else {
                            
                            handleOperator()
                        }
                    }
                    nearestOperator = "+"
                    result = ""
                    
                    
                } else if buttonTag == 6 {
                    result = ""
                    Log = ""
                    isNewLife = true
                    previousNumber = 0.0
                    
                } else {
                    if isNewLife, nearestOperator == "" {
                        previousNumber = 0.0
                    }
                result += String(buttonTag)
                Log += String(buttonTag)
                }
                isNewLife = false
            } else {
                handleOperator()
                result = String(previousNumber)
                nearestOperator = ""
                isNewLife = true
                
                Log += " = " + "\(result)" + "\n"
    //            //File
    //
                //let Log1 = Log.data(using: .utf8)

                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = dir.appendingPathComponent(file)


                    do {
                        try Log.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                        //try Log1?.write(to: fileURL, options: .atomic)
                        print("writted!")
                    }
                    catch {
                        print("can't write!")
                    }
                }

                print("Log: \(Log)")
            }

            //bo
            //resultLabel.text = result
        }
        
        
    mutating func handleOperator()
        {
            if result == "" || result == "." {
                
            } else {
                
                if nearestOperator == "+" {
                    previousNumber += Double(result)!
                } else if nearestOperator == "-" {
                    previousNumber -= Double(result)!
                }else if nearestOperator == "x" {
                    previousNumber *= Double(result)!
                }else if nearestOperator == "/" {
                    previousNumber /= Double(result)!
                }else {
                    previousNumber = Double(result)!
                }
            }
        }
    
}
