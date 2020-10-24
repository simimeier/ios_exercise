//
//  ViewController.swift
//  ComAndCon
//
//  Created by Simon Meier on 20.10.20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var images : [ImageInfo] = []
    let dummyStrings : [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    var pickerData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.picker.delegate = self
        self.picker.dataSource = self
    
        pickerData = dummyStrings;
        loadListSync()
    }
    
    func loadListSync() -> [ImageInfo]? {
        var tmpJSONStrings : [String]  = [];
        
        
        let jsonURL = URL(string: "https://hslu.nitschi.ch/networking/data.json")
        
        let jsonData = try! Data(contentsOf: jsonURL!)
        
        let jsonDecoder = JSONDecoder()
        let responses = try! jsonDecoder.decode(Response.self, from: jsonData)
        images = responses.images;
        for image in responses.images {
            tmpJSONStrings.append(image.title)
        }

        pickerData = tmpJSONStrings;
        picker.reloadAllComponents()
        
        
        return nil
    }

    func loadImageSync(image: ImageInfo) -> UIImage? {
        //let url = URL(string: image.url)
        let data = try? Data(contentsOf: image.url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        imageView.image = UIImage(data: data!)
        titleLabel.text = image.title
        return nil;
    }

    func loadImageAsync(image: ImageInfo, completion: @escaping (UIImage?)->Void) {
        //completion(true)
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //loadImageSync(image: images[row])
        
        let myQueue = DispatchQueue(label: "ch.hslu.ios.MyQueue")
        myQueue.async { self.loadImageSync(image: self.images[row]) }
        
        
        
        return pickerData[row]
    }
    

}


struct Response: Codable {
    let images: [ImageInfo]
    let lastUpdate: Date
    let info: String
}

struct ImageInfo: Codable {
    let identifier: Int
    let title: String
    let text: String
    let url: URL
}

