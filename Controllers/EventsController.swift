//
//  EventsController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 07/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore


class EventsController: UIViewController {

    @IBOutlet weak var eventsTableView: UITableView!
    
    var events = [Events]()
    var documents: [DocumentSnapshot] = []
    var eventsCollectionRef: CollectionReference!
    

    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        let nib = UINib(nibName: "EventsCell", bundle: nil)
        eventsTableView.register(nib, forCellReuseIdentifier: "ReusableEventCell")
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
//        loadEvents()

        
        eventsCollectionRef = db.collection("Events")
        
        
        
        
        eventsCollectionRef.getDocuments() { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    var title = data["title"] as? String ?? "No Title"
                    var uid = document.documentID
                    var timestamp = data["timestamp"] as? String ?? "no timestamp"
                    var location = data["location"] as? String ?? "no location"
                    var sector = data["sector"] as? String ?? "no sector"
                    var details = data["details"] as? String ?? "no details"
                    

                    let newEvent = Events(uid: uid, title: title, timestamp: timestamp, location: location, sector: sector, details: details)
                    self.events.append(newEvent)
                    self.eventsTableView.reloadData()
                }
            }
        }
        
        
    }
    
    
    func loadEvents(){
        
        eventsCollectionRef = db.collection("Events")
        
        let newEvent = eventsCollectionRef.document()
        
        
        var data = ["title" : "Easter Meeting",
                    "details" : """
                                The Mumbai Church is inviting you to a scheduled Zoom meeting.

                                Topic: Easter Meeting
                                Time: Apr 5, 2021 06:00 PM India

                                Join Zoom Meeting
                                https://us05web.zoom.us/j/82424642846?pwd=bmVucnU3emhWU3Y4VEFRaUpJWUl0UT09

                                Meeting ID: 824 2464 2846
                                Passcode: 12345
                                """,
                    "uid" : newEvent.documentID
            ]
        eventsCollectionRef.addDocument(data: data)
    }
    
    
    func configureUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Events"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.282, green: 0.306, blue: 0.392, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
}

extension EventsController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = eventsTableView.dequeueReusableCell(withIdentifier: "ReusableEventCell", for: indexPath) as? EventsCell {
            cell.configureEventCell(event: events[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension EventsController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EventDetailSegue", sender: self)
        print(indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventsDetailController {
            destination.event = events[(eventsTableView.indexPathForSelectedRow?.row)!]
        }
    }
}
