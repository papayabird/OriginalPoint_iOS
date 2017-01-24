//
//  OPCaseTableViewCell.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/24.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPCaseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoView: YTPlayerView!

    func setVideoData(url:String ,title:String) {
        
        titleLabel.text = title;
        videoView.load(withPlaylistId: url);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
