//
//  ViewController.swift
//  DayFinder
//
//  Created by elina.peiseniece on 09/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 // MARK: Weekday Tapped
    
    @IBAction func findWeekdayTapped(_ sender: Any) {
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
           //alert
            warningPopup(withTitle: "Input Error", withMessage: "Date text fields can't be empty or contain letters")
            return
        }
        //dateComponents.day = dayTextField.text
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text {
        case "FIND":
            findButton.setTitle("CLEAR", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                self.resultLabel.text = weekday.capitalized
            }else{
                
                //alert
                warningPopup(withTitle: "Wrong Date", withMessage: "Please enter correct date")
                #warning("Testing the warning thing")
            }
        default:
            findButton.setTitle("FIND", for: .normal)
            clearTextField()
        }
    }
    
    func clearTextField(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of the week, inside your finder"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func warningPopup(withTitle title: String?, withMessage message: String?){
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "dayFinder"{
            // Get the new view controller using segue.destination.
            let vc = segue.destination as! InfoViewController
            
            // Pass the selected object to the new view controller.
            
            vc.infoText = "DayFinder App helps you \n find weekday for given date"
        }
        
        
    }
    
    
    





}

