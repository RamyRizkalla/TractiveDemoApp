// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum PetChooser {
    /// Localizable.strings
    ///   Tractive Demo App
    /// 
    ///   Created by Ramy Rizkalla on 19/07/2024.
    internal static let title = L10n.tr("Localizable", "pet_chooser.title", fallback: "Get a sneak peek")
    internal enum Subtitle {
      /// We'd love to show you what to expect once you get one.
      internal static let expectation = L10n.tr("Localizable", "pet_chooser.subtitle.expectation", fallback: "We'd love to show you what to expect once you get one.")
      /// But first, tell us - are you a cat or dog parent?
      internal static let question = L10n.tr("Localizable", "pet_chooser.subtitle.question", fallback: "But first, tell us - are you a cat or dog parent?")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
