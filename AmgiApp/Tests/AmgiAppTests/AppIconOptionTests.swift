#if os(iOS)
import Foundation
import Testing
@testable import SettingsFeature

@Suite struct AppIconOptionTests {
    @Test func everyAlternateIsRegisteredInTheBuiltApp() throws {
        let icons = try #require(Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any])
        let alternates = try #require(icons["CFBundleAlternateIcons"] as? [String: Any])
        #expect(Set(alternates.keys) == Set(AppIconOption.allCases.compactMap(\.alternateName)))
    }

    @Test func roundTripsThroughTheSystemName() {
        for option in AppIconOption.allCases {
            #expect(AppIconOption(alternateName: option.alternateName) == option)
        }
    }

    @Test func unknownSystemNameFallsBackToDefault() {
        #expect(AppIconOption(alternateName: "Retired") == .standard)
    }
}
#endif
