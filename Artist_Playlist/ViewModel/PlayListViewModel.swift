//
//  PlayListViewModel.swift
//  Artist_Playlist
//
//  Created by mac on 3/6/20.
//  Copyright © 2020 Softmills. All rights reserved.
//

import Foundation
import UIKit
//import Almofire

// this class contain all logic of ArtistlistVC

class PlaylistViewModel
{

    // closure used to reload tableView
       var reloadTableViewClosure: (()->())?

    // closure used to reload CollectionView
       var reloadCollectionViewClosure: (()->())?
    
    
// to save the response of GetAccessToken function
     var Auth:[AuthResponse] = [AuthResponse]()
    
    //use didset observer to reload collection view when Countries array get new data
    var Countries:[country] = []
     {
         didSet
         {
            reloadCollectionViewClosure?()
         }
    }

// use didSet observer to reload table view when Array of Artists get any new data
     var Artists:[Artist] = [Artist]()
     {
        didSet{
            reloadTableViewClosure?()
        }
        
    }

  // property with closure to return fixed number of sections
    var numberOfSections:Int
    {
        return 1
    }
    
    // property return number of cells in collection view
    var CountriesCount:Int{
        return Countries.count
    }
    

 // property return number of cells in table view
    var ArtistsCount : Int {
        return Artists.count
    }
    
    
   // Return item at specific indexPath in Countries Array
    func GetCountryAtIndexPath(at indexPath: IndexPath) -> country{
        return Countries[indexPath.row]
    }


 // Return item at specific indexPath in Playlist Array
    func GetArtistAtIndexPath(at indexPath: IndexPath) -> Artist{
        return Artists[indexPath.row]
    }


 // this function is used to download Artist profile image from url - using AlamofireImage
    func getArtistImage(url:String,handler: @escaping (_ error: String?,_ image:UIImage?)->Void) {
        
//        Alamofire.request(url, method: .get).responseImage { response in
//            //get data of image
//            if let data = response.result.value{
//                handler(nil,data)
//            }
//            else{
//                    handler("No image downloaded" ,nil)
//            }
//       }

    }

    
    
// this function to get app authorization from spotify using client key and secret Id then get token

func GetAccessToken(_ completion: @escaping (_ error: NSError?, _ json: Data?) -> Void)
{
    let parameters =  ["client_id":K.AppAuth.clientId,"client_secret":K.AppAuth.SecretId,"grant_type":"client_credentials"]
    
//      Alamofire.request(Urls.AuthUrl, method: .post, parameters: parameters).responseJSON{ response in
//            let json = response.data
//            do{
//                //created the json decoder
//                let decoder = JSONDecoder()
//                //using the array to put values
//                self.Auth = try decoder.decode([AuthResponse].self, from: json!)
//              completion(nil,json)
//            }catch let err{
//                print(err)
//                completion(err as NSError,nil)
//            }
//        }
}

    
// this function fetches Countries data from local json
    func getCountries() {
        //apicall
        guard let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") else {
            return
        }
        do {
            let countriesJson = try? Data(contentsOf: url)
            if let countries = countriesJson, let countriesItems = try? JSONDecoder().decode([country].self, from: countries) {
                self.Countries = countriesItems
                if Countries.count>0
                {
                    print("find them")
                }
                else{
                    print("Not Found")
                }
            }
        }
    }

    // get country code
    func getCountryImageCode(at index: Int) -> String {
            return Countries[index].code
    }
    
    // get country Name
       func getCountryName(at index: Int) -> String {
               return Countries[index].name
       }



 //this function fetches Atrist data from API - Using Alamofire
    func GetArtistsData(CountryCode:String,_ completion: @escaping (_ error: NSError?, _ json: Data?) -> Void)
    {
        let parameters = ["":""]
//        Alamofire.request(Urls.PlaylistUrl,method: .get, parameters: parameters).responseJSON { response in
//            let json = response.data
//            do{
//                //created the json decoder
//                let decoder = JSONDecoder()
//                //using the array to put values
//                self.Artists = try decoder.decode([Artist].self, from: json!)
//              completion(nil,json)
//            }catch let err{
//                print(err)
//                completion(err as NSError,nil)
//            }
//        }
    }
    
    
    
}







