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
    //color values
    var newRed: CGFloat = 0.0
    var newGreen: CGFloat = 0.0
    var newBlue: CGFloat = 0.0
    var currentLoc: CLLocation!
    
    //text fields for custom shop values
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputLocation: UITextField!
    @IBOutlet weak var inputLat: UITextField!
    @IBOutlet weak var inputLon: UITextField!
    
    //button to add coffee shop at input location
    @IBAction func addShopCustom(_ sender: UIButton) {
        let title = self.inputTitle.text
        let location = self.inputLocation.text
        let lat = Double(self.inputLat.text!)
        let lon = Double(self.inputLon.text!)
        let coords : CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, lon!)
        let newShop = CoffeeShop(title: title!, locationName: location!, coordinate: coords)
        coffeeShops.append(newShop)
        MapVC?.moveTo(shop: newShop)
    }
    
    //button to add coffee shop at users current location
    @IBAction func addShop(_ sender: UIButton) {
        let coords : CLLocationCoordinate2D = CLLocationCoordinate2DMake(currentLoc.coordinate.latitude, currentLoc.coordinate.longitude)
        let newShop = CoffeeShop(title: "Current Coffee Shop", locationName: "Current Location", coordinate: coords)
        coffeeShops.append(newShop)
        MapVC?.moveTo(shop: newShop)
    }
    
    //color preview label
    @IBOutlet weak var colorPreview: UILabel!
    //red slider
    @IBAction func colorRed(_ sender: UISlider) {
        newRed = CGFloat(sender.value)
        MenuVC?.view.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        colorPreview.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    //green slider
    @IBAction func colorGreen(_ sender: UISlider) {
        newGreen = CGFloat(sender.value)
        MenuVC?.view.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        colorPreview.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    //blue slider
    @IBAction func colorBlue(_ sender: UISlider) {
        newBlue = CGFloat(sender.value)
        MenuVC?.view.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        colorPreview.backgroundColor = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //reference to other VC's
        let tabBarControllerArray0 = self.tabBarController!.viewControllers
        let tabBarControllerArray1 = self.tabBarController!.viewControllers
        let viewController0 = tabBarControllerArray0?[0]
        let viewController1 = tabBarControllerArray1?[1]
        MenuVC = viewController0 as? Menu_Screen
        MapVC = viewController1 as? Map_Screen
        
        //location for adding current shop
        currentLoc = MapVC?.locationManager.location
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
