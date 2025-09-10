//
//  TemperatureDashboardView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

// MARK: - Main View
struct TemperatureDashboardView: View {
    @StateObject private var viewModel = TemperatureViewModel()
    
    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                // Left Panel - Table and Controls
                VStack(spacing: 0) {
                    HeaderView()
                    mainContentView
                }
                .frame(maxWidth: .infinity)
                
                // Right Panel - Detail Info
                if UIScreen.main.bounds.width > 768 {
                    detailPanelView
                        .frame(width: 400)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var mainContentView: some View {
        ScrollView {
            VStack(spacing: 20) {
                SummaryStatsView(viewModel: viewModel)
                LegendView()
                TemperatureTableView(viewModel: viewModel)
                ControlsView(viewModel: viewModel)
                TimestampView(lastUpdate: viewModel.lastUpdate)
            }
            .padding()
        }
        .background(Color(.systemGray6))
    }
    
    @ViewBuilder
    private var detailPanelView: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let selectedRegion = viewModel.selectedRegion {
                RegionDetailView(region: selectedRegion)
            } else {
                DefaultDetailView()
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.systemGray6))
    }
}

// MARK: - Preview
struct TemperatureDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureDashboardView()
            .previewDevice("iPad Pro 13 (13-inch) (M4)")
            .previewDisplayName("iPad Pro 13")
        
        TemperatureDashboardView()
            .previewDevice("iPhone 15 Pro")
            .previewDisplayName("iPhone 15 Pro")

        TemperatureDashboardView()
            .previewDevice("iPhone 16e")
            .previewDisplayName("iPhone 16e")
    }
}
