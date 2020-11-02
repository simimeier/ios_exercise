//
//  ViewController.swift
//  Frame-Works
//
//  Created by Simon Meier on 31.10.20.
//

import UIKit
import Contacts
import ContactsUI
import MapKit
import EventKit
import EventKitUI

class ViewController: UIViewController, CNContactPickerDelegate, MKMapViewDelegate {

    @IBOutlet weak var vornameLabel: UILabel!
    @IBOutlet weak var nachnameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    //let annotationBahnhof: MKPointAnnotation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 47.13940889755092, longitude: 8.42719891113283)// .. populate your center
        let latitudinalMeters: CLLocationDistance = 10000
        let longitudinalMeters: CLLocationDistance = 10000
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
        self.mapView.setRegion(region, animated: false)
        
        
        let annotationBahnhof = MKPointAnnotation()
        annotationBahnhof.title = "Rotkreuz"
        annotationBahnhof.subtitle = "Bahnhof"
        annotationBahnhof.coordinate = CLLocationCoordinate2D(latitude: 47.141725941461814, longitude: 8.430460477294723)
        self.mapView.addAnnotation(annotationBahnhof)
        
        
        let annotationHSLU = MKPointAnnotation()
        annotationHSLU.title = "HSLU I"
        annotationHSLU.subtitle = "Hochschule Luzern Informatik"
        annotationHSLU.coordinate = CLLocationCoordinate2D(latitude: 47.143516, longitude: 8.432762)
        self.mapView.addAnnotation(annotationHSLU)
        
        
    }

    @IBAction func getPersonButtonPressed(_ sender: Any) {
        let contactVC = CNContactPickerViewController()
        contactVC.delegate = self
        self.show(contactVC, sender: nil)
        
    }
    
    @IBAction func editEventButtonPressed(_ sender: Any) {
       
    }
    
    @IBAction func showHSLUButtonPressed(_ sender: Any) {
        for annotation in mapView.annotations as [MKAnnotation] {
            if(annotation.title == "HSLU I") {
                let latitudinalMeters: CLLocationDistance = 200
                let longitudinalMeters: CLLocationDistance = 200
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
                self.mapView.setRegion(region, animated: false)
            }
        }
        
    }
    
    
    func mapView(_ mapview: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
        annoView.pinTintColor = .green
        return annoView
    }
  
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        vornameLabel.text = contact.givenName
        nachnameLabel.text = contact.familyName
    }

        
}

