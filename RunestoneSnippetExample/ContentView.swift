import Runestone
import RunestoneJavaScriptLanguage
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var themeSetting = ThemeSetting.allCases.first!
    @State private var attributedString: NSAttributedString?
    @State private var kern: CGFloat = 0.3
    @State private var lineHeightMultiplier: CGFloat = 1.2
    @State private var tabLength: Int = 2

    var body: some View {
        VStack {
            Spacer()
            if let attributedString {
                SnippetView(
                    attributedString: attributedString,
                    backgroundColor: Color(uiColor: themeSetting.theme.backgroundColor)
                )
                .padding()
            }
            Spacer()
            List {
                Picker(selection: $themeSetting) {
                    ForEach(ThemeSetting.allCases) { themeSetting in
                        Text(themeSetting.title)
                    }
                } label: {
                    Text("Theme")
                }
                HStack {
                    Text("Line Height")
                    Spacer()
                    Text(lineHeightMultiplier, format: .percent)
                        .foregroundStyle(.secondary)
                    Stepper("Line Height",
                            value: $lineHeightMultiplier,
                            in: 1 ... 2,
                            step: 0.1
                    )
                    .labelsHidden()
                }
                HStack {
                    Text("Letter Spacing")
                    Spacer()
                    Text(kern, format: .number.precision(.fractionLength(1)))
                        .foregroundStyle(.secondary)
                    Stepper("Letter Spacing", value: $kern, in: 0 ... 1, step: 0.1)
                        .labelsHidden()
                }
                HStack {
                    Text("Tab Length")
                    Spacer()
                    Text(tabLength, format: .number)
                        .foregroundStyle(.secondary)
                    Stepper("Tab Length",
                            value: $tabLength,
                            in: 2 ... 10,
                            step: 2
                    )
                    .labelsHidden()
                }
            }
            .clipShape(UnevenRoundedRectangle(
                cornerRadii: RectangleCornerRadii(topLeading: 20, topTrailing: 20))
            )
            .ignoresSafeArea()
            .shadow(radius: 10)
            .frame(height: 250)
        }
        .background {
            Color(.systemGroupedBackground)
                .opacity(0.7)
                .ignoresSafeArea()
        }
        .onChange(of: themeSetting) { _, _ in
            syntaxHighlightString()
        }
        .onChange(of: lineHeightMultiplier) { _, _ in
            syntaxHighlightString()
        }
        .onChange(of: kern) { _, _ in
            syntaxHighlightString()
        }
        .onChange(of: tabLength) { _, _ in
            syntaxHighlightString()
        }
        .onAppear {
            syntaxHighlightString()
        }
    }
}

private extension ContentView {
    private func syntaxHighlightString() {
        let string = """
function fibonacci(num) {
\tif (num <= 1) {
\t\treturn 1
\t}
\treturn fibonacci(num - 1) + fibonacci(num - 2)
}
"""
        let syntaxHighlighter = StringSyntaxHighlighter(
            theme: themeSetting.theme,
            language: .javaScript
        )
        syntaxHighlighter.kern = kern
        syntaxHighlighter.lineHeightMultiplier = lineHeightMultiplier
        syntaxHighlighter.tabLength = tabLength
        attributedString = syntaxHighlighter.syntaxHighlight(string)
    }
}

#Preview {
    ContentView()
}
