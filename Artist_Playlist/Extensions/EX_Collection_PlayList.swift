//
//  FeaturedPlayListEX.swift
//  Artist_Playlist
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Softmills. All rights reserved.
//

import Foundation
import UIKit

extension FeaturedPlaylistViewController:UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func CollectionViewregistercell()
    {
            CountriesCollection.register(UINib(nibName: K.Nibnames.countrycell, bundle: nil), forCellWithReuseIdentifier: K.CellIdentifiers.CountryCollectionViewCell)
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListVM.CountriesCount
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ListVM.numberOfSections
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.CountryCollectionViewCell, for: indexPath) as! CountryCell
        
        cell.Country_image.image = UIImage(named: ListVM.getCountryImageCode(at: indexPath.row))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ListVM.GetArtistsData(CountryCode: ListVM.getCountryImageCode(at: indexPath.row)) { (error, data) in
            if error == nil
            {
                print ("data fetched" )
            }
        }
    }
    
    
    
}
