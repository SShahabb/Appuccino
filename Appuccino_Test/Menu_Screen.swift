//
//  Menu_Screen.swift
//  Appuccino_Test
//
//  Created by Jess on 12/7/18.
//  Copyright © 2018 Jess. All rights reserved.
//

import UIKit

class Menu_Screen: UIViewController // UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    //references to other view controllers
    var MapVC: Map_Screen?
    //var 3rd screen
    
    //object for annotation segue
    var pin: CoffeeShop!
    
    @IBOutlet weak var Points: UILabel!
    
    @IBOutlet weak var MenuSearch: UISearchBar!
    
    @IBOutlet weak var MenuList: UITableView!
    
    var list = ["Coffee", "Bagel", "Bacon", "Cappuccino", "Apple", "Candy", "Xray", "Banana", "Expresso", "Zebra"]
    var SearchItem = [String]()
    var Searching = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Menu_Screen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Searching {
            return SearchItem.count
        } else {
            return list.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        if Searching {
            Cell.textLabel?.text = SearchItem[indexPath.row]
        } else {
            Cell.textLabel?.text = list[indexPath.row]
        }
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var index: Int = 0
        var trackPoints: [Int] = [index]
        
        func setPoints(pointCount: Int) {
            if(index == 10) {
                index = 0
            }
        
            trackPoints[index] = pointCount
            //index += 1
        }
        
        let tempPoints: [Int] = trackPoints
        let pointIndex = "Your Appuccino Points: \(tempPoints)"
        
        switch self.list[indexPath.row] {
            
            case "Coffee":
                self.Points.text = pointIndex
            
            case "Cappuccino":
                self.Points.text = pointIndex
            
            default:
              print("random random")
            }
        
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

extension Menu_Screen: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchItem = list.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        Searching = true
        MenuList.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Searching = false
        searchBar.text = ""
        MenuList.reloadData()
    }
    
    
}


