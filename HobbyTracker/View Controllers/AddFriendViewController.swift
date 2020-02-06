//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Elizabeth Thomas on 2/5/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

// Delegator
// 1: Create a protocol with the delegate name
// 2: Create a delegate property of type [whatever your delegate name is] (optional)
// 3: When needed, call the delegate method on the delegator



// Responsible for creating a friend object
class AddFriendViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    // MARK: - Private Properties
    var delegate: AddFriendDelegate?
    
    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let homeTown = hometownTextField.text,
            !name.isEmpty,
            !homeTown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: homeTown, hobbies: [])
        
        if let hobby1 = hobby1TextField.text,
            !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby2TextField.text,
            !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        
        if let hobby3 = hobby3TextField.text,
            !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.friendWasCreated(friend)
        self.dismiss(animated: true )
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
