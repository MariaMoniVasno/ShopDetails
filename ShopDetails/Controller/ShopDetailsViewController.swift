//
//  ShopDetailsViewController.swift
//  ShopDetails
//
//  Created by developer on 23/11/20.
//  Copyright © 2020 blockchain. All rights reserved.
//

import UIKit
import GoogleMaps

class ShopDetailsViewController: UIViewController {

    @IBOutlet var shopAddrMapView : GMSMapView!
    var shopDetailArray = NSDictionary()
    var shops:Shops?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(((shopDetailArray as AnyObject).object(forKey: "name") ?? "")!)"
        // Do any additional setup after loading the view.
        mapProperties()
    }
    //MARK:- GoogleMapView Properties
       func mapProperties(){
           //Camera Position
        let pickuplat = "13.0827"
        let pickuplong = "80.2707"
        
        let lat = "\(((shopDetailArray as AnyObject).object(forKey: "latitude") ?? "")!)"
        let lon = "\(((shopDetailArray as AnyObject).object(forKey: "longitude") ?? "")!)"
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees((lat))!, longitude: CLLocationDegrees((lon))!, zoom: 11)
        shopAddrMapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view.addSubview(shopAddrMapView)
        shopAddrMapView.isMyLocationEnabled = true
        shopAddrMapView.settings.myLocationButton = true
        
        
        //PickUp and Drop Marker
        let pickUpMarker = GMSMarker()
        pickUpMarker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees((pickuplat))! , longitude: CLLocationDegrees((pickuplong))!)
        pickUpMarker.title = "Chennai"
        pickUpMarker.map = shopAddrMapView
        
        let dropMarker = GMSMarker()
        dropMarker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees((lat))!, longitude: CLLocationDegrees((lon))!)
        dropMarker.title = "\(((shopDetailArray as AnyObject).object(forKey: "name") ?? "")!)"
        dropMarker.map = shopAddrMapView
        view = shopAddrMapView
        
        //Draw the route from pickup & drop
        fetchRoute(from: CLLocationCoordinate2D(latitude: CLLocationDegrees((pickuplat))!, longitude: CLLocationDegrees((pickuplong))!), to: CLLocationCoordinate2D(latitude: CLLocationDegrees((lat))!, longitude: CLLocationDegrees((lon))!))
    }
    //Draw the route from pickup & drop
    func fetchRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        
        let session = URLSession.shared
        let apiKey = "AIzaSyD39WhzpsRC_EOO1OfD4lyA55Ld2f7GhYk"
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=\(apiKey)")!

        
                let task = session.dataTask(with: url, completionHandler: {
                        (data, response, error) in

                        guard error == nil else {
                            print(error!.localizedDescription)
                            return
                        }

                        guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {

                            print("error in JSONSerialization")
                            return

                        }

                        guard let routes = jsonResult["routes"] as? [Any] else {
                            return
                        }

                        guard let route = routes[0] as? [String: Any] else {
                            return
                        }

                        guard let legs = route["legs"] as? [Any] else {
                            return
                        }

                        guard let leg = legs[0] as? [String: Any] else {
                            return
                        }

                        guard let steps = leg["steps"] as? [Any] else {
                            return
                        }
                          for item in steps {

                            guard let step = item as? [String: Any] else {
                                return
                            }

                            guard let polyline = step["polyline"] as? [String: Any] else {
                                return
                            }

                            guard let polyLineString = polyline["points"] as? String else {
                                return
                            }

                            //Call this method to draw path on map
                            DispatchQueue.main.async {
                                self.drawPath(from: polyLineString)
                            }

                        }
                    })
                    task.resume()
        }
        
        func drawPath(from polyStr: String){
            let path = GMSPath(fromEncodedPath: polyStr)
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 3.0
            polyline.strokeColor = UIColor.black
            polyline.map = shopAddrMapView
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
