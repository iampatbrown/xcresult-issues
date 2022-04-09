// Copyright 2022 Itty Bitty Apps Pty Ltd. See LICENSE file.

// NB: Stubbing this for now as it's not supported on linux
protocol FormatStyle: Decodable, Encodable, Hashable {
  associatedtype FormatInput
  associatedtype FormatOutput
  func format(_ value: Self.FormatInput) -> Self.FormatOutput
}

extension Diagnostic {
  func formatted<F>(_ format: F) -> F.FormatOutput where F: FormatStyle, F.FormatInput == Self {
    format.format(self)
  }
}
