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
    
    var body: some View {
        ScrollView{
            VStack() {
                
                // Total games
                Text("Total Games")
                Text(String(resultsViewModel.gameStats.count))
                    
                // Chart of wins, loses, ties
                Chart {
                    // Wins
                    BarMark(
                        x: .value("Shape Type", ResultType.win.text),
                        y: .value("Total Count", resultsViewModel.getWinsCount())
                    )
                    .annotation(position: .overlay, alignment: .center, content: {
                        Text(String(resultsViewModel.getRoundedWinsProcent()) + "%")
                    })
                    .foregroundStyle(.green)
                    
                    // Loses
                    BarMark(
                        x: .value("Shape Type", ResultType.lose.text),
                        y: .value("Total Count", resultsViewModel.getLoseCount())
                    )
                    .annotation(position: .overlay, alignment: .center, content: {
                        Text(String(resultsViewModel.getRoundedLosesProcent()) + "%")
                    })
                    .foregroundStyle(.red)
                    
                    // Ties
                    BarMark(
                        x: .value("Shape Type", ResultType.tie.text),
                        y: .value("Total Count", resultsViewModel.getTiesCount())
                    )
                    .annotation(position: .overlay, alignment: .center, content: {
                        Text(String(resultsViewModel.getRoundedTiesProcent()) + "%")
                    })
                    .foregroundStyle(.gray)
                }
                .chartYScale(domain: 0...max(resultsViewModel.getWinsCount(), resultsViewModel.getLoseCount(), resultsViewModel.getTiesCount()))
                .frame(height: 250)
                
                Spacer()
                    .frame(height: 30)
                
                // List of gameStats
                Grid {
                    // Headline of grid
                    GridRow {
                        Text("Time")
                        Text("Result")
                        Text("Player Hand")
                            .multilineTextAlignment(.center)
                        Text("Bank Hand")
                            .multilineTextAlignment(.center)
                    }.padding(.top, 5)
                    .bold()
                    .font(.headline)
                    .frame(height: 50)
                    
                    Divider()
                    
                    // Further lines of grid
                    // Show text if no gameStats are available
                    if resultsViewModel.gameStats.isEmpty {
                        HStack {
                            Text("No game statistics are currently available. Please play a round first to see your statistics! :)")
                                .multilineTextAlignment(.center)
                        }
                    } else {
                        // Show gameStats
                        ForEach(resultsViewModel.gameStats) { gameStat in
                            GridRow {
                                Text(resultsViewModel.getTimeStr(gameStat: gameStat))
                                    .multilineTextAlignment(.center)
                                Text(gameStat.result.text)
                                Text(String(gameStat.finalPlayerValue))
                                Text(String(gameStat.finalBankValue))
                            }
                            if gameStat != resultsViewModel.gameStats.last {
                                Divider()
                            }
                        }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    }
                }.background(.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 20)
        }
        
    }
        
}

#Preview {
    ResultView()
}
