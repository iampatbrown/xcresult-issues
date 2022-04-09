// Copyright 2022 Itty Bitty Apps Pty Ltd. See LICENSE file.

@testable import XcresultIssues
import XCTest

final class XcresultIssuesTests: XCTestCase {
  func testBasic() {
    let diagnostic = Diagnostic(
      message: "This is a warning!",
      location: .init(
        path: "path",
        range: .init(start: .init(line: 1, column: 1), end: .init(line: 1, column: 42))
      ),
      severity: .warning
    )
    XCTAssertEqual(diagnostic.formatted(.githubActions()), "::warning file=path,line=1,col=1::This is a warning!")
  }
}
