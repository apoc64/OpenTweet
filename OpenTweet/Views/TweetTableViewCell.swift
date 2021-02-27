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
        contentLabel.attributedText = formattedContent(from: tweet.content)
        dateLabel.text = DateFormatter.yearMonthDayTimeString(from: tweet.date)
        
        avatarImage.downloadImage(urlString: tweet.avatar, fallbackSymbol: "person.circle.fill")
    }
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private func formattedContent(from content: String) -> NSAttributedString {
        let words = content.split(separator: " ")
        let formattedContent = NSMutableAttributedString()
        
        for word in words {
            var subString: NSAttributedString
            if word.starts(with: "@") {
                subString = NSAttributedString(string: String(word) + " ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
            } else {
                subString = NSAttributedString(string: String(word) + " ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
            }
            formattedContent.append(subString)
        }
        
        return formattedContent
    }
}
