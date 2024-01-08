//
//  home.swift
//  love&care
//
//  Created by Mohamed Abd Elhakam on 23/12/2023.
//

import SwiftUI

struct home: View {
    // proparties
    @AppStorage("isOnboarding") var isOnboarding = false
    @State var isAnimation : Bool = false
    let feedback = UINotificationFeedbackGenerator()
    
    
    // body
    var body: some View {
        VStack {
            Spacer()
            //MARK: Header
            ZStack
            {
                
                GroupedCircle(circleColor: .gray)
                
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, alignment: .center)
                    .offset( y: isAnimation ? 30 : -30)
                    .animation(.easeIn(duration: 2.5).repeatForever(autoreverses: true), value: isAnimation)
                
            }//: Zstack
            Spacer()
            
            
            //MARK: description
            Text("Having children just puts the whole world into prespective. everythings else just disappears ")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundStyle(.gray)
            Spacer()
            
            //MARK: Footer
            
            Button {
                isOnboarding.toggle()
                feedback.notificationOccurred(.success)
                play(audioPath: "success", audioType: "m4a")
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 25,design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            Spacer()
          
        }//: Vstack
        .onAppear {
            isAnimation.toggle()
        }
    }
}


// preview
#Preview {
    home()
}
