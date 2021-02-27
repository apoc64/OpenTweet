//
//  TwitterService.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

struct TwitterService {
    
    static func getTweets() -> [Tweet]? {
        let path = Bundle.main.path(forResource: "timeline", ofType: "json")
        let url = URL(fileURLWithPath: path ?? "")
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(TwitterResponse.self, from: jsonData)
            
            return response.timeline
        } catch {
            print("Failed to get tweets")
            
            return nil
        }
    }
}
