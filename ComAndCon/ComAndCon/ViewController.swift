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
        self.images = loadListSync()!
    }
    
    func loadListSync() -> [ImageInfo]? {
        //var tmpJSONStrings : [String]  = [];
        
        let jsonURL = URL(string: "https://hslu.nitschi.ch/networking/data.json")
        
        let jsonData = try! Data(contentsOf: jsonURL!)
        
        let jsonDecoder = JSONDecoder()
        let responses = try! jsonDecoder.decode(Response.self, from: jsonData)
        /*images = responses.images;
        for image in responses.images {
            tmpJSONStrings.append(image.title)
        }

        pickerData = tmpJSONStrings;
        picker.reloadAllComponents()*/
        
        
        return responses.images
    }

    func loadImageSync(image: ImageInfo) -> UIImage? {
        let image = (try? Data(contentsOf: image.url))!
        return UIImage(data: image)
    }

    func loadImageAsync(image: ImageInfo, completion: @escaping (UIImage?)->Void) {
        DispatchQueue.global(qos: .background).async {
            let result = self.loadImageSync(image: image)
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadImageAsync(image: self.images[row], completion: {image in self.imageView.image = image})
        titleLabel.text = images[row].title
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return images[row].title
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
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

