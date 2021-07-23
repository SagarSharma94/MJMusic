//
//  DetailCell.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let notAvailableStr = "Not available"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Set Cell Data...
    func setData(data: SearchResult?) {
        artistLabel.text = "Artist Name: \(data?.artistName ?? notAvailableStr)"
        songNameLabel.text = data?.trackName
        genreLabel.text = "Genre: \(data?.primaryGenreName ?? notAvailableStr)"
        collectionLabel.text = "Collection: \(data?.collectionName ?? notAvailableStr)"
        descriptionLabel.text = "Description: \(data?.description ?? notAvailableStr)"
        
        if let url = URL(string: data?.artworkUrl100 ?? ""){
            songImageView.kf.indicatorType = .activity
            songImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: ""))
        }
        
    }
}
