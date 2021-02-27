//
//  UIImageView+Extension.swift
//  OpenTweet
//
//  Created by Steve Schwedt on 2/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadImage(urlString: String?, fallbackSymbol: String? = nil) {
        guard let urlString = urlString,
              let url = URL(string: urlString)
        else { setFallbackSymbol(fallbackSymbol); return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { self.setFallbackSymbol(fallbackSymbol); return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    private func setFallbackSymbol(_ symbolName: String?) {
        guard let symbolName = symbolName else { return }
        
        let image = UIImage(systemName: symbolName)
        
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
