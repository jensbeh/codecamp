//
//  MainMenu.swift
//  Black Jack CodeCamp
//
//  Created by Noah Uni on 28.11.23.
//

import SwiftUI

struct MainMenu: View {
    //TODO add to custom assets
    let buttonTextColor = Color("ButtonColor")

    var body: some View {
        VStack{
            
            //        Header
            HeaderView().frame(height: 50)
            
            
                VStack {
                    NavigationLink(destination:GameView()){
                        Text("Play").foregroundStyle(buttonTextColor)
                    }
                    .frame(width: CGFloat(200))
                    .font(.system(size:30))
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(5)
                    .fixedSize()
                    
                    NavigationLink(destination:GameView()){
                        Text("Results").foregroundStyle(buttonTextColor)
                    }
                    .frame(width: CGFloat(200))
                    .font(.system(size:30))
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(5)
                    .fixedSize()
                
                    
                    NavigationLink(destination:GameView()){
                        Text("Settings").foregroundStyle(buttonTextColor)
                    }
                    .frame(width: CGFloat(200))
                    .font(.system(size:30))
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(5)
                    .fixedSize()
                    
                }
            }
    }
}

#Preview {
    MainMenu()
}
