//
//  EditViewController.swift
//  EditList
//
//  Created by Simon Meier on 12.10.20.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    var person : Person?
    @IBOutlet weak var fieldFirstname: UITextField!
    @IBOutlet weak var fieldLastname: UITextField!
    @IBOutlet weak var fieldPostalcode: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fieldFirstname.delegate = self
        self.fieldLastname.delegate = self
        self.fieldPostalcode.delegate = self

    }

    override func viewWillAppear(_ animated: Bool) {
        self.fieldFirstname.text = person?.firstName ?? ""
        self.fieldLastname.text = person?.lastName ?? ""
        self.fieldPostalcode.text = String(person?.postalCode ?? 0000)
    }

    
    @IBAction func saveChanges(_ sender: Any) {
        self.person?.firstName = self.fieldFirstname.text ?? ""
        self.person?.lastName = self.fieldLastname.text ?? ""
        self.person?.postalCode = Int(self.fieldPostalcode.text ?? "0000") ?? 0000
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
