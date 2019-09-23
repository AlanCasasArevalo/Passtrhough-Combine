//
//  MainViewController.swift
//  Passthrough
//
//  Created by Alan Casas on 23/09/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class MainViewController: UIViewController {
    
    let stringValueToObserver = "value"
    
    @IBOutlet weak var stackView: UIStackView!
    var value = 0 {
        didSet {
            valueStream.onNext(value)
        }
    }
    
    let valueStream = PublishSubject<Int> ()
    
    
    

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
        _ = valueStream.map {
                "\($0)"
            }
        .bind(to: label.rx.text)
        
    }
    
    @IBAction func addNewItemButtonPressed(_ sender: Any) {
        createNewLabel()
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        value += 1
    }
    
    
}
