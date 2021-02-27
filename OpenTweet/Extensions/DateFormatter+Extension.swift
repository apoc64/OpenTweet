//
//  DateFormatter+Extension.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func yearMonthDayTimeString(from date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY HH:mm"
    
        return formatter
    }()
}
