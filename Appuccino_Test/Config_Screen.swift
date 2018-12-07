//
//  Config_Screen.swift
//  Appuccino_Test
//
//  Created by Shahab on 12/7/18.
//  Copyright © 2018 Shahab. All rights reserved.
//

import UIKit
import MapKit

class Config_Screen: UIViewController {
    //references to other view controllers
    var MenuVC: Menu_Screen?
    var MapVC: Map_Screen?
    
    //handles the user inputs to save new shops
    func addShop(title: String, location: String, lat: CLLocationDegrees, lon: CLLocationDegrees){
        coffeeShops.append(CoffeeShop(title: title, locationName: location, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon)))
    }
    //get the input values from user entering info

    override func viewDidLoad() {
        super.viewDidLoad()
        //reference to other VC's
        let tabBarControllerArray0 = self.tabBarController!.viewControllers
        let tabBarControllerArray1 = self.tabBarController!.viewControllers
        let viewController0 = tabBarControllerArray0?[0]
        let viewController1 = tabBarControllerArray1?[1]
        MenuVC = viewController0 as? Menu_Screen
        MapVC = viewController1 as? Map_Screen

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
