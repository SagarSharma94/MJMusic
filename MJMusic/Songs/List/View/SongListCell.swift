//
//  SongListCell.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import UIKit
import Kingfisher

class SongListCell: UITableViewCell {
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Set Cell Data...
    func setData(data: SearchResult?) {
        artistLabel.text = "Artist: \(data?.artistName ?? "")"
        songNameLabel.text = data?.trackName
        if let url = URL(string: data?.artworkUrl100 ?? ""){
            songImageView.kf.indicatorType = .activity
            songImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: ""))
        }
    }
    
}
