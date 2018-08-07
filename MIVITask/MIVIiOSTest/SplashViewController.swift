//
//  SplashViewController.swift
//  MIVI iOS Test
//
//  Created by APPLE on 07/08/18.
//  Copyright © 2018 Deepak. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
var delegate: Any?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "INFOMATION", sender: self)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is InformationViewController){
            
            let detailVC = segue.destination as! InformationViewController
            detailVC.delegate = self
            //        detailVC.infoArr = dataArr
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
