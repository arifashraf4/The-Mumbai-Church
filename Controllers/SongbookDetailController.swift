//
//  SongbookDetailController.swift
//  The Mumbai Church
//
//  Created by Akif Ashraf on 18/02/21.
//  Copyright © 2021 Arif Ashraf. All rights reserved.
//
import UIKit
import Foundation
import AVFoundation
import FirebaseFirestore

class SongbookDetailController: UIViewController, UIScrollViewDelegate {
    
   
    @IBOutlet weak var lyricsLabel: UILabel!
    
    private var songs: [Song] = []
    private var songsCollectionRef: CollectionReference!
    var song: Song?
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func replay(_ sender: UIButton) {
        player.currentTime = 0
    }
    
    @IBAction func play(_ sender: UIButton) {
        player.play()
        print("playing now")
    }
    
    @IBAction func pause(_ sender: UIButton) {
        player.pause()
    }
    
    override func viewDidLoad() {
        lyricsLabel.text = song?.lyrics
        
        do{
            let audioPath = Bundle.main.path(forResource: "10,000 Reasons", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch{
            //ERROR
        }
        
        
        
    }
    
    
    
    
    

}
