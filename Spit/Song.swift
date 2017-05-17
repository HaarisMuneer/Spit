//
//  Song.swift
//  Spit
//
//  Created by Haaris Muneer on 5/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class Song {
    
    var title: String
    var artist: String
    var duration: Int
    
    
    init() {
        self.title = "Title"
        self.artist = "Artist"
        self.duration = 180
    }
    
    init(title: String, artist: String, duration: Int) {
        self.title = title
        self.artist = artist
        self.duration = duration
    }
    
}
