//
//  ThreadViewController.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {
    
    var thread: Thread?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Thread"
        let height = avatarImage.frame.height
        avatarImage.layer.cornerRadius = height / 2
        
        if let tweet = thread?.firstTweet {
            authorLabel.text = tweet.author
            content.text = tweet.content
            dateLabel.text = DateFormatter.yearMonthDayTimeString(from: tweet.date)
            avatarImage.downloadImage(urlString: tweet.avatar, fallbackSymbol: "person.circle.fill")
        }
        
        if thread?.replies.count == 0 {
            tableView.isHidden = true
            repliesLabel.text = "No Replies"
        }
        
        tableView.register(UINib.init(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
    }

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var repliesLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
}

extension ThreadViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        thread?.replies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as? TweetTableViewCell,
           let tweet = thread?.replies[indexPath.row] {
            
            cell.configure(tweet: tweet)
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ThreadViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TweetTableViewCell {
            cell.performHighlightAnimation()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
