//
//  TweetTableViewCell.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let height = avatarImage.frame.height
        avatarImage.layer.cornerRadius = height / 2
    }

    func configure(tweet: Tweet) {
        authorLabel.text = tweet.author
        contentLabel.text = tweet.content
        dateLabel.text = DateFormatter.yearMonthDayTimeString(from: tweet.date)
        
        avatarImage.downloadImage(urlString: tweet.avatar, fallbackSymbol: "person.circle.fill")
    }
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
}
