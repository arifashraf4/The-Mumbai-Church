//
//  Announcement.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 07/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class Announcement: Codable, Identifiable{
    
    var uid: String?
    var body: String?
    var ref: String?
    var date: String?
    var lang: String?
    var sector: String?
    
    init(uid:String,body:String,ref:String,date:String,lang:String,sector:String) {
        self.uid = uid
        self.body = body
        self.ref = ref
        self.date = date
        self.sector = sector
        self.lang = lang
    }
}
