//
//  Listing_Preview.swift
//  DemoTableView
//
//  Created by David Bonnet on 14/01/2020.
//  Copyright © 2020 Harpp. All rights reserved.
//

import Foundation

#if canImport(SwiftUI) && DEBUG

import SwiftUI

@available(iOS 13, *)
final class ListingPreview: PreviewProvider {

  enum PreviewError: Swift.Error {
    case someRandomError
  }

  static var previews: some View {
    Group {
      UIViewControllerPreview {
        ListingViewController()
      }
      UIViewControllerPreview {
        ListingViewController()
      }.environment(\.sizeCategory, .extraExtraExtraLarge)
        .previewDevice("iPhone SE")
      UIViewControllerPreview {
        ListingViewController()
      }.environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
      .previewDevice("iPad Pro (11-inch)")
    }
  }
}

#endif
