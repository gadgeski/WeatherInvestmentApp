//
//  TemperatureViewModel.swift
//  WeatherInvestmentApp
//
//  Created by Dev Tech on 2025/09/06.
//

import SwiftUI
import Foundation

// MARK: - ViewModel
class TemperatureViewModel: ObservableObject {
    @Published var regions: [RegionTemperature] = []
    @Published var selectedRegion: RegionTemperature?
    @Published var lastUpdate: Date = Date()
    @Published var sortOrder: SortOrder = .region
    
    enum SortOrder {
        case region, temperature
    }
    
    private let initialData: [String: (temps: [Int], comments: [String])] = [
        "北海道": (temps: [18, 22, 24, 26, 20], comments: ["涼しく過ごしやすい", "散歩日和", "軽装で快適", "外出に最適", "涼しい一日"]),
        "東北": (temps: [25, 27, 29, 24, 26], comments: ["適度な暖かさ", "外出に最適", "少し暑め", "過ごしやすい", "快適な気温"]),
        "関東": (temps: [32, 34, 30, 33, 31], comments: ["暑い一日", "熱中症注意", "適度な暑さ", "暑さ対策必須", "日陰を選んで"]),
        "中部": (temps: [30, 28, 32, 29, 31], comments: ["暑い", "比較的過ごしやすい", "暑さ注意", "適度な暑さ", "日中は暑い"]),
        "関西": (temps: [33, 35, 31, 34, 32], comments: ["暑い一日", "猛暑注意", "暑さ対策を", "非常に暑い", "日中は暑い"]),
        "中国": (temps: [31, 29, 33, 30, 32], comments: ["暑い", "適度な暑さ", "暑さ注意", "暑い一日", "日中は暑い"]),
        "四国": (temps: [32, 30, 34, 31, 33], comments: ["暑い一日", "暑さ対策を", "非常に暑い", "暑い", "暑さ注意"]),
        "九州": (temps: [34, 36, 32, 35, 33], comments: ["暑い一日", "猛暑注意", "暑さ対策を", "非常に暑い", "暑さ注意"]),
        "沖縄": (temps: [36, 38, 34, 37, 35], comments: ["猛暑", "危険な暑さ", "非常に暑い", "猛暑注意", "非常に暑い"])
    ]
    
    init() {
        loadInitialData()
    }
    
    private func loadInitialData() {
        regions = initialData.map { (name, data) in
            RegionTemperature(
                name: name,
                temperature: data.temps.randomElement() ?? 25,
                comments: data.comments
            )
        }
        sortRegions()
    }
    
    func updateTemperatures() {
        for i in regions.indices {
            let regionData = initialData[regions[i].name]!
            regions[i].temperature = regionData.temps.randomElement() ?? 25
        }
        lastUpdate = Date()
        sortRegions()
    }
    
    func sortByTemperature() {
        sortOrder = .temperature
        sortRegions()
    }
    
    func sortByRegion() {
        sortOrder = .region
        sortRegions()
    }
    
    private func sortRegions() {
        switch sortOrder {
        case .region:
            let order = ["北海道", "東北", "関東", "中部", "関西", "中国", "四国", "九州", "沖縄"]
            regions.sort { order.firstIndex(of: $0.name) ?? 0 < order.firstIndex(of: $1.name) ?? 0 }
        case .temperature:
            regions.sort { $0.temperature > $1.temperature }
        }
    }
    
    var averageTemperature: Int {
        guard !regions.isEmpty else { return 0 }
        return regions.reduce(0) { $0 + $1.temperature } / regions.count
    }
    
    var maxTemperature: Int {
        regions.max(by: { $0.temperature < $1.temperature })?.temperature ?? 0
    }
    
    var minTemperature: Int {
        regions.min(by: { $0.temperature < $1.temperature })?.temperature ?? 0
    }
    
    var hotRegionsCount: Int {
        regions.filter { $0.temperature > 35 }.count
    }
}
