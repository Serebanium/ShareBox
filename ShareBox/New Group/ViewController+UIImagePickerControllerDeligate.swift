//
//  ViewController+UIImagePickerControllerDeligate.swift
//  ShareBox
//
//  Created by Сергей Иванов on 01/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageView.image = image
        dismiss(animated: true, completion: nil)
        
    }
    
}
