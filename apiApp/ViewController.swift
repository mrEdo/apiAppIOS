//
//  ViewController.swift
//  apiApp
//
//  Created by admin on 6/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inputText = ""

    @IBOutlet weak var weatherInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeather(_ sender: Any) {
        performSegue(withIdentifier: "weatherSegue", sender: self)
        //self.inputText = weatherInput.text
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var wv = segue.destination as! WeatherViewController
        //wv.weatherViewText = self.weatherInput.text!
         wv.weatherViewText = "This form the main controller"
    }
}

