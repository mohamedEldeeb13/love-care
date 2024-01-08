//
//  onBoarding.swift
//  love&care
//
//  Created by Mohamed Abd Elhakam on 23/12/2023.
//

import SwiftUI

struct onBoarding: View {
    // proparties
    @AppStorage("isOnboarding") var isOnboarding = true
    @State var isAnimation : Bool = false
    @State var imageOffset = CGSize(width: 0.0, height: 0.0)
    @State var buttomOffset : CGFloat = 0.0
    @State var buttomWidth : Double = UIScreen.main.bounds.width - 80
    let feedback = UINotificationFeedbackGenerator()
    
    
    // body
    var body: some View {
        ZStack
        {
            Color("colorBlue")
                .ignoresSafeArea(.all)
            VStack
            {
            //MARK: - Header
            
            VStack
            {
                Text(abs(imageOffset.width) > 0 ? "care." : "Love")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                Text("Life doesn't come with a manua , it comes with a mother")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .padding(.horizontal , 10)
                    .multilineTextAlignment(.center)
            }
            .offset( y: isAnimation ? 0 : -40)
            .animation(.easeInOut(duration: 1), value: isAnimation)
            Spacer()
            
            
            //MARK: - Center
            
            ZStack
            {
                GroupedCircle(circleColor: .white)
                    .offset(x: imageOffset.width * -1)
                    .blur(radius: abs(imageOffset.width) / 5 , opaque: false)
                Image("happy-pregnant")
                    .resizable()
                    .scaledToFit()
                    .offset(x: imageOffset.width , y: 0)
                    .rotationEffect(.degrees(imageOffset.width / 15))
                    .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.5), radius: 8, x: 3, y: 30)
                    .overlay(alignment: .bottom) {
                        Image(systemName: "arrow.left.and.right.circle")
                            .font(.system(size: 30, weight: .ultraLight, design: .rounded))
                            .opacity(abs(imageOffset.width) > 0 ? 0 : 1)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 300, alignment: .center)
                    .gesture(DragGesture()
                        .onChanged({ gesture in
                            if abs(gesture.translation.width) <= 150 {
                                imageOffset = gesture.translation
                            }
                        })
                            .onEnded({ _ in
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    imageOffset = .zero
                                }
                            })
                    )
            }
            
            Spacer()
            
            //MARK: - Footer
                
                ZStack
                {
                    // background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // text
                    Text("Start")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    // dynamic capsule
                    HStack {
                        Capsule()
                            .foregroundStyle(Color("colorRed"))
                        .frame(width: 80 + buttomOffset)
                        Spacer()
                    }
                   
                    // dragable circle
                    HStack {
                        ZStack
                        {
                            Circle()
                                .fill(Color("colorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 26, design: .rounded))
                                .foregroundStyle(.white)
                        
                        }//(zstack end of dragable circle)
                        .frame(width: 80, alignment: .center)
                        .offset(x: buttomOffset)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if (gesture.translation.width >= 0) && (buttomOffset <= buttomWidth - 80){
                                    buttomOffset = gesture.translation.width
                                }
                            })
                                .onEnded({ _ in
                                    
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        
                                        if buttomOffset >= buttomWidth / 2 {
                                            isOnboarding = false
                                            play(audioPath: "chimeup", audioType: "mp3")
                                            feedback.notificationOccurred(.success)
                                        }else {
                                            
                                            buttomOffset = .zero
                                            feedback.notificationOccurred(.error)
                                        }
                                       
                                    }
                                    
                                    
                                        
                                    
                                })
                        )
                        Spacer()
                    }//(Hstack end of dragable circle)
                    
                    
                }//: zstack of footer
                .frame( height: 80, alignment: .center)
                .padding(.horizontal , 40)
                .offset( y: isAnimation ? 0 : 40)
                .animation(.easeInOut(duration: 1), value: isAnimation)
            
            }//: vstack
            
        }//: zstack
        .onAppear{
            isAnimation.toggle()
        }
       
        
    }
}




// preview
#Preview {
    onBoarding()
}
