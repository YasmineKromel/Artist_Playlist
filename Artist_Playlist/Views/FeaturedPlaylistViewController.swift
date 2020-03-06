//
//  FeaturedPlaylistViewController.swift
//  Artist_Playlist
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Softmills. All rights reserved.
//
import Foundation
import UIKit

class FeaturedPlaylistViewController:UIViewController
{
    
    @IBOutlet weak var CountriesCollection: UICollectionView!
    @IBOutlet weak var PlayList_TB: UITableView!
    
    
    // get an instance of PlayListViewModel
       lazy var ListVM : PlaylistViewModel = {
           return PlaylistViewModel()
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CountriesCollection.delegate = self
        CountriesCollection.dataSource = self
        
        PlayList_TB.delegate = self
        PlayList_TB.dataSource = self
        
        // To register cells
        CollectionViewregistercell()
        TableViewregistercell()

        // call countries
        ListVM.getCountries()
        
        initCountriesClosure()
        initPlayListClosure()
        
    }
    
    
    //this function - set closure
    func initCountriesClosure()
    {
        ListVM.reloadCollectionViewClosure={[weak self ]()in
            self?.CountriesCollection.reloadData()
        }
    }
    
    // this function - set closure
    func initPlayListClosure() {
        ListVM.reloadTableViewClosure = { [weak self] () in
            self?.PlayList_TB.reloadData()
        }

    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
