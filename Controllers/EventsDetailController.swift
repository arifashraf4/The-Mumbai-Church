//
//  EventsDetailController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 07/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore

class EventsDetailController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    
    private var events: [Events] = []
    private var eventsCollectionRef: CollectionReference!
    var event: Events?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailsLabel.text = event?.details
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
