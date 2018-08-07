//
//  ViewController.swift
//  MIVI iOS Test
//
//  Created by APPLE on 07/08/18.
//  Copyright © 2018 Deepak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var passWord_Tf: UITextField!
    @IBOutlet weak var userName_Tf: UITextField!
    var dataArr = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
    @IBAction func clicked_Login(_ sender: Any) {
        
        if (!(userName_Tf.text?.isEmpty)! && !(passWord_Tf.text?.isEmpty)!) {
            
//             getJSONData()
            self.performSegue(withIdentifier: "Splach", sender: self)
            
        } else {
            // disable button
        }
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.destination is SplashViewController){

        let detailVC = segue.destination as! SplashViewController
        detailVC.delegate = self
//        detailVC.infoArr = dataArr
    }
    
    }
    
    func getJSONData()  {
        
        let requestWithData = self.requestBody(serviceUrl:"https://gitlab.com/mfebrianto/mivi-ios-android-test/blob/master/collection.json",params:"",methodType:"GET")
        guard let request =  requestWithData
            else
        {
            return
        }
        dataTaskResponse(request:request)
    }
    
    // =========================================================================
    // MARK: - REQUEST BODY
    func requestBody(serviceUrl:String!,params:String!,methodType:String!) ->URLRequest?
    {
        let set = CharacterSet.urlQueryAllowed
        let encodedUrlAsString = serviceUrl.addingPercentEncoding(withAllowedCharacters: set)
        let urlPoint=URL(string:encodedUrlAsString!)
        guard let url = urlPoint
            else
        {
            return nil
        }
        var request = URLRequest(url:url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        
        request.httpMethod=methodType
        
        //        request.addValue(modelName, forHTTPHeaderField:"deviceName")
        
        print("\(request.allHTTPHeaderFields!)")
        return request
    }
    // MARK: - DATA TASK RESPONSE DELEGATE
    
    func dataTaskResponse(request:URLRequest)
    {
        let session = URLSession.shared
        
        let task1=session.dataTask(with: request) { (data, response, error) in
            guard error == nil
                else
            {
                print("error calling GET on /todos/1")
                print("\(error!)")
                
                return
            }
            guard let responseData = data else
            {
                print("Error: did not receive data")
                
                return
            }
            do
            {
                
//                self.dataArr =   try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as! NSArray
                
                guard let data = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("error trying to convert data to JSON")
                    return
                }
                print("\(data)")
                if  let dataDict = data["data"] as? NSDictionary
                {
                    
                    print("\(dataDict)")
                }
                else{
                    print("error trying to convert data to JSON")
                }
//                print(self.dataArr)
                
            }
            catch
            {
                print("error trying to convert data to JSON")
                return
            }
            
        }
        
        task1.resume()
    }
}

