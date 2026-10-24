
import UIKit

class CalcvulatorController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var display: UITextField!
    var isTyping = false
    
    //MARK: Bien tinh toan trung gian giua phuong thuc functionProcessing va MH display
    var displayValue: Double? {
        get {
            if let strNumber = display.text, let number = Double(strNumber) {
                return number
            } else {
                return nil
            }
        }
        set {
            let pn = newValue!.soChuSoPhanNguyen()
            let ptp = newValue!.soChuSoPhanThapPhan()
            if pn + ptp <= 12 { // Khong can lam tron
                display.text = String(newValue!)
            } else {
                display.text = String(format: "%.\(12-pn)f", newValue!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Xu ly cac truong hop tinh toan
        let functionSymbol = sender.titleLabel!.text!
        switch functionSymbol {
        case "e":
            displayValue = M_E
        case "π":
            displayValue = Double.pi
        case "√":
            if let number = displayValue {
                displayValue = sqrt(number)
            }
        case "cos":
            if let number = displayValue {
                displayValue = cos(number)
            }
        case "±":
            if let number = displayValue {
                displayValue = sign(number)
            }
        default:
            break
        }
        
        // Xoa trang thai phim so
        isTyping = false
    }
}

extension Double {
    func soChuSoPhanNguyen() -> Int {
        return String(self).split(separator: ".")[0].count
    }
    
    func soChuSoPhanThapPhan() -> Int {
        return String(self).split(separator: ".")[1].count
    }
}