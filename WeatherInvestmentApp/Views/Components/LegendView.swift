//
//  LegendView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

struct LegendView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("🌡️")
                Text("温度区分")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 8) {
                LegendItemView(color: TemperatureCategory.cool.color, text: "涼しい (20℃以下)")
                LegendItemView(color: TemperatureCategory.warm.color, text: "暖かい (21-28℃)")
                LegendItemView(color: TemperatureCategory.hot.color, text: "暑い (29-35℃)")
                LegendItemView(color: TemperatureCategory.veryHot.color, text: "非常に暑い (36℃以上)")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

struct LegendItemView: View {
    let color: Color
    let text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(color)
                .frame(width: 16, height: 16)
            
            Text(text)
                .font(.caption)
                .foregroundColor(.primary)
            
            Spacer()
        }
    }
}
