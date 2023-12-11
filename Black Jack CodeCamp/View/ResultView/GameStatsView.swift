//
//  StatsChart.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 11.12.23.
//

import Foundation
import SwiftUI
import Charts

struct GameStatsView: View {
    @ObservedObject var resultsViewModel: ResultsViewModel
    
//    @State private var list: [GameStat] = []
//    
//    init(resultsViewModel: ResultsViewModel) {
//        self.resultsViewModel = resultsViewModel
//        list = resultsViewModel.gameStats
//    }
    
    var body: some View {
        ScrollView{
            VStack() {
                HStack() {
                    VStack() {
                        VStack() {
                            Text("Total Games")
                            Text(String(resultsViewModel.gameStats.count))
                        }
                    }
                }
                
                Chart {
                    BarMark(
                        x: .value("Shape Type", ResultType.win.text),
                        y: .value("Total Count", resultsViewModel.getWinsCount())
                    )
                    .annotation(position: .overlay, alignment: .center, spacing: 3, content: {
                        Text(String(resultsViewModel.getRoundedWinsProcent()) + "%")
                    })
                    .foregroundStyle(.green)
                    BarMark(
                        x: .value("Shape Type", ResultType.loose.text),
                        y: .value("Total Count", resultsViewModel.getLooseCount())
                    )
                    .annotation(position: .overlay, alignment: .center, spacing: 3, content: {
                        Text(String(resultsViewModel.getRoundedLoosesProcent()) + "%")
                    })
                    .foregroundStyle(.red)
                    BarMark(
                        x: .value("Shape Type", ResultType.draw.text),
                        y: .value("Total Count", resultsViewModel.getDrawsCount())
                    )
                    .annotation(position: .overlay, alignment: .center, spacing: 3, content: {
                        Text(String(resultsViewModel.getRoundedDrawsProcent()) + "%")
                    })
                    .foregroundStyle(.gray)
                }
                .frame(height: 250)
                
                Spacer()
                    .frame(height: 30)
                

//                Table(list) {
//                    TableColumn("Time") { gameStat in
//                        Text(String(gameStat.time))
//                    }
//                    TableColumn("Result") { gameStat in
//                        Text(gameStat.result.text)
//                    }
//                    TableColumn("Player Value") { gameStat in
//                        Text(String(gameStat.finalPlayerValue))
//                    }
//                    TableColumn("Bank Value") { gameStat in
//                        Text(String(gameStat.finalBankValue))
//                    }
//                }

                // Show list of gameStats
                VStack {
                    Text("All Game Statistics")
                        .font(.headline)
                    Divider()
                        .frame(height: 5)
                    ForEach(resultsViewModel.gameStats) { gameStat in
                        GameStatRow(gameStat: gameStat)
                    }
                }.padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        
    }
        
}

#Preview {
    ResultView()
}
