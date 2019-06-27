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

   
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeather(_ sender: Any) {
        performSegue(withIdentifier: "weatherSegue", sender: self)
        //self.inputText = self.textfield.text!
        //print(self.inputText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wv = segue.destination as! WeatherViewController
        //wv.weatherViewText = self.inputText
        wv.weatherViewText = self.textfield.text!
    }
}

