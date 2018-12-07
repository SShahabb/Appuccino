//
//  Map_Screen.swift
//  Appuccino_Test
//
//  Created by Shahab on 12/7/18.
//  Copyright © 2018 Shahab. All rights reserved.
//

import UIKit
import MapKit

class Map_Screen: UIViewController {
    //references to other view controllers
    var MenuVC: Menu_Screen?
    //var ConfigVC: Config_Screen?

    //labels and outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //location access delegate
    let locationManager = CLLocationManager()
    
    //initial map values for KSU
    let lat : CLLocationDegrees = 41.1491
    let lon : CLLocationDegrees = -81.3415
    let latD : CLLocationDegrees = 0.075
    let lonD : CLLocationDegrees = 0.075
    //i should export these variables to the config 3rd screen then maybe allow the user to change them
    
    //3rd screen can maybe let people add new shops to save?
    
    //array of coffee shops
    var coffeeShops = [CoffeeShop]()
    
    //populate initial coffee shops
    func makeShops() {
        coffeeShops.append(CoffeeShop(title: "Scribbles",
                                      locationName: "Downtown Kent",
                                      discipline: "Cozy",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1554, longitude: -81.3579)))
        coffeeShops.append(CoffeeShop(title: "Tree City",
                                      locationName: "Downtown Kent",
                                      discipline: "Modern",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1528, longitude: -81.3571)))
        coffeeShops.append(CoffeeShop(title: "Starbucks",
                                      locationName: "KSU Library",
                                      discipline: "Busy",
                                      coordinate: CLLocationCoordinate2D(latitude: 41.1467, longitude: -81.3424)))
    }
    
    //move position and zoom
    func moveMap(lat: CLLocationDegrees, lon: CLLocationDegrees, latD: CLLocationDegrees, lonD: CLLocationDegrees) {
        let coords : CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lon)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latD, lonD)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(coords, span)
        mapView.setRegion(region, animated: true)
    }
    
    //make a function to add pins/shops to the array in addition to the original ones
    //maybe this can go in 3rd screen and attach it to a button on this screen
    
    //make a function to search for places
    
    //make a function to segue between screens when clicking on annotation or a popup after the annotation
    
    //manually move to new location, dont think i ever need to do this, maybe jump to a desired shop?
    //moveMap(lat: lat, lon: lon, latD: latD, lonD: lonD)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapView.frame = self.view.bounds
        
        //reference to other VC's
        let tabBarControllerArray = self.tabBarController!.viewControllers
        let viewController1 = tabBarControllerArray?[1]
        MenuVC = viewController1 as? Menu_Screen
        //let tabBarControllerArray = self.tabBarController!.viewControllers
        //let viewController2 = tabBarController?[2]
        //ConfigVC = viewController2 as? Config_Screen
        
        //setup delegates
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //AccuracyTenMeters //AccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        //populate and add pins for shops
        //addShops() //adds any user added custom shops/locations
        makeShops()
        for shop in coffeeShops { mapView.addAnnotation(shop) }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("error:: \(error.localizedDescription)")
    }
    
}

//extension for annotation popup
extension Map_Screen: MKMapViewDelegate {
    //creates pop up window when clicking on a coffee shop annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CoffeeShop else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    //create func that sends you to menu when clicking on the i after clicking on annotation
}








