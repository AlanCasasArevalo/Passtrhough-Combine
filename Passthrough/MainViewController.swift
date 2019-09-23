//
//  MainViewController.swift
//  Passthrough
//
//  Created by Alan Casas on 23/09/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let stringValueToObserver = "value"
    
    @IBOutlet weak var stackView: UIStackView!
    var value = 0 {
        didSet {
            NotificationCenter.default.post(name: .init(stringValueToObserver), object: value)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func createNewLabel () {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.text = "--"
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.insertArrangedSubview(label, at: 0)
        
        NotificationCenter.default.addObserver(forName: .init(stringValueToObserver),
                                               object: nil,
                                               queue: OperationQueue.main) { notification in
                                                    if let value = notification.object as? Int {
                                                        label.text = "\(value)"
                                                    }
                                                
                                                }
        
    }
    
    @IBAction func addNewItemButtonPressed(_ sender: Any) {
        createNewLabel()
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        value += 1
    }
    
    
}
