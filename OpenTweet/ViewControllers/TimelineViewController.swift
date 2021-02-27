//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    let viewModel = TimelineViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		
        navigationItem.title = "Tweets"
        tableView.register(UINib.init(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThreadViewController,
           let thread = sender as? Thread {
            destination.thread = thread
        }
    }

    @IBOutlet weak var tableView: UITableView!
}

extension TimelineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweet = viewModel.tweets[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as? TweetTableViewCell {
            
            cell.configure(tweet: tweet)
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension TimelineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweet = viewModel.tweets[indexPath.row]
        let thread = viewModel.thread(for: tweet)
        
        performSegue(withIdentifier: "ShowThreadSegue", sender: thread)
    }
}
