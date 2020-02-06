//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Elizabeth Thomas on 2/5/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbyCountLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        hobbyCountLabel.text = "\(friend.hobbies.count) hobbies"
    }
}
