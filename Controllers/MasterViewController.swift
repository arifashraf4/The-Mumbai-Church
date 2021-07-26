//
//  ViewController.swift
//  The Mumbai Church
//
//  Created by Apple on 03/09/20.
//  Copyright © 2020 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class MasterViewController: UIViewController {

    
    // Disables the Nav Bar for the First View Controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //Custom UI Button 
    var customButton = MainButtonStyle()
    
    @IBAction func announcementButton(_ sender: UIButton) {
    }
    
    @IBAction func songBookButton(_ sender: Any) {
//        loadSong()
        getMultipleAll()
        
    }
    @IBAction func quietTimesButton(_ sender: UIButton) {
    }
    @IBAction func eventsButton(_ sender: UIButton) {
    }
    @IBAction func othersButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    let db = Firestore.firestore()
    
    private func getMultipleAll(){
        db.collection("songs").getDocuments() { (QuerySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
}
