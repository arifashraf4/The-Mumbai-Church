//
//  QuietTimesDetailController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 07/04/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore

class QuietTimesDetailController: UIViewController {

    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var quietTimes: [QuietTimes] = []
    private var qtCollectionRef: CollectionReference!
    var quietTime: QuietTimes?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        bodyLabel.text = quietTime?.body
        titleLabel.text = quietTime?.title
            
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
