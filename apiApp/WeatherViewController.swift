//
//  WeatherViewController.swift
//  apiApp
//
//  Created by admin on 6/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

//struct AdvancedCourse:Decodable {
//    let name:String
//    let description:String
//    let courses: [Course]
//}
//struct Course:Decodable {
//    let id:Int
//    let name:String
//    let link:String
//    let imageUrl:String
//}
struct StateInfo:Decodable {
    let status:String
    let copyright:String
    let congress:Int
    let num_results:Int
    let state:String
    let results:[Nominee]
}
struct Nominee:Decodable {
    let id:String
    let uri:String
    let date_received:String
    let description:String
    let nominee_state:String
    let committee:String
    let latest_action_date:String
    let status:String
}
class WeatherViewController: UIViewController {

    // First URL

    var stateInfo = ""
    var nominees:[Nominee] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var copyright: UILabel!
    @IBOutlet weak var congress: UILabel!
    @IBOutlet weak var numResults: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var weatherText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherText.text = "You searched for Nominees in \(stateInfo)"
        
        let apiString = "https://api.propublica.org/congress/v1/115/nominees/state/\(stateInfo).json"
        
        guard let url = URL(string:apiString) else
            { return }
        var request = URLRequest(url: url)
        
        request.setValue("IZEnyxkAoxMhJLkwJh55e4iWtPJQrXLBooo8j1hQ", forHTTPHeaderField: "X-API-Key")
        
        URLSession.shared.dataTask(with: request){(data, response, err) in
            
            guard let politicsData = data else {return}
            
            do {
                let pData = try JSONDecoder().decode(StateInfo.self, from: politicsData)
                
                self.nominees = pData.results
                DispatchQueue.main.async {
                    self.status.text = pData.status
                    self.copyright.text = pData.copyright
//                    self.copyright.lineBreakMode = NSLineBreakMode.byWordWrapping
//                    self.copyright.sizeToFit()
                    self.congress.text = String(pData.congress)
                    print(self.congress.text)
                    self.numResults.text = String(pData.num_results)
                    self.state.text = pData.state
                    //print("Nominees Are", self.nominees)
                    self.tableView.dataSource = self
                    self.tableView.delegate = self
                    self.tableView.reloadData()
                }
                
                
                //print(pData)
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
extension WeatherViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nominees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "cellId")

        cell.detailTextLabel?.text = self.nominees[indexPath.row].committee
        cell.textLabel?.text = self.nominees[indexPath.row].description
        return cell
    }
}
