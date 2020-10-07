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
    
    var personData: PersonData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstLabel.text = personData!.firstName
        lastLabel.text = personData!.lastName
        codeLabel.text = String(personData!.plz)
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
