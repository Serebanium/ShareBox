//
//  ViewController+MFMessageComposeViewControllerDeligate.swift
//  ShareBox
//
//  Created by Сергей Иванов on 01/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import MessageUI

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
