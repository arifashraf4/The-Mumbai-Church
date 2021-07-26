//
//  Song.swift
//  The Mumbai Church
//
//  Created by Apple on 18/11/20.
//  Copyright © 2020 Arif Ashraf. All rights reserved.
//
import Foundation
import FirebaseFirestore
import Firebase

class Song: Codable, Identifiable{
    
    var uid: String?
    var title: String?
    var eng_title: String?
    var lyrics: String?
    var lang: String?
    var category: String?
    
    init(uid:String,title:String,eng_title:String,lyrics:String,lang:String,category:String) {
        self.uid = uid
        self.title = title
        self.eng_title = eng_title
        self.lyrics = lyrics
        self.lang = lang
        self.category = category
    }
    

    
    
}
 
