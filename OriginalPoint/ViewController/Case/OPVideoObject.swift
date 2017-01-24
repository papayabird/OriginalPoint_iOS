//
//  OPVideoObject.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/24.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPVideoObject: NSObject {

    var videoName: String;
    var type: String;
    var date: String;
    var url: String;
    
    init(videoName: String, date: String, type: String, url: String) {
        
        self.videoName = videoName;
        self.date = date;
        self.type = type;
        self.url = url;
    }
    
    convenience override init() {
        self.init(videoName: "", date: "", type: "", url: "")
    }
}
