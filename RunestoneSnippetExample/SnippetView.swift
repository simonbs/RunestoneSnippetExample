import SwiftUI

struct SnippetView: View {
    let attributedString: NSAttributedString
    let backgroundColor: Color

    var body: some View {
        ScrollView(.horizontal) {
            UIKitLabel(attributedString: attributedString)
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .scrollIndicators(.hidden)
        .background(backgroundColor)
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
        .shadow(radius: 10)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        SnippetView(
            attributedString: NSAttributedString(
                """
function fibonacci(num) {
  if (num <= 1) {
    return 1
  }
  return fibonacci(num - 1) + fibonacci(num - 2)
}
"""
            ),
            backgroundColor: .white
        )
    }
    .frame(width: 300)
    .padding(15)
    .background(.gray)
}
