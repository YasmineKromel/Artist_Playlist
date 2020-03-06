//
//  Ex_TableView_PlayList.swift
//  Artist_Playlist
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Softmills. All rights reserved.
//

import Foundation
import UIKit

extension FeaturedPlaylistViewController:UITableViewDelegate,UITableViewDataSource
{
    
    
    func TableViewregistercell(){
        PlayList_TB.register(UINib(nibName: K.Nibnames.PlayListCell, bundle: nil), forCellReuseIdentifier: K.CellIdentifiers.PlayListTableViewCell)
   }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListVM.ArtistsCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifiers.PlayListTableViewCell, for: indexPath) as! PlayListCell
        
        return cell
    }
    
    
}
