//
//  QuietTimesController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 07/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore

class QuietTimesController: UIViewController {

    @IBOutlet weak var qtTableView: UITableView!
    
    var quietTimes = [QuietTimes]()
    var documents: [DocumentSnapshot] = []
    var qtCollectionRef: CollectionReference!
    

    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        let nib = UINib(nibName: "QuietTimesCell", bundle: nil)
        qtTableView.register(nib, forCellReuseIdentifier: "ReusableqtCell")
        
        qtTableView.delegate = self
        qtTableView.dataSource = self
        
        
//        loadQT()
        
        qtCollectionRef = db.collection("Quiet Times")
        
        
        
        
        qtCollectionRef.getDocuments() { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    var title = data["title"] as? String ?? "No Title"
                    var uid = document.documentID
                    var subtitle = data["subtitle"] as? String ?? "no subtitle"
                    var date = data["date"] as? String ?? "no date"
                    var body = data["body"] as? String ?? "no body"
                    var prayer = data["prayer"] as? String ?? "no prayer"
                    var ref = data["ref"] as? String ?? "no ref"
                    var lang = data["lang"] as? String ?? "no lang"

                    let newQT = QuietTimes(uid: uid, title: title, subtitle: subtitle, date: date, body: body, prayer: prayer, ref: ref, lang: lang)
                    self.quietTimes.append(newQT)
                    self.qtTableView.reloadData()
                }
            }
        }
        
        
    }
    
    
    
    
    
    func loadQT(){
        
        qtCollectionRef = db.collection("Quiet Times")
        
        let newQT = qtCollectionRef.document()
        
        var data = ["title" : "Do Not Fear",
                    "body" :    """
                                Isiah 43:1-7

                                1 But now, this is what the Lord says—
                                    he who created you, Jacob,
                                    he who formed you, Israel:
                                “Do not fear, for I have redeemed you;
                                    I have summoned you by name; you are mine.
                                2 When you pass through the waters,
                                    I will be with you;
                                and when you pass through the rivers,
                                    they will not sweep over you.
                                When you walk through the fire,
                                    you will not be burned;
                                    the flames will not set you ablaze.
                                3 For I am the Lord your God,
                                    the Holy One of Israel, your Savior;
                                I give Egypt for your ransom,
                                    Cush[a] and Seba in your stead.
                                4 Since you are precious and honored in my sight,
                                    and because I love you,
                                I will give people in exchange for you,
                                    nations in exchange for your life.
                                5 Do not be afraid, for I am with you;
                                    I will bring your children from the east
                                    and gather you from the west.
                                6 I will say to the north, ‘Give them up!’
                                    and to the south, ‘Do not hold them back.’
                                Bring my sons from afar
                                    and my daughters from the ends of the earth—
                                7 everyone who is called by my name,
                                    whom I created for my glory,
                                    whom I formed and made.”

                                God is assuring us today in times like this.
                                
                                1. I created you
                                2. I formed you
                                3. I have redeemed you
                                """,
                    "uid" : newQT.documentID
            ]
        qtCollectionRef.addDocument(data: data)
        
        
        data =      ["title" : "The Bible & COVID-19",
                    "body" :    """
                                These disconcerting times have generated lot of questions. Glagly, many are turning to the Bible for help. I compiled these Bible FAQs with my own best attempts to provide direction and clarity.
                                
                                Each one is encouraged to open his/her Bible and wrestle with the issues and come to personal conclusions. We trust that the Lord will see us through the trials and confusion so that we can come out of them stronger.

                                THEOLOGICAL QUESTIONS
                                
                                Q. Is the coronavirus outbreak God's judgement on the world?
                                No. To be clear,God is judging the world all the time(Psalms 7:17;58:11). His Holy Spirit convicts and exposes wrongdoing all the time (John 16:8). To imply that God is judging the world only now and mainly through this outbreak would be disregarding his perfect character.

                                Secondly, the Bible talk about a final judgment that is focused on the individual person (Hebrew 9:27;2 corinthians 5:10; 1 John 4:17).

                                For that time, the eartch and the heavens are reserved (2 Peter 3:7). God will judge people according to how they have lived (Revelation 20:12;22:12).

                                Q. Is the coronavirus a biblical "plague"?
                                Not exactly. Many are familiar with the plagues of Egypt (Exodus 7-12). Other plagues were sent by God to similarly demonstrate his power outside of Israel (1 Samuel 5:11-6:4). Yet although Covid-19 looks like a plague, it has not come upon us for the same reasons as the examples in the Bible, which was for God to reveal his power to non-Israelites (Exodus 8:10;9:14) and to forewarn his own people before the Exile (Leviticus 26:21).
                                """,
                    "uid" : newQT.documentID
            ]
        qtCollectionRef.addDocument(data: data)

        
        
        
        
    }
    
    
    
    
    
    
    
    func configureUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "QUIET TIMES"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.282, green: 0.306, blue: 0.392, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    

}

extension QuietTimesController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quietTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = qtTableView.dequeueReusableCell(withIdentifier: "ReusableqtCell", for: indexPath) as? QuietTimesCell {
            cell.configureqtCell(quietTimes: quietTimes[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension QuietTimesController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "QTDetailSegue", sender: self)
        print(indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuietTimesDetailController {
            destination.quietTime = quietTimes[(qtTableView.indexPathForSelectedRow?.row)!]
        }
    }
}


