//
//  ViewController.swift
//  ShareBox
//
//  Created by Сергей Иванов on 28/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func share(sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
    }
    
    func safari(sender: UIButton) {
        
    }
    
    func camera(sender: UIButton) {
        
    }
    
    func email(sender: UIButton) {
        
    }
    
    @IBAction func buttonPressed(sender button: UIButton) {
        guard let text = button.titleLabel?.text else { return }
        
        switch text {
        case "Share":
            share(sender: button)
        case "Safari":
            safari(sender: button)
        case "Camera":
            camera(sender: button)
        case "E-mail":
            email(sender: button)
        default:
            break
        }
        
    }

}

