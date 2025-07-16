//
//  UIApplication.swift
//  crypto-tracker
//
//  Created by Kaung Htet Hein on 13/07/2025.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
