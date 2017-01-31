//
//  OPCaseTableViewCell.swift
//  OriginalPoint
//
//  Created by papayabird on 2017/1/24.
//  Copyright © 2017年 OP. All rights reserved.
//

import UIKit

class OPCaseTableViewCell: UITableViewCell, YTPlayerViewDelegate{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoView: YTPlayerView!

    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        videoView.stopVideo()
    }
    
    func setVideoData(url:String ,title:String) {
        
        titleLabel.text = title;
        videoView.load(withVideoId: url);
        videoView.delegate = self;
    }

    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        
        let app = UIApplication.shared.delegate as! AppDelegate

        if state == YTPlayerState.playing {
            app.fullScreenVideoIsPlaying = true;
        }
        else {
            app.fullScreenVideoIsPlaying = false;
        }
        print("YTPlayerState.playing : " + String(app.fullScreenVideoIsPlaying))
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
