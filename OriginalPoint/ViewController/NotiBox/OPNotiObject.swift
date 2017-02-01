//
//  OPNotiObject.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/2/1.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPNotiObject: NSObject {

    var title: String;
    var date: String;
    var descriptionText: String;
    var content: String;
    
    init(title: String, date: String, descriptionText: String, content: String) {
        
        self.title = title;
        self.date = date;
        self.descriptionText = descriptionText;
        self.content = content;
    }
    
    convenience override init() {
        self.init(title: "", date: "", descriptionText: "", content:  "")
    }

}
