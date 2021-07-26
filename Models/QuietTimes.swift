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

class QuietTimes: Codable, Identifiable{
    
    var uid: String? 
    var title: String?
    var subtitle: String?
    var date: String?
    var body: String?
    var prayer: String?
    var ref: String = ""
    var lang: String = ""
    
    init(uid:String,title:String,subtitle:String,date:String,body:String,prayer:String,ref:String,lang:String) {
        self.uid = uid
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.body = body
        self.prayer = prayer
        self.ref = ref
        self.lang = lang
    }
    
    init(body:String,title:String,uid:String){
        self.body = body
        self.title = title
        self.uid = uid
    }
    
    
    
    

    
    
}
 


