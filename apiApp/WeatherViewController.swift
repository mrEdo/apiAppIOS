//
//  WeatherViewController.swift
//  apiApp
//
//  Created by admin on 6/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

struct AdvancedCourse:Decodable {
    let name:String
    let description:String
    let courses: [Course]
}
struct Course:Decodable {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
}


class WeatherViewController: UIViewController {

    // First URL

    
   
    var weatherViewText = ""
    
    @IBOutlet weak var weatherText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherText.text = weatherViewText
        
        let apiString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string:apiString) else
            { return }
        
        URLSession.shared.dataTask(with: url){(data, response, err) in
            
            guard let courseData = data else {return}
            
            do {
                let course = try JSONDecoder().decode(AdvancedCourse.self, from: courseData)
                //let course = try JSONDecoder().decode([Course].self, from: courseData)
                }
                print(course.courses[1].name)
            } catch let jsonErr {
                print("You've got the following jsonError \(jsonErr)")
            }
            
        }.resume()
        
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
