//
//  GroupedCircle.swift
//  love&care
//
//  Created by Mohamed Abd Elhakam on 23/12/2023.
//

import SwiftUI

struct GroupedCircle: View {
    // proparities
    var circleColor : Color = .gray
    @State var isAnimation : Bool = false
    var body: some View {
        ZStack
        {
            Circle()
                .stroke( circleColor.opacity(0.2) , lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            Circle().stroke( circleColor.opacity(0.2) , lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .scaleEffect(isAnimation ? 1 : 0.5)
        .animation(.easeInOut(duration: 1), value: isAnimation)
        .onAppear{
            isAnimation.toggle()
        }
    }
}

#Preview {
    GroupedCircle()
}
