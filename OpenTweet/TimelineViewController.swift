//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    var tweets: [Tweet]? = nil

	override func viewDidLoad() {
		super.viewDidLoad()
		
        tableView.register(UINib.init(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        tweets = TwitterService.getTweets()
        tableView.reloadData()
	}

    @IBOutlet weak var tableView: UITableView!
}

extension TimelineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tweet = tweets?[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as? TweetTableViewCell {
            cell.configure(tweet: tweet)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
