//
//  ViewController.swift
//  IB-DEMO
//
//  Created by Simon Meier on 22.09.20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var spinnerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var alertShown = false
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        labelValue.text =  String(format: "%.2f", sender.value)
        
        if (sender.value > Float(70) && self.alertShown == false) {
            self.alertShown = true
                
            let alertController = UIAlertController(
                title: "Alert",
                message: "You've reached 70%!",
                preferredStyle: .alert
            )
            let alertOkAction = UIAlertAction(
                title: "OK",
                style: .destructive,
                handler: nil
            )
            alertController.addAction(alertOkAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if (sender.value < Float(70) && self.alertShown == true) {
            self.alertShown = false
        }
        
    }
    
    
    @IBAction func colorButtonValueChanged(_ sender: UISegmentedControl) {
        let selectedSegment: Int = sender.selectedSegmentIndex;
        
        if(selectedSegment==0){
            self.view.backgroundColor = .white
        } else{
            self.view.backgroundColor = .gray
        }
        
    }
    
    @IBAction func spinButtonPressed(_ sender: UIButton) {
        if(spinner.isAnimating) {
            spinner.stopAnimating()
            spinnerButton.setTitle("start spinning", for: .normal)
        } else {
            spinner.startAnimating()
            spinnerButton.setTitle("stop spinning", for: .normal)
            
        }
     
    }
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Information",
            message: "Congratulations, you just pressed the i-Button at the top right! It looks like you're enjoying this beautiful application... ;-)",
            preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        let cancelAction = UIAlertAction(
            title: "...really?",
            style: .cancel,
            handler: nil)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

