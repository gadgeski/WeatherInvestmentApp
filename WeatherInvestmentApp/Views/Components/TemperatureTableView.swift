//
//  TemperatureTableView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

struct TemperatureTableView: View {
    @ObservedObject var viewModel: TemperatureViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Table Header
            HStack {
                Text("地方")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("現在気温")
                    .frame(width: 100)
                Text("状態")
                    .frame(width: 80)
                Text("体感")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .font(.headline)
            .foregroundColor(.white)
            .background(
                LinearGradient(colors: [Color.blue, Color.green.opacity(0.8)],
                             startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            
            // Table Rows
            ForEach(viewModel.regions) { region in
                TemperatureRowView(
                    region: region,
                    isSelected: viewModel.selectedRegion?.id == region.id
                ) {
                    viewModel.selectedRegion = region
                }
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

struct TemperatureRowView: View {
    let region: RegionTemperature
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Text(region.name)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(region.temperature)℃")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(region.temperatureCategory.gradient)
                .cornerRadius(20)
                .frame(width: 100)
            
            Text(region.statusText)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(region.temperatureCategory.color)
                .cornerRadius(15)
                .frame(width: 80)
            
            Text(region.feelsLike)
                .font(.body)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(isSelected ? Color.green.opacity(0.1) : Color.white)
        .overlay(
            Rectangle()
                .fill(isSelected ? Color.green : Color.clear)
                .frame(width: 4),
            alignment: .leading
        )
        .onTapGesture(perform: onTap)
    }
}
