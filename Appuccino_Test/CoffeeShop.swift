//
//  CoffeeShop.swift
//  Appuccino_Test
//
//  Created by Shahab on 12/7/18.
//  Copyright © 2018 Shahab. All rights reserved.
//

import UIKit
import MapKit

class CoffeeShop: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    //var menu = [String]() //init from jess' coffee menu
    
    //initializes the coffee shop object
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
    var subtitle: String? { return locationName } //can change this later for more customization
}
