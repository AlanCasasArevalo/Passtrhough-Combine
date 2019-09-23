//
//  MainViewController.swift
//  Passthrough
//
//  Created by Alan Casas on 23/09/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import Combine

@available(iOS 13.0, *)
class MainViewController: UIViewController {
    
    let stringValueToObserver = "value"
    
    @IBOutlet weak var stackView: UIStackView!
    var value = 0 {
        didSet {
            valueStream.send(value)
        }
    }
    
    let valueStream = CurrentValueSubject<Int, Never>(0)
    var cancels: [Cancellable] = []
    
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
    
        let objectToCheck = valueStream.map { "\($0)" }
        .assign(to: \.text, on: label)
            cancels.append(objectToCheck)
        }
        
    @IBAction func addNewItemButtonPressed(_ sender: Any) {
        createNewLabel()
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        value += 1
    }
    
    
}
