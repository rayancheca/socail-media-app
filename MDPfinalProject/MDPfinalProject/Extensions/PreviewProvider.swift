//
//  PreviewProvider.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import SwiftUI
import Firebase

extension PreviewProvider 
{
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
} // end extension preview porivder

class DeveloperPreview
{
    static let shared  = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Rayan Checa", email: "rkc@gmail.com", username: "rayan_checa")

    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
} // end class developer preview
