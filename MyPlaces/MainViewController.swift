//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Александр Уткин on 02/10/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
   
    let places = [
        Place(name: "Burger Heroes", location: "Alanya", type: "Cafe", image: "Burger Heroes"),
        Place(name: "Kitchen", location: "Alanya", type: "Cafe", image: "Kitchen"),
        Place(name: "Bonsai", location: "Alanya", type: "Cafe", image: "Bonsai"),
        Place(name: "Дастархан", location: "Alanya", type: "Cafe", image: "Дастархан"),
        Place(name: "Индокитай", location: "Alanya", type: "Cafe", image: "Индокитай"),
        Place(name: "X.O", location: "Alanya", type: "Cafe", image: "X.O"),
        Place(name: "Sherlock Holmes", location: "Alanya", type: "Cafe", image: "Sherlock Holmes"),
        Place(name: "Speak Easy", location: "Alanya", type: "Cafe", image: "Speak Easy"),
        Place(name: "Morris Pub", location: "Alanya", type: "Cafe", image: "Morris Pub"),
        Place(name: "Вкусные истории", location: "Alanya", type: "Cafe", image: "Вкусные истории"),
        Place(name: "Классик", location: "Alanya", type: "Cafe", image: "Классик"),
        Place(name: "Love&Life", location: "Alanya", type: "Cafe", image: "Love&Life"),
        Place(name: "Шок", location: "Alanya", type: "Cafe", image: "Шок"),
        Place(name: "Бочка", location: "Alanya", type: "Cafe", image: "Бочка")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
               
        cell.ImageOfPlace.image = UIImage.init(named: places[indexPath.row].image)
        cell.NameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.ImageOfPlace.clipsToBounds = true
        cell.ImageOfPlace.layer.cornerRadius = cell.ImageOfPlace.frame.size.height / 2
        return cell
    }
        
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
     
    }
    */

    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {
        
    }
}
