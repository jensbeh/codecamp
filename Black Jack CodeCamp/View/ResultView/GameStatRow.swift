//
//  GameStatRow.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 11.12.23.
//

import SwiftUI

struct GameStatRow: View {
    var gameStat: GameStat
    
    var body: some View {
       HStack {
          Text(String(gameStat.time))
              .frame(maxWidth: .infinity)
          Text(gameStat.result.text)
              .frame(maxWidth: .infinity)
          Text(String(gameStat.finalPlayerValue))
              .frame(maxWidth: .infinity)
          Text(String(gameStat.finalBankValue))
              .frame(maxWidth: .infinity)
       }.frame(width: 300)
    }
}

#Preview {
    ResultView()
}
