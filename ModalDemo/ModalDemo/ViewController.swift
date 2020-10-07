//
//  ViewController.swift
//  ModalDemo
//
//  Created by Simon Meier on 30.09.20.
//

import UIKit

class ViewController: UIViewController {
    
    var appearanceCounter : Int = 0;
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        
        if(counterLabel != nil) {
            appearanceCounter += 1;
            counterLabel.text = String(appearanceCounter) + ". appearance"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showSecondView(_ sender: UIButton) {
        let secondViewController: SecondViewController = SecondViewController();
        secondViewController.modalPresentationStyle = .fullScreen
        
        // Variante 1 - Presents a view controller modally.
        // self.present(secondViewController, animated: true, completion: nil)
        
        // Variante 2 - Presents a view controller in a primary context.
        self.show(secondViewController, sender: sender)
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
        //nothing
    }
    
    @IBAction func backCostumAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}



