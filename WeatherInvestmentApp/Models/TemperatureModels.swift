//
//  TemperatureModels.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI
import Foundation

// MARK: - データモデル
struct RegionTemperature: Identifiable {
    let id = UUID()
    let name: String
    var temperature: Int
    let comments: [String]
    
    var temperatureCategory: TemperatureCategory {
        switch temperature {
        case ...20: return .cool
        case 21...28: return .warm
        case 29...35: return .hot
        default: return .veryHot
        }
    }
    
    var statusText: String {
        switch temperatureCategory {
        case .cool: return "涼しい"
        case .warm: return "暖かい"
        case .hot: return "暑い"
        case .veryHot: return "猛暑"
        }
    }
    
    var feelsLike: String {
        switch temperatureCategory {
        case .cool: return "涼しく感じます"
        case .warm: return "快適に感じます"
        case .hot: return "暑く感じます"
        case .veryHot: return "非常に暑く感じます"
        }
    }
    
    var recommendation: String {
        switch temperatureCategory {
        case .cool: return "長袖がおすすめです"
        case .warm: return "半袖で快適に過ごせます"
        case .hot: return "水分補給をこまめに行いましょう"
        case .veryHot: return "外出時は十分な熱中症対策を"
        }
    }
    
    var healthAdvice: String {
        switch temperatureCategory {
        case .cool: return "涼しい気候です。軽い運動や散歩に適しています。"
        case .warm: return "過ごしやすい気温です。屋外活動に最適な時期です。"
        case .hot: return "暑い日です。こまめな水分補給と適度な休憩を心がけましょう。"
        case .veryHot: return "猛暑日です。外出は控えめに、エアコンを適切に使用し、熱中症対策を万全にしてください。"
        }
    }
    
    var emoji: String {
        switch temperatureCategory {
        case .cool: return "🔵"
        case .warm: return "🟡"
        case .hot: return "🔴"
        case .veryHot: return "🟣"
        }
    }
    
    var randomComment: String {
        comments.randomElement() ?? "天気情報なし"
    }
}

enum TemperatureCategory {
    case cool, warm, hot, veryHot
    
    var color: Color {
        switch self {
        case .cool: return Color.blue
        case .warm: return Color.orange
        case .hot: return Color.red
        case .veryHot: return Color.purple
        }
    }
    
    var gradient: LinearGradient {
        switch self {
        case .cool:
            return LinearGradient(colors: [Color.blue.opacity(0.7), Color.blue],
                                startPoint: .topLeading, endPoint: .bottomTrailing)
        case .warm:
            return LinearGradient(colors: [Color.orange.opacity(0.7), Color.orange],
                                startPoint: .topLeading, endPoint: .bottomTrailing)
        case .hot:
            return LinearGradient(colors: [Color.red.opacity(0.7), Color.red],
                                startPoint: .topLeading, endPoint: .bottomTrailing)
        case .veryHot:
            return LinearGradient(colors: [Color.purple.opacity(0.7), Color.purple],
                                startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}
