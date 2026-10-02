//
//  AppIconOption.swift
//  SettingsFeature
//

#if os(iOS)
enum AppIconOption: CaseIterable, Identifiable {
    case standard, dojang, deepTeal, midnight, celadon, persimmon

    var id: Self { self }

    var alternateName: String? {
        self == .standard ? nil : previewName
    }

    var previewName: String {
        switch self {
        case .standard: "DefaultIcon"
        case .dojang: "Dojang"
        case .deepTeal: "DeepTeal"
        case .midnight: "Midnight"
        case .celadon: "Celadon"
        case .persimmon: "Persimmon"
        }
    }

    var displayName: String {
        switch self {
        case .standard: "Default"
        case .dojang: "Dojang"
        case .deepTeal: "Deep Teal"
        case .midnight: "Midnight"
        case .celadon: "Celadon"
        case .persimmon: "Persimmon"
        }
    }

    init(alternateName: String?) {
        self = Self.allCases.first { $0.alternateName == alternateName } ?? .standard
    }
}
#endif
