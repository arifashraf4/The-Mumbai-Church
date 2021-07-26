//
//  FeedbackController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 06/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FeedbackController: UIViewController {

    @IBOutlet weak var ratingStackView: RatingController!
    
    var feedbackCollectionRef: CollectionReference!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedbackCollectionRef = db.collection("Feedback")
    }
    

    @IBAction func SendButtonClicked(_ sender: Any) {
        print(ratingStackView.starsRating)
        dismissPopover()
        
//        var stars: String?
//        var uid: String?
        
        loadFeedback()
    }
    
    @objc private func dismissPopover() {
            dismiss(animated: true, completion: nil)
        }

    func loadFeedback(){
        
        feedbackCollectionRef = db.collection("Feedback")
        
        let newFeedback = feedbackCollectionRef.document()
        
        
        var data = ["Feedback" : ratingStackView.starsRating,
                    "uid" : newFeedback.documentID
        ] as [String : Any]
        feedbackCollectionRef.addDocument(data: data)
    }
    
    
}
