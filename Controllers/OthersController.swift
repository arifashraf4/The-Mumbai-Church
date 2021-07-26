//
//  OthersController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 30/03/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore

class OthersController: UIViewController {
    
    
    @IBOutlet weak var churchWebsiteButton: UIButton!
    
    @IBAction func sharePressed(_ sender: Any) {
        
        let activityVC = UIActivityViewController(activityItems: ["""
            We currently only support Android. iOS Version which will be available soon!
            https://coc-mumbai.web.app
            """], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    func configureUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "OTHERS"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.282, green: 0.306, blue: 0.392, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    
    
    @IBAction func didTapChurchWebsite(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string: "https://www.themumbaichurch.org")! as URL, options: [:], completionHandler: nil)
    }
    
}
