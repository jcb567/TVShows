//
//  ViewController.swift
//  TVShows
//
//  Created by Jake Cameron Booth on 29/03/2017.
//  Copyright © 2017 Jake Cameron Booth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var shows : [Show] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            shows = try context.fetch(Show.fetchRequest())
            print(shows)
            
        } catch {
            
        }
    
        func tableView(_: <#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>) -> Int {
            return shows.count
        }
        
        func tableView(_: <#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>) -> UITableViewCell {
            let cell = UITableViewCell()
            let item = shows[IndexPath.row]
            cell.textLabel?.text = item.name
            return cell
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

