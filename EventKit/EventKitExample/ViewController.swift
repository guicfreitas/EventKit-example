//
//  ViewController.swift
//  EventKit
//
//  Created by João Guilherme on 21/09/21.
//
import UIKit
import EventKit
import EventKitUI

class ViewController: UIViewController, EKEventViewDelegate, EKEventEditViewDelegate {
    
    
    
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
                    guard let store = self?.store else { return }
                    
                    let newEvent = EKEvent(eventStore: store)
                    
                    let eventViewController = EKEventEditViewController()
                    eventViewController.editViewDelegate = self
                    eventViewController.eventStore = store
                    eventViewController.event = newEvent
                    self?.present(eventViewController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
}

