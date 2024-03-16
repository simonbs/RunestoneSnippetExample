import SwiftUI
import UIKit

// We use UILabel and NSAttributedString to show the syntax highlighted text instead of Text and
// AttributedString, as the latter does not support all the attributes that the former supports.
struct UIKitLabel: UIViewRepresentable {
    let attributedString: NSAttributedString

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = attributedString
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UIKitLabel(
        attributedString: NSAttributedString(
        """
function fibonacci(num) {
  if (num <= 1) {
    return 1
  }
  return fibonacci(num - 1) + fibonacci(num - 2)
}
"""
        )
    )
}
