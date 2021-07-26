//
//  ChurchAddressController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 04/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import MapKit

class ChurchAddressController: UIViewController {

    @IBAction func centralOpenMap(_ sender: Any) {
        // Defining Destination
        let latitude: CLLocationDegrees = 19.045415
        let longitude: CLLocationDegrees = 72.841687
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates,latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Xavier's Institute of Engineering"
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    
    @IBAction func eastOpenMap(_ sender: Any) {
        let latitude: CLLocationDegrees = 19.079185
        let longitude: CLLocationDegrees = 72.905840
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates,latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Gurukul College of Commerce"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    @IBAction func northeastOpenMap(_ sender: Any) {
        let latitude: CLLocationDegrees = 19.169303605759026
        let longitude: CLLocationDegrees = 72.85572666860028
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates,latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Asha Kiran Hostel, St. Pius Campus"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "ADDRESSES"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.282, green: 0.306, blue: 0.392, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
