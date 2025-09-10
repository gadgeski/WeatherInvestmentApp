//
//  ControlsView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

struct ControlsView: View {
    @ObservedObject var viewModel: TemperatureViewModel
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: viewModel.updateTemperatures) {
                HStack {
                    Text("🔄")
                    Text("気温更新")
                }
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button(action: viewModel.sortByTemperature) {
                HStack {
                    Text("🔥")
                    Text("温度順")
                }
            }
            .buttonStyle(SecondaryButtonStyle())
            
            Button(action: viewModel.sortByRegion) {
                HStack {
                    Text("📍")
                    Text("地域順")
                }
            }
            .buttonStyle(SecondaryButtonStyle())
        }
    }
}

struct TimestampView: View {
    let lastUpdate: Date
    
    var body: some View {
        HStack {
            Text("最終更新:")
                .foregroundColor(.secondary)
            Text(lastUpdate, style: .time)
                .foregroundColor(.secondary)
        }
        .font(.caption)
    }
}
