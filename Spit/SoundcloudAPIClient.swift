//
//  SoundcloudAPIClient.swift
//  Spit
//
//  Created by Haaris Muneer on 5/16/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit
import Alamofire

class SoundcloudAPIClient {
    
    class func getSongsMatchingSearchTerm(_searchTerm: String, completion: @escaping ([[String: AnyObject]]) -> ()) {
        let url = "\(soundcloudBaseURL)/tracks?q=\(_searchTerm)&client_id=\(soundcloudClientID)&limit=100"
        print(url)
        Alamofire.request(url).responseJSON { (response) in
            if let results = response.result.value as? [[String: AnyObject]] {
                print(results.count)
                completion(results)
            }
        }
    }
}
