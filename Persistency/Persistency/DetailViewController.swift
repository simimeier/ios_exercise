//
//  DetailViewController.swift
//  EditList
//
//  Created by Simon Meier on 07.10.20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.firstLabel.text = person?.firstName
        self.lastLabel.text = person?.lastName
        self.codeLabel.text = String(person?.postalCode ?? 0000)
        self.navigationItem.title = "\(person?.firstName ?? "new Person") \(person?.lastName ?? "")"
        self.navigationItem.backBarButtonItem?.title = "Master View"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! EditViewController
        destVC.person = self.person;
    }
        
    @IBAction func unwind(segue: UIStoryboardSegue) {
        self.viewWillAppear(false)
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
