//
//  SummaryStatsView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

struct SummaryStatsView: View {
    @ObservedObject var viewModel: TemperatureViewModel
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 4), spacing: 15) {
            StatCardView(value: "\(viewModel.averageTemperature)℃", label: "平均気温")
            StatCardView(value: "\(viewModel.maxTemperature)℃", label: "最高気温")
            StatCardView(value: "\(viewModel.minTemperature)℃", label: "最低気温")
            StatCardView(value: "\(viewModel.hotRegionsCount)地域", label: "猛暑地域")
        }
    }
}

struct StatCardView: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 3)
    }
}
