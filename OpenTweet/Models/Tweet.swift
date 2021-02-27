//
//  Tweet.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

struct Tweet: Decodable {
    let id: String
    let avatar: String?
    let author: String
    let content: String
    let date: Date
}

struct TwitterResponse: Decodable {
    let timeline: [Tweet]
}
