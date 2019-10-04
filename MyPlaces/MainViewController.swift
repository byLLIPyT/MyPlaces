//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Александр Уткин on 02/10/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
   
    var places = [
        Place(name: "Burger Heroes", location: "Alanya", type: "Cafe", Restourantimage: "Burger Heroes"),
        Place(name: "Kitchen", location: "Alanya", type: "Cafe", Restourantimage: "Kitchen"),
        Place(name: "Bonsai", location: "Alanya", type: "Cafe", Restourantimage: "Bonsai"),
        Place(name: "Дастархан", location: "Alanya", type: "Cafe", Restourantimage: "Дастархан"),
        Place(name: "Индокитай", location: "Alanya", type: "Cafe", Restourantimage: "Индокитай"),
        Place(name: "X.O", location: "Alanya", type: "Cafe", Restourantimage: "X.O"),
        Place(name: "Sherlock Holmes", location: "Alanya", type: "Cafe", Restourantimage: "Sherlock Holmes"),
        Place(name: "Speak Easy", location: "Alanya", type: "Cafe", Restourantimage: "Speak Easy"),
        Place(name: "Morris Pub", location: "Alanya", type: "Cafe", Restourantimage: "Morris Pub"),
        Place(name: "Вкусные истории", location: "Alanya", type: "Cafe", Restourantimage: "Вкусные истории"),
        Place(name: "Классик", location: "Alanya", type: "Cafe", Restourantimage: "Классик"),
        Place(name: "Love&Life", location: "Alanya", type: "Cafe", Restourantimage: "Love&Life"),
        Place(name: "Шок", location: "Alanya", type: "Cafe", Restourantimage: "Шок"),
        Place(name: "Бочка", location: "Alanya", type: "Cafe", Restourantimage: "Бочка")
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
               
        let place = places[indexPath.row]
        
        
        cell.NameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil {
                cell.ImageOfPlace.image = UIImage.init(named: place.Restourantimage!)
        }else {
            cell.imageView?.image = place.image
        }
        
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

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }
}
