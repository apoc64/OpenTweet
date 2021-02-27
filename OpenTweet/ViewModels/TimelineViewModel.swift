//
//  TimelineViewModel.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

struct TimelineViewModel {
    
    let tweets: [Tweet]
    
    init() {
        tweets = TwitterService.getTweets() ?? []
    }
    
    func thread(for tweet: Tweet) -> Thread {
        if let inReplyTo = tweet.inReplyTo,
           let firstTweet = tweets.first(where: { $0.id == inReplyTo }) {
            return Thread(firstTweet: firstTweet, replies: [tweet])
        } else {
            let replies = tweets
                .filter { $0.inReplyTo == tweet.id }
                .sorted(by: { $0.date < $1.date })
            
            return Thread(firstTweet: tweet, replies: replies)
        }
    }
}

struct Thread {
    let firstTweet: Tweet
    let replies: [Tweet]
}
