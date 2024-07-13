//
//  PostService.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService
{
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    } // end func upload thread
    
    static func fetchThreads() async throws -> [Thread] 
    {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    } // end func fetch threads
    
    static func fetchUserThreads(uid: String) async throws -> [Thread]
    {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        
    } // end func fetch user threads
} // end struct post service
