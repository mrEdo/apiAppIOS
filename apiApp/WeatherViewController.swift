//
//  WeatherViewController.swift
//  apiApp
//
//  Created by admin on 6/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var weatherViewText = ""
    
    @IBOutlet weak var weatherText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherText.text = self.weatherViewText

        // Do any additional setup after loading the view.
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
