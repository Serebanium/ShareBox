//
//  ViewController.swift
//  ShareBox
//
//  Created by Сергей Иванов on 28/02/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

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
        let url = URL(string: "http://apple.com")!
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true, completion: nil)
    }
    
    func camera(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Выберите источник", message: nil, preferredStyle: .actionSheet)
        
        let cansel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cansel)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        let camera = UIAlertAction(title: "Камера", style: .default) { action in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
            }
        alertController.addAction(camera)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        let photo = UIAlertAction(title: "Библиотека фото", style: .default) { action in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            }
        alertController.addAction(photo)
        }
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    func email(sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setSubject("ShareBox")
        mailComposer.setMessageBody("Отправлено приложением ShareBox", isHTML: false)
        present(mailComposer, animated: true, completion: nil)
    }
    
    func sms(sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else { return }
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self
        
        present(messageComposer, animated: true, completion: nil)
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
        case "SMS":
            sms(sender: button)
        default:
            break
        }
        
    }

}

