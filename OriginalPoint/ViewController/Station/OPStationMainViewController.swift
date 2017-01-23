//
//  OPStationMainViewController.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/15.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit
import MapKit

class OPStationMainViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var stationMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stationMapView.mapType = MKMapType.standard;
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let center:CLLocation = CLLocation(latitude: 25.026179899999999, longitude: 121.51105099999995);
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
                                                                  span: currentLocationSpan)
        stationMapView.setRegion(currentRegion, animated: true);
        
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = CLLocation(latitude: 25.028179899999999,
                                                 longitude: 121.54105099999995).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "南京夫子庙"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "南京市秦淮区秦淮河北岸中华路"
        //添加大头针
        stationMapView.addAnnotation(objectAnnotation)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                pinView?.pinTintColor = UIColor.green
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
