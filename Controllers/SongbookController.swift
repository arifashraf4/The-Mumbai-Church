//
//  SongbookViewController.swift
//  The Mumbai Church
//
//  Created by Apple on 16/11/20.
//  Copyright © 2020 Arif Ashraf. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SongbookController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Song]()
    var filteredSongs = [Song]()
    var documents: [DocumentSnapshot] = []
    var songsCollectionRef: CollectionReference!
    
//    let searchController = UISearchController(searchResultsController: nil)
    
    let db = Firestore.firestore()
    
    let searchBar = UISearchBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                loadSongBook()
        
        configureUI()
        
        let nib = UINib(nibName: "SongTitleCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ReusableCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        
//        filteredSongs = songs
        
        songsCollectionRef = db.collection("songs")
        
        
        
        
        songsCollectionRef.getDocuments() { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    TITLE = data["title"] as? String ?? "No Title"
                    UID = document.documentID
                    ENG_TITLE = data["eng_title"] as? String ?? "No eng title"
                    CATEGORY = data["category"] as? String ?? "Nil"
                    LYRICS = data["lyrics"] as? String ?? "no lyrics"
                    LANG = data["lang"] as? String ?? "no lang"

                    let newSong = Song(uid: UID, title: TITLE, eng_title: ENG_TITLE, lyrics: LYRICS, lang: LANG, category: CATEGORY)
                    self.filteredSongs.append(newSong)
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
        
    }

    
    
    func getData(){
        

    }
       
    func loadSongBook() {

        songsCollectionRef = db.collection("songs")
        
        let newSong = songsCollectionRef.document()


        
        var data = [TITLE : "10000 Reasons",
                    LYRICS :    """
                                Bless the Lord oh my soul
                                Oh my soul
                                Worship His Holy name
                                Sing like never before
                                Oh my soul
                                I'll worship Your Holy name

                                The sun comes up
                                It's a new day dawning
                                It's time to sing Your song again
                                Whatever may pass
                                And whatever lies before me
                                Let me be singing
                                When the evening comes

                                Bless the Lord oh my soul
                                Oh my soul
                                Worship His Holy name
                                Sing like never before
                                Oh my soul
                                I'll worship Your Holy name
                                You're rich in love
                                And You're slow to anger
                                Your name is great
                                And Your heart is kind
                                For all Your goodness
                                I will keep on singing
                                Ten thousand reasons
                                For my heart to find

                                Bless the Lord oh my soul
                                Oh my soul
                                Worship His Holy name
                                Sing like never before
                                Oh my soul
                                I'll worship Your Holy name
                                Bless You Lord
                                And on that day
                                When my strength is failing
                                The end draws near
                                And my time has come
                                Still my soul will
                                Sing Your praise unending
                                Ten thousand years
                                And then forevermore
                                Forevermore

                                Bless the Lord oh my soul
                                Oh my soul
                                Worship His Holy name
                                Sing like never before
                                Oh my soul
                                I'll worship Your Holy name

                                Bless the Lord oh my soul
                                Oh my soul
                                Worship His Holy name
                                Sing like never before
                                Oh my soul
                                I'll worship Your Holy name
                                Yes I'll worship Your Holy name
                                I'll worship Your Holy name

                                Sing like never before
                                Oh my soul
                                I'll worship Your Holy name
                                Jesus I will worship Your Holy name
                                Worship Your Holy name
                                """,
                    "uid" : newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Ah-La-La-La-La",
                "lyrics":   """
                            Ah-La-La-La-La
                            Ah-La-La-La-La-La-La-La-Lu-Jah
                            Ah-La-La-La-La-Le-Lu-Jah ... x 2

                            Jesus is a friend, is a friend next to you,
                            Jesus is a friend so sing along ... x 2

                            Ah-La-La-La-La-La-La-La-Lu-Jah
                            Ah-La-La-La-La-Le-Lu-Jah ... x 2

                            Give a big hug, to the one next to you
                            Give a big hug, and sing along ... x 2

                            Ah-La-La-La-La-La-La-La-Lu-Jah
                            Ah-La-La-La-La-Le-Lu-Jah ... x 2

                            Praise be to God, be to God forever
                            Praise be to God and sing along... x 2

                            Ah-La-La-La-La-La-La-La-Lu-Jah
                            Ah-La-La-La-La-Le-Lu-Jah ... x 2

                            Give a big smile, to the one next to you
                            Give a big smile and sing along ... x 2

                            Ah-La-La-La-La-La-La-La-Lu-Jah
                            Ah-La-La-La-La-Le-Lu-Jah ... x 2
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "As The Deer Pants",
                "lyrics":   """
                            As the deer pants for the water
                            So my soul longs after You.
                            You alone are my heart’s desire,
                            And I long to worship You.

                            Chorus
                            You alone are my strength, my shield,
                            To You alone may my spirit yield.
                            You alone are my heart’s desire,
                            And I long to worship You.

                            You’re my friend and
                            You are My Brother,
                            Even though You are a King.
                            I love You more than any other,
                            So much more than anything.

                            Chorus
                            I want you more than gold or silver,
                            Only you can satisfy.
                            You alone are my real joy giver,
                            And the apple of my eye
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Anchor For My Soul",
                "lyrics":   """
                            Anchor for the soul,
                            Shelter from the storm;
                            Thunder and the lightning
                            Can be very fright'ning,
                            But God is in control.

                            Anchor for the soul,
                            Shelter from the storm;
                            Manna in the morning,
                            Blessings overflowing,
                            Leading us to home.

                            This world's not my home,
                            Just a-passing through.
                            Through this life I wander,
                            Treasure stored up yonder
                            Somewhere beyond the blue.

                            On my way I learn
                            Through each path I take.
                            Every day I'm growing,
                            On my way I'm knowing
                            Heaven's worth the wait.

                            When the day is gone,
                            When my journey ends,
                            Won't be nothing better
                            Then to be together
                            With all my faithful friends.

                            We'll all join in song
                            Gathered 'round the throne.
                            There'll be no more sorrow
                            Someday when tomorrow
                            Heaven is our home.
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "As We Worship You",
                "lyrics":   """
                            As we worship You,
                            Let all the world come and see
                            How the mercy we received from
                            You can set them free
                            As we worship You,
                            Let all this joy that fills our hearts
                            Bring a hunger and a hope
                            To those who strayed so far

                            Chorus
                            As we bow in adoration
                            And stand in reverent awe
                            Show Your majesty and glory,
                            Let Your anointing fall
                            As we declare Your name Lord Jesus
                            As the only name who saves

                            May the power of Your salvation
                            Fill each heart we pray
                            As we worship You,
                            Let all the nations hear our song

                            Song of Jesus and His blood
                            That proved His love for all
                            As we worship You,
                            May all the lost and broken come
                            May they hear Your still small voice
                            Call out their names each one

                            (Repeat Chorus)
                            (then ascend to Key of F for Verse I and
                            Chorus) Verse 1 (ascended)
                            As we worship You,
                            Let all the world come and see
                            How the mercy we received from
                            You Can set them free
                            As we worship You,
                            Let all this joy that fills our hearts
                            Bring a hunger and a hope to those
                            Who strayed so far

                            Chorus (ascended)
                            As we bow in adoration
                            And stand in reverent awe
                            Show Your majesty and glory,
                            Let Your anointing fall
                            As we declare Your name Lord Jesus
                            As the only Name who saves
                            May the power of Your salvation
                            Fill each heart we pray
                            As we worship You, as we worship
                            You As we worship You, as we worship
                            You As we worship You.
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "At The Cross",
                "lyrics":   """
                            Oh Lord You've searched me
                            You know my way
                            Even when I fail you
                            I know You love me

                            Your holy presence
                            Surrounded me
                            In every season
                            I know You love me
                            I know You love me

                            At the cross I bow my knees
                            Where Your blood was shed for me
                            There's no greater love than this
                            You have overcome the grave
                            Glory fills the highest praise
                            What can separate me now

                            You go before me
                            You shield my way
                            Your hand upholds me
                            And I know You love me

                            At the cross I bow my knees
                            Where Your blood was shed for me
                            There's no greater love than this
                            You have overcome the grave
                            Glory fills the highest praise
                            What can separate me now

                            At the cross I bow my knees
                            Where Your blood was shed for me
                            There's no greater love than this
                            You have overcome the grave
                            Glory fills the highest praise
                            What can separate me now

                            You tore the veil, You made a way
                            When You said that it is done
                            You tore the veil, You made a way
                            When You said that it is done

                            And when the earth fails
                            Falls from my eyes
                            And You stand before me
                            I know You love me
                            Oh, I know You love me

                            At the cross I bow my knees
                            Where Your blood was shed for me
                            There's no greater love than this
                            You have overcome the grave
                            Glory fills the highest praise
                            What can separate me now

                            At the cross I bow my knees
                            Where Your blood was shed for me
                            There's no greater love than this
                            You have overcome the grave
                            Glory fills the highest praise
                            What can separate me now

                            You tore the veil, You made a way
                            When You said that it is done
                            You tore the veil, You made a way
                            When You said that it is done

                            You tore the veil, You made a way
                            When You said that it is done
                            You tore the veil, You made a way
                            When You said that it is done
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Be Not Afraid",
                "lyrics":   """
                            You shall cross the barren desert,
                            But you shall not die of thirst,
                            You shall wander far in safety
                            Though you do not know the way,
                            You shall speak your words
                            To foreign men
                            And they will understand,
                            You shall see the face of God and live.

                            Chorus
                            Be not afraid, I go before you always,
                            Come, follow me and I will give you rest.
                            If you pass through raging waters
                            In the sea, you shall not drown,
                            If you walk amid the burning flames,
                            You shall not be harmed.
                            If you stand before the pow’r of hell,
                            And death is at your side,
                            know that I am with you
                            Through it all.

                            Chorus
                            Blessed are the poor,
                            For the kingdom shall be theirs,
                            Blest are you that weep and mourn,
                            For one day you shall laugh.
                            And if wicked men insult and hate you
                            All because of me,
                            Blessed, blessed, are you!
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Be Still And Know I Am God",
                "lyrics":   """
                            The Lord Almighty is with us;
                            Come see
                            the works of His mighty hands,
                            He ceases the wars
                            to the ends of the earth;
                            He breaks the bow
                            and He shatters the spear,
                            And says:
                            “Be still and know I am God”.

                            Our God is our refuge forever;
                            We will not fear
                            Though the earth does give way.
                            Remember His words
                            Throughout your life.
                            He says:
                            “Be still and know I am God”.
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Be With Me Lord",
                "lyrics":   """
                            Sometimes I feel
                            That I could fight an army
                            With just me and you,
                            And there’s no one could harm me
                            O, but sometimes I can feel a little shy.
                            It’s then I need to know
                            That you are there,
                            That’s why I’m singing

                            Chorus
                            Be with me Lord (when I’m down)
                            Be with me Lord (when I’m lonely)
                            Be with me Lord (when I’m tired)
                            Be with me (I need you only)
                            Be with me Lord (when I’m down)
                            Be with me Lord (when I’m lonely)
                            Be with me (when I need you, Lord)
                            Be my only God.

                            I know you said
                            That I would not be tested
                            More than I could bear
                            And that you have
                            my best in mind With everything
                            That ever comes my way,
                            I know you’re in control
                            So hear me as I pray. I’m singing...

                            Now help me, Lord
                            To share what I’ve been given
                            Help me make a difference
                            With this life I’m living
                            As I show my neighbor
                            Where true treasure’s stored,
                            Help me know you promised
                            You’d be with me Lord. I’m singing.
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Be Thou My Vision",
                "lyrics":   """
                            Be Thou my vision
                            O lord of my heart,
                            Naught be all else to me
                            Save that Thou art
                            Thou my best thought
                            In the day and the night
                            Waking and sleeping
                            Thy presence my light
                            Be Thou my wisdom,
                            Be Thou my true word,

                            Thou ever with me
                            And I with thee, Lord;
                            Thou my great father,
                            And I thy true son;
                            Thou in me dwelling,
                            And I with thee one.

                            Be Thou my breast plate,
                            My sword for the fight
                            Thou my whole armour,
                            And be Thou my might,
                            Thou my soul's shelter,
                            And Thou my strong tower,
                            Raise Thou me heavenward,
                            Great power of my power

                            Riches I need not,
                            Nor men's empty praise,
                            Be Thou my inheritance
                            Now and always,
                            Thou, and thou only
                            The first in my heart
                            O sovereign of heaven
                            My treasure Thou art

                            High king of heaven,
                            When battle is done,
                            Grant heaven's joys to me,
                            Bright heaven's sun;
                            Christ of my own heart,
                            Whatever befall
                            Still be Thou my vision
                            O Ruler of all
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blessed Assurance",
                "lyrics":   """
                            Blessed assurance, Jesus is mine!
                            O what a foretaste of glory divine!
                            Heir of salvation, purchase of God,
                            Born of His Spirit, washed in His blood.
                            Chorus

                            This is my story, this is my song
                            Praising my Savior, all the day long...x 2
                            Perfect submission, perfect delight
                            Visions of rapture
                            Now burst in my sight.
                            Angels descending bring from above
                            Echoes of mercy, whispers of love.
                            Chorus

                            Perfect submission, all is at rest;
                            I in my Savior am happy and blest;
                            Watching and waiting, looking above
                            Filled with His goodness.
                            Lost in His love.
                            Chorus
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blessed Be The Name",
                "lyrics":   """
                            Blessed be the name of the Lord
                            He is worthy to be praised and adored
                            So we lift up holy hands in one accord
                            Singing, blessed be the name
                            Blessed be the name
                            Blessed be the name of the Lord
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blessed Be Your Name",
                "lyrics":   """
                            Blessed be your name
                            In the land that is plentiful
                            Where your streams
                            Of abundance flows
                            Blessed be your name
                            Blessed be your name
                            When I'm found in the desert place
                            Though I walk, through the wilderness
                            Blessed be your name

                            Every blessing you pour out
                            I'll turn back to praise
                            When the darkness closes in
                            Lord still I will say
                            Blessed be the name of the lord
                            Blessed be your name
                            Blessed be the name of the lord
                            Blessed be your glorious name...Chorus
                            Blessed be your name
                            When the sun's shining down on me
                            When the world's all as it should be
                            Blessed be your name
                            Blessed be your name
                            On the road marked with suffering
                            Though there's pain in the offering
                            Blessed be your name...Chorus

                            You give and take away
                            You give and take away
                            My heart will choose to say Lord
                            Blessed be your name
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blessing And Honor, Glory",
                "lyrics":   """
                            Blessing and honor, glory and power,
                            Be unto the Ancient of Days.
                            From every nation, all of creation,
                            Bows before the Ancient of Days.

                            Every tongue in heaven and earth
                            Shall declare Your glory,
                            Every knee shall bow at Your throne,
                            In worship,
                            You will be exalted, oh God,
                            And Your kingdom shall not pass away,
                            Oh Ancient of Days.

                            Your kingdom shall
                            Reign over all the earth,
                            Sing unto the Ancient of Days.
                            None can compare
                            To Your matchless works,
                            Sing unto the Ancient of Days.
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blessing And Honour",
                "lyrics":   """
                            Blessing And Honour,
                            And Glory Be Thine
                            And Glory Be Thine (2)
                            Blessing And Honour
                            And Glory Be Thine
                            For Thou Art On The Throne

                            Praise Him, Praise Him
                            All The Saints Adore Him
                            Praise Him, Praise Him
                            For Thou Art On The Throne
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blest Be The Lord",
                "lyrics":   """
                            Chorus
                            Blest be the Lord, Blest be the Lord
                            The God of mercy, the God who saves
                            I shall not fear the dark of night
                            Nor the arrow that flies by day.

                            He will release me from
                            The nets of all my foes,
                            He will protect me from their
                            wicked hands,
                            Beneath the shadow of
                            His wings I will rejoice,
                            To find a dwelling place secure.
                            Chorus

                            I need not shrink before
                            The terrors of the night,
                            Nor stand alone before the
                            light of day.
                            No harm shall come to me,
                            no arrow strike me down,
                            No evil settle in my soul.
                            Chorus

                            Although a thousand strong
                            have fallen at my side,
                            I’ll not be shaken with the
                            Lord at hand.
                            His faithful love is all the
                            armour that I need
                            To wage the battle with my foes.
                            Chorus
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Blue Skies And Rainbows",
                "lyrics":   """
                            Blue skies and rainbows
                            And sunbeams from heaven,
                            Are all I can see when
                            My Lord is living in me.
                            Chorus

                            Jesus is well and alive today
                            He makes His home in my heart.
                            Nevermore will I be
                            All alone since He
                            Promised me that
                            We never would part.

                            Green grass and flowers
                            All blooming in springtime,
                            Are works of the Master
                            I live for each day. Chorus

                            Tall mountains green valleys
                            The beauty that surrounds me,
                            All make me aware of
                            The One who made it all. Chorus

                            I’m not ashamed
                            Of the gospel of Jesus,
                            For it is the power
                            Of salvation for me.
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Broken Vessels",
                "lyrics":   """
                            All these pieces
                            Broken and scattered
                            In mercy gathered
                            Mended and whole
                            Empty handed
                            But not forsaken
                            I've been set free
                            I've been set free

                            Amazing grace
                            How sweet the sound
                            That saved a wretch like me
                            I once was lost
                            But now I'm found
                            Was blind but now I see

                            Oh I can see you now
                            Oh I can see the love in Your eyes
                            Laying yourself down
                            Raising up the broken to life

                            You take our failure
                            You take our weakness
                            You set Your treasure
                            In jars of clay
                            So take this heart, Lord
                            I'll be Your vessel
                            The world to see
                            Your life in me

                            Amazing grace
                            How sweet the sound
                            That saved a wretch like me
                            I once was lost
                            But now I'm found
                            Was blind but now I see
                            Oh I can see you now
                            Oh I can see the love in Your eyes
                            Laying yourself down
                            Raising up the broken to life

                            Amazing grace
                            How sweet the sound
                            That saved a wretch like me
                            I once was lost
                            But now I'm found
                            Was blind but now I see
                            [2x]

                            Oh I can see you now
                            Oh I can see the love in Your eyes
                            Laying yourself down
                            Raising up the broken to life

                            Amazing grace
                            How sweet the sound
                            That saved a wretch like me
                            I once was lost
                            But now I'm found
                            Was blind but now I see
                            [2x]

                            Oh I can see you now
                            Oh I can see the love in Your eyes
                            Laying yourself down
                            Raising up the broken to life
                            [3x]
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "Build Us Together",
                "lyrics":   """
                            Bind Us Together Lord
                            Bind Us Together With
                            Cords That Cannot Be Broken
                            Bind Us Together Lord (2)

                            Bind Us Together With Love.
                            There Is Only One God
                            There Is Only One King
                            There Is Only One Body
                            That Is Why We Sing
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "By Faith",
                "lyrics":   """
                            By faith we are sure.
                            What we hope for,
                            We're certain of, though now
                            We do not see.
                            By faith we believe
                            You created the universe
                            You spoke; it came to be.

                            By faith we will conquer.
                            By faith we believe
                            The battle belongs to you,
                            So on our knees,
                            By faith we will cry out.
                            By faith you will save.
                            By faith 'till forever
                            We will live by faith!

                            By faith Abraham
                            When you called him,
                            Obeyed and lived his life
                            A stranger here.
                            By faith he believed
                            That a son he would sure receive;
                            Your promise had been clear…

                            By faith Moses suffered along
                            With the people of God,
                            Knowing life was short.
                            By faith he regarded disgrace
                            For the sake of Christ was
                            Well worth the reward…

                            By faith people passed through
                            The Red Sea.
                            The walls of Jericho
                            Came crashing down.
                            By faith conquered kingdoms,
                            And justice was given
                            Angels shut the lion's mouth…

                            Though commended by God,
                            These did not see the promise;
                            It was saved, complete with us,
                            As we all run the race,
                            With our eyes on the Savior
                            'Till the final battle's won…
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

        data = ["title": "By His Word",
                "lyrics":   """
                            By His Word, I Have No Fear In Me
                            By His Word, Death Cannot Swallow Me
                            By His Word, I Have Prosperity
                            By His Word, Sickness Can't Well In Me
                            By His Word, I Walk In Victory
                            By His Word, I've Been Set Free

                            By His Name....., By His Blood
                            """,
                    "uid": newSong.documentID
            ]
        songsCollectionRef.addDocument(data: data)

    }
    
// UI CONFIGURATION
    
    @objc func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
        
    }
    
    func configureUI() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "SONG BOOK"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.282, green: 0.306, blue: 0.392, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        showSearchBarButton(shouldShow: true)
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,                                                                target: self,                                                                                action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
        
    }
    
}
    

// UI CONFIG END
    extension SongbookController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did begin..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did end..")
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredSongs = []
        
        if searchText == "" {
            filteredSongs = songs
        }
        else {
            for songname in songs {
                if songname.title!.lowercased().contains(searchText.lowercased()) {
                    filteredSongs.append(songname)
                }
            }
        }
//        self.tableView.reloadData()
    }
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        search(shouldShow: false)
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        search(shouldShow: true)
    }
     
        

    }
    


    //DataSource
    extension SongbookController: UITableViewDataSource {
    
            func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as? SongTitleCell {
            cell.configureCell(song: filteredSongs[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
}
    //Delegate
    extension SongbookController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "SongDetailSegue", sender: self)
            print(indexPath.row)
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? SongbookDetailController {
                destination.song = filteredSongs[(tableView.indexPathForSelectedRow?.row)!]
            }
        }
    }



