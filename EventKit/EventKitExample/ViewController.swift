//
//  ViewController.swift
//  EventKit
//
//  Created by João Guilherme on 21/09/21.
//

import EventKitUI
import EventKit
import UIKit

class ViewController: UIViewController, EKEventViewDelegate {
    
    let store = EKEventStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTouchAdd))
    }
    @objc func didTouchAdd(){
        store.requestAccess(to: .event){[weak self] success, err in
            if success, err  == nil{
                DispatchQueue.main.async {
                    let eventViewController = EKEventViewController()
                    eventViewController.delegate = self
                    eventViewController.event = nil
                    self?.present(eventViewController, animated: true)
                }
            }
        }
        
    }
    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        
    }
}

