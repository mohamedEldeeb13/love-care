//
//  ContentView.swift
//  love&care
//
//  Created by Mohamed Abd Elhakam on 23/12/2023.
//

import SwiftUI

struct ContentView: View {
    // proparties
    @AppStorage("isOnboarding") var isOnboarding = true
    
    
    // body
    var body: some View {
        
        if isOnboarding {
            onBoarding()
        }else{
            home()
        }
    }
}


// preview
#Preview {
    ContentView()
}
