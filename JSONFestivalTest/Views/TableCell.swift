//
//  TableCell.swift
//  JSONFestivalTest
//
//  Created by Nicholas Kearns on 4/15/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    static let identifier = "TableCell"
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var artistsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String, date: String, numArtists: Int) {
        self.nameLabel.text = name
        self.dateLabel.text = "Date: \(date)"
        self.artistsLabel.text = "\(numArtists)"
    }
    
}
