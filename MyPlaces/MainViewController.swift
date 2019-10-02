//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Александр Уткин on 02/10/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let restaurantName = [
    "Burger Heroes","Kitchen","Bonsai","Дастархан",
    "Индокитай","X.O","Балкан Гриль","Sherlock Holmes",
    "Speak Easy","Morris Pub","Вкусные истории",
    "Классик","Love&Life","Шок","Бочка"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantName.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
               
        cell.ImageOfPlace.image = UIImage.init(named: restaurantName[indexPath.row])
        cell.NameLabel.text = restaurantName[indexPath.row]
        cell.locationLabel.text = ""
        cell.typeLabel.text = ""
        cell.ImageOfPlace.clipsToBounds = true
        cell.ImageOfPlace.layer.cornerRadius = cell.ImageOfPlace.frame.size.height / 2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
     
    }
    */

}
