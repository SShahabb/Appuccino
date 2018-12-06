//
//  CoffeeShop.swift
//  Appuccino_Test
//
//  Created by Shahab on 12/7/18.
//  Copyright © 2018 Guest User. All rights reserved.
//

import UIKit
import MapKit

class CoffeeShop: NSObject, MKAnnotation {
    //do i need references to the vc's?
    let title: String?
    let locationName: String
    let discipline: String //description
    let coordinate: CLLocationCoordinate2D
    
    var menu = [String]() //init from jess' coffee menu
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }

}
