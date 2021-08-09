 //
//  AppearanceViewController.swift
//  DayFinder
//
//  Created by elina.peiseniece on 09/08/2021.
//

import UIKit

class AppearanceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func openSettingsTapped(_ sender: Any) {
        openSettings()
    }
    
    func setLabelText(){
        
    }
    
    
    func openSettings(){
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { success in
                print("success: ",success)
            }
        }
    }
}

 
 
 
