//
//  RegionDetailView.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI

struct RegionDetailView: View {
    let region: RegionTemperature
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(region.emoji)
                    .font(.title)
                Text("\(region.name)地方")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                DetailInfoRow(icon: "🌡️", title: "現在の最高気温",
                            value: "\(region.temperature)℃",
                            valueColor: region.temperatureCategory.color)
                
                DetailInfoRow(icon: "☀️", title: "今日の天気", value: region.randomComment)
                DetailInfoRow(icon: "👕", title: "服装の推奨", value: region.recommendation)
                DetailInfoRow(icon: "🤗", title: "体感", value: region.feelsLike)
                DetailInfoRow(icon: "📊", title: "温度区分", value: region.statusText)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 3)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("💡")
                    Text("アドバイス")
                        .fontWeight(.semibold)
                }
                
                Text(region.healthAdvice)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(15)
            .overlay(
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 4),
                alignment: .leading
            )
        }
    }
}

struct DetailInfoRow: View {
    let icon: String
    let title: String
    let value: String
    var valueColor: Color = .primary
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(icon)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                
                Text(value)
                    .fontWeight(.semibold)
                    .foregroundColor(valueColor)
            }
            
            Spacer()
        }
    }
}

struct DefaultDetailView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("👈 地方をクリックしてください")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("各地方の詳細情報を表示します。")
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("使い方:")
                    .fontWeight(.semibold)
                Text("• テーブルの行をクリックして詳細表示")
                Text("• 気温更新ボタンで最新情報に更新")
                Text("• ソートボタンで並び替え")
            }
            .font(.body)
            .foregroundColor(.secondary)
        }
    }
}
