//
//  Map_Screen.swift
//  Appuccino_Test
//
//  Created by Shahab on 12/7/18.
//  Copyright © 2018 Shahab. All rights reserved.
//

import UIKit
import MapKit

//global array of shops
var coffeeShops = [CoffeeShop]()

class Map_Screen: UIViewController {
    //references to other view controllers
    var MenuVC: Menu_Screen?
    var ConfigVC: Config_Screen?
    //labels and outlets
    @IBOutlet weak var mapView: MKMapView!
    //location access delegate
    let locationManager = CLLocationManager()
    
    //initial map values for KSU
    let lat : CLLocationDegrees = 41.1491
    let lon : CLLocationDegrees = -81.3415
    let latD : CLLocationDegrees = 0.075
    let lonD : CLLocationDegrees = 0.075
    
    //create the initial coffee shops
    func makeShops() {
        coffeeShops.append(CoffeeShop(title: "Scribbles",
                                      locationName: "Downtown Kent",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1554, longitude: -81.3579)))
        coffeeShops.append(CoffeeShop(title: "Tree City",
                                      locationName: "Downtown Kent",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1528, longitude: -81.3571)))
        coffeeShops.append(CoffeeShop(title: "Starbucks",
                                      locationName: "KSU Library",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1467, longitude: -81.3424)))
        coffeeShops.append(CoffeeShop(title: "Dunkin Donuts",
                                      locationName: "Main St Kent",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1542, longitude: -81.3503)))
        coffeeShops.append(CoffeeShop(title: "Corner Cup",
                                      locationName: "Graham Rd",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1695, longitude: -81.4062)))
        coffeeShops.append(CoffeeShop(title: "Brueggers",
                                      locationName: "Norton Rd",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.2001, longitude: -81.4397)))
        coffeeShops.append(CoffeeShop(title: "Starbucks",
                                      locationName: "Main St Hudson",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.2368, longitude: -81.4400)))
    }
    
    //move to position of a shop
    func moveTo(shop: CoffeeShop){
        let coords = shop.coordinate
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latD, lonD)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(coords, span)
        mapView.setRegion(region, animated: true)
    }
    
    //make a function to let the user add pins themselves
    //and call the move map to the new pin so they can see what they made
    //ConfigVC?.addShop(title: title, location: location, lat: lat, lon: lon)
    //moveTo(shop: shop)
    
    //setup the delegates
    func setupDelegates() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //AccuracyTenMeters //AccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //overrides for custom behavior
    override func viewDidLoad() {
        super.viewDidLoad()
        //reference to other VC's
        let tabBarControllerArray0 = self.tabBarController!.viewControllers
        let tabBarControllerArray2 = self.tabBarController!.viewControllers
        let viewController0 = tabBarControllerArray0?[0]
        let viewController2 = tabBarControllerArray2?[2]
        MenuVC = viewController0 as? Menu_Screen
        ConfigVC = viewController2 as? Config_Screen
        
        // Do any additional setup after loading the view.
        self.mapView.frame = self.view.bounds
        setupDelegates()
        makeShops()
        for shop in coffeeShops { mapView.addAnnotation(shop) }
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated) }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
}

//extension for delegate to access and handle current location
extension Map_Screen: CLLocationManagerDelegate {
    //authorizes location access
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    //sets initial map location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.075, 0.075)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    //error handler
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){ print("error:: \(error.localizedDescription)") }
}

//extension for annotation pin behavior
extension Map_Screen: MKMapViewDelegate {
    @objc func viewShopMenu() { self.tabBarController?.selectedIndex = 0 }
    //@objc func viewShop() { self.performSegue(withIdentifier: "MapToMenu", sender: nil) } //this didnt work as intended
    //creates pop up window when clicking on a coffee shop annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CoffeeShop else { return nil }
        var view: MKMarkerAnnotationView
        if let dView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKMarkerAnnotationView {
            dView.annotation = annotation
            view = dView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            let button = UIButton(type: .detailDisclosure)
            //go to menu screen when clicking on detail button
            button.addTarget(self, action: #selector(self.viewShopMenu), for: .touchUpInside)
            view.rightCalloutAccessoryView = button
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.canShowCallout = true
        }
        return view
    }
}


