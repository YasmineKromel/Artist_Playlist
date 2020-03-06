//
//  PlayListCell.swift
//  Artist_Playlist
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Softmills. All rights reserved.
//

import UIKit

class PlayListCell: UITableViewCell {

    @IBOutlet weak var ListImg: UIImageView!
    @IBOutlet weak var ListName: UILabel!
    @IBOutlet weak var ListOwner: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func CellSetup()
    {
       //
           
    }
    
}
