//
//  OPStationObject.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/24.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPStationObject: NSObject {
    
    var stationName: String;
    var lat: String;
    var long: String;
    var address: String;
    
    init(stationName: String, lat: String, long: String, address: String) {
        
        self.stationName = stationName;
        self.lat = lat;
        self.long = long;
        self.address = address;
    }
    
    convenience override init() {
        self.init(stationName: "", lat: "", long: "", address:  "")
    }
}
