//
//  UserContentListViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Foundation

class UserContentListViewModel: ObservableObject
{
    @Published var threads = [Thread]()

    let user: User
    
    init(user: User){
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws
    {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count{
            threads[i].user = self.user
        }
        
        self.threads = threads
    } // end func fetch user threads
} // end class user content list view model
