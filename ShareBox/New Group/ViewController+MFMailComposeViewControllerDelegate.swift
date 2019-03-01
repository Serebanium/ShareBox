//
//  ViewController+MFMailComposeViewControllerDelegate.swift
//  ShareBox
//
//  Created by Сергей Иванов on 01/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import MessageUI

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
}
