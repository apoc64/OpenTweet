//
//  TweetTableViewCell.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    func configure(tweet: Tweet) {
        authorLabel.text = tweet.author
        contentLabel.text = tweet.content
        dateLabel.text = dateFormatter.string(from: tweet.date)
    }
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY HH:mm"
    
        return formatter
    }()
}
