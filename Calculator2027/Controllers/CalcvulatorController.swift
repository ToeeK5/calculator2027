//
//  ViewController.swift
//  Calculator2027
//
//  Created by  User on 14.10.2026.
//

import UIKit

class CalcvulatorController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var display: UITextField!
    var isTyping = false
    
    
    override func viewDidLoad() {
        // Thay doi thuoc tinh cho button
        //btnDigit.layer.cornerRadius = 10
        //btnDigit.clipsToBounds = true
    }
    
    //MARK: Ham xu ly phim so
    @IBAction func digitProcessing(_ sender: UIButton) {
        let digit = sender.titleLabel!.text!
        let currentDisplay = display.text!
        // Truong hop chu co so nao => Ghi de
        if !isTyping {
            display.text = digit
            // Thay doi trang thai
            if digit != "0" {
                isTyping = true
            }
        }
        else { // Noi so
            display.text = currentDisplay + digit
        }
    }
    
    //MARK: Ham xu ly chuc nang
    @IBAction func functionProcessing(_ sender: UIButton) {
        display.text = String(Double.pi)
        // Xoa trang thai phim so
        isTyping = false
    }
}

