//
//  HeaderView.swift
//  Black Jack CodeCamp
//
//  Created by Noah Uni on 26.11.23.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.gray)
                .rotationEffect(Angle(degrees: -15))
            
            VStack{
                Text("BlackJack")
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .bold()
                
            }.padding(.top, 60)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y:-250)
    }
}

#Preview {
    HeaderView()
}
