//
//  OPStationMainViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/15.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class OPStationMainViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var stationMapView: MKMapView!
    var rootRef = FIRDatabase.database().reference().child("StationDB");
    var location : CLLocationManager!; //座標管理元件
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingLocation()
        
        stationMapView.mapType = MKMapType.standard;
        
        getStationData();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func settingLocation() {
        location = CLLocationManager();
        location.delegate = self;
        
        //詢問使用者是否同意給APP定位功能
        location.requestWhenInUseAuthorization();
        //開始接收目前位置資訊
        location.startUpdatingLocation();
        
        /*
         let center:CLLocation = CLLocation(latitude: 25.026179899999999, longitude: 121.51105099999995);
         let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
         span: currentLocationSpan)
         */
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //取得目前的座標位置
        let c = locations[0] as! CLLocation;
        //c.coordinate.latitude 目前緯度
        //c.coordinate.longitude 目前經度
        let nowLocation = CLLocationCoordinate2D(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude);
        
        //將map中心點定在目前所在的位置
        //span是地圖zoom in, zoom out的級距
        let _span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005);
        stationMapView.setRegion(MKCoordinateRegion(center: nowLocation, span: _span), animated: true);
        
        location.stopUpdatingLocation();
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error.localizedDescription")
    }
    
    func getStationData() {
        
        var stationArray = Array<OPStationObject>();
        
        rootRef.observeSingleEvent(of: .value, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            
            for key in (value?.allKeys)! {
                
                let stationDict = value?[key] as? [String : String]
                let stationObject = OPStationObject()
                stationObject.stationName = stationDict!["stationName"]! as String
                stationObject.lat = stationDict!["lat"]! as String
                stationObject.long = stationDict!["long"]! as String
                stationObject.address = stationDict!["address"]! as String
                
                stationArray.append(stationObject);
            }
            
            self.setStationPin(statArray: stationArray);
            
            
        }) { (error) in
            print(error.localizedDescription);
        }
    }

    func setStationPin(statArray:Array<OPStationObject>) {
        
        for case let item in statArray {
            
            let lat = item.lat
            let long = item.long

            let objectAnnotation = MKPointAnnotation()
            objectAnnotation.coordinate = CLLocation(latitude: CLLocationDegrees(lat)!,
                                                     longitude: CLLocationDegrees(long)!).coordinate
            //设置点击大头针之后显示的标题
            objectAnnotation.title = item.stationName;
            //设置点击大头针之后显示的描述
            objectAnnotation.subtitle = item.address;
            //添加大头针
            stationMapView.addAnnotation(objectAnnotation)
        }
    }
    
    //MARK:Annotation
    
    //自定义大头针样式
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let reuserId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuserId)
                as? MKPinAnnotationView
            if pinView == nil {
                //创建一个大头针视图
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuserId)
                pinView?.canShowCallout = true
                pinView?.animatesDrop = true
                //设置大头针颜色
                pinView?.pinTintColor = UIColor.init(colorLiteralRed: 50/255.0, green: 174/255.0, blue: 101/255.0, alpha: 1)
                //设置大头针点击注释视图的右侧按钮样式
                pinView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }else{
                pinView?.annotation = annotation
            }
            
            return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let detailVC = OPStationViewController();
        self.navigationController!.pushViewController(detailVC, animated: true);
    }
    
    

}
