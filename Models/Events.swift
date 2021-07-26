import Foundation
import FirebaseFirestore
import Firebase

class Events: Codable, Identifiable{
    
    var uid: String?
    var title: String?
    var timestamp: String?
    var location: String?
    var sector: String?
    var details: String?
    
    init(uid:String,title:String,timestamp:String,location:String,sector:String,details:String) {
        self.uid = uid
        self.title = title
        self.timestamp = timestamp
        self.location = location
        self.sector = sector
        self.details = details
    }
    

    
    
}
