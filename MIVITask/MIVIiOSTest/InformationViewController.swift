//
//  InformationViewController.swift
//  MIVI iOS Test
//
//  Created by APPLE on 07/08/18.
//  Copyright © 2018 Deepak. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var info_TextView: UITextView!
    
    @IBAction func Click_Logout(_ sender: Any) {
    }
    
    var delegate: Any?
    var infoDict = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //
        do {
            if let file = Bundle.main.url(forResource: "collection", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    infoDict = NSDictionary(dictionary: (object as? NSDictionary)!)
                    if(infoDict.object(forKey: "included") is NSArray){
                        
                      let includedArr =  infoDict.object(forKey: "included") as? NSArray
                        print(includedArr![2])
                        info_TextView.text = String(format: "Data: %@", includedArr!)

                    }
                } else if let object = json as? [Any] {
                    // json is an array
//                    infoArr = NSArray(array: object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
