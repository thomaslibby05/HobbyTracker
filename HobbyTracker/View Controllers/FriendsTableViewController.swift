//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Elizabeth Thomas on 1/30/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var friends: [Friend] = [Friend(name: "Libby", hometown: "Kiowa", hobbies: ["Coding", "Reading", "Video Games"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // creating an instance of this cell, "find the cell that has this identifier in my table view"
        // Cell should be of type FriendTableViewCell - if not, return a blank cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
    // 2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendSegue" {
            let addFriendVC = segue.destination as! AddFriendViewController
            
            addFriendVC.delegate = self
        }
    }
}
// 1
extension FriendsTableViewController: AddFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
}
// extension FriendsTableViewController: UITableViewDelegate {}
// You can do this the above way or just add it into your class, and make it conform there

// Delegate
// 1: Adopt and conform to delegate/protocol
// 2: Set self as delegate when delegator is created
