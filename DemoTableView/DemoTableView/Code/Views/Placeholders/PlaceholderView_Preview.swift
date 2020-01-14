//
//  PlaceholderView_Preview.swift
//  DemoTableView
//
//  Created by David Bonnet on 14/01/2020.
//  Copyright © 2020 Harpp. All rights reserved.
//

import Foundation

#if canImport(SwiftUI) && DEBUG

import SwiftUI

@available(iOS 13, *)
final class PlaceholderViewPreview: PreviewProvider {

  static var previews: some View {
    Group {
      UIViewPreview {
        PlaceholderView.placeholder(from:
          PlaceholderView.State(
            emotion: "🎉",
            title: "It's working!",
            details: "Can you believe it?"
          )
        )
      }
      UIViewPreview {
        PlaceholderView.placeholder(from:
          PlaceholderView.State(
            emotion: "👻",
            title: "And in dark mode",
            details: "Its out of the box right?"
          )
        )
      }.environment(\.colorScheme, .dark)
      UIViewPreview {
        PlaceholderView.placeholder(from:
          PlaceholderView.State(
            emotion: "💟",
            title: "Testing dynamic types",
            details: "All users inclusive!"
          )
        )
      }.environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
      .previewDisplayName("Accessibility ExtraExtraExtraLarge")
    }.previewLayout(.sizeThatFits)
  }
}

#endif
