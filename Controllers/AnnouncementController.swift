//
//  AnnouncementController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 07/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore


class AnnouncementController: UIViewController {

    @IBOutlet weak var announcementTableView: UITableView!

    var announcements = [Announcement]()
    var documents: [DocumentSnapshot] = []
    var announcementCollectionRef: CollectionReference!



    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "AnnouncementCell", bundle: nil)
        announcementTableView.register(nib, forCellReuseIdentifier: "ReusableAnnouncementCell")

        announcementTableView.dataSource = self

        announcementCollectionRef = db.collection("Announcement")




        announcementCollectionRef.getDocuments() { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    var body = data["body"] as? String ?? "No body"
                    var uid = document.documentID
                    var ref = data["ref"] as? String ?? "no ref"
                    var date = data["date"] as? String ?? "no date"
                    var lang = data["lang"] as? String ?? "no lang"
                    var sector = data["sector"] as? String ?? "no sector"


                    let newAnnouncement = Announcement(uid: uid, body: body, ref: ref, date: date, lang: lang, sector: sector)
                    self.announcements.append(newAnnouncement)
                    self.announcementTableView.reloadData()
                }
            }
        }



    }

    func loadAnnouncement() {

        announcementCollectionRef = db.collection("Announcement")

        let newAnnouncement = announcementCollectionRef.document()



        var data = [
                    "body" :    """
                                No meetings will be conducted until further notice
                                """,
                    "uid" : newAnnouncement.documentID
                    ]
        announcementCollectionRef.addDocument(data: data)



    }


}

extension AnnouncementController: UITableViewDataSource {

        func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return announcements.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = announcementTableView.dequeueReusableCell(withIdentifier: "ReusableAnnouncementCell", for: indexPath) as? AnnouncementCell {
        cell.configureAnnouncementCell(announcement: announcements[indexPath.row])
        return cell
    } else {
        return UITableViewCell()
    }

}
}
