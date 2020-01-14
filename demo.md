Present the project structure, build & run as empty.

Show that it's an iOS 11 project

Create `PlaceholderView_Preview.swift`
```
PlaceholderView_Preview
```

Creates a class that conforms to `PreviewProvider` protocol from Apple to allow previews
```
final class PlaceholderViewPreview: PreviewProvider {

  //previews here
}
```

You'll need to import `SwiftUI` for `PreviewProvider` to exists
```
import SwiftUI
```

And then some preview content to conform to the protocol, let's put some Text for now.
```
static var previews: some View {
    Text("Hello")
  }
```

Obviously we have some iOS 13 only code here so let's escape this
```
@available(iOS 13, *)
```

Show the canvas and then add those extras for retro-compatibility
```
#if canImport(SwiftUI) && DEBUG
```

```
#endif
```

If you want to bypass the device preview and see only your view you can add this
```
.previewLayout(.sizeThatFits)
```

If you want to see your view in several conditions then use a `Group`
```
Group {
      Text("Hello")
      Text("Hello").bold()
      Text("Hello").font(.largeTitle).bold()
    }.previewLayout(.sizeThatFits)
```

But enough playing, I promise to help you using this tool to work on your views.

Let's create some helpers

```
UIViewPreview
```

```
import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {

  let view: View

  init(_ builder: @escaping () -> View) {
    view = builder()
  }

  // MARK: - UIViewRepresentable

  func makeUIView(context: Context) -> UIView {
    return view
  }

  func updateUIView(_ view: UIView, context: Context) {
    view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    view.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
}
#endif
```

We can now go back to our demo and replace the text by the actual placeholder view
```
UIViewPreview {
        PlaceholderView.loadFromNib()
      }
```

Having such a playground could lead you to add some convenience methods
```
extension PlaceholderView {

  static func placeholder(from state: State) -> PlaceholderView {
    let placeholder = PlaceholderView.loadFromNib()
    placeholder.state = state
    return placeholder
  }

}
```

For being able to do that
```
PlaceholderView.placeholder(from:
          PlaceholderView.State(
            emotion: "🎉",
            title: "It's working!",
            details: "Can you believe it?"
          )
        )
```

You can then add modifiers to test environements like dark mode
```
UIViewPreview {
        PlaceholderView.placeholder(from:
          PlaceholderView.State(
            emotion: "👻",
            title: "And in dark mode",
            details: "Its out of the box right?"
          )
        )
      }.environment(\.colorScheme, .dark)
```

You may need to rework your design a litte
```
override func awakeFromNib() {
    super.awakeFromNib()
    if #available(iOS 13.0, *) {
      backgroundColor = UIColor.systemBackground
    } else {
      backgroundColor = UIColor.white
    }
  }
```

Testing dynamic types
```
UIViewPreview {
        PlaceholderView.placeholder(from:
          PlaceholderView.State(
            emotion: "💟",
            title: "Testing dynamic types",
            details: "All users inclusive!"
          )
        )
      }.environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
```

You can even add a display name to organize your renderings
```
.previewDisplayName("Accessibility ExtraExtraExtraLarge")
```

To exclude your preview files from release builds just add this build setting
```
EXCLUDED_SOURCE_FILE_NAMES = "*_Preview*"
```