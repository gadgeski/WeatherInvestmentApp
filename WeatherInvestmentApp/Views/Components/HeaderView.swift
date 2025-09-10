//
//  HeaderView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("🌡️")
                    .font(.largeTitle)
                Text("日本の気温マップ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            Text("地方別気温情報一覧")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.9))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(
            LinearGradient(colors: [Color.green, Color.green.opacity(0.8)],
                         startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}
