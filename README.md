# RunestoneSnippetExample

The app showcases the StringSyntaxHighlighter in [Runestone](https://github.com/simonbs/runestone), my open-source plain text editor for iOS, iPadOS, and visionOS.

<img src="screen-recording.gif" />

The StringSyntaxHighlighter can be used to syntax highlight a string without needing to create a TextView.

```swift
let syntaxHighlighter = StringSyntaxHighlighter(
    theme: TomorrowTheme(),
    language: .javaScript
)
let attributedString = syntaxHighlighter.syntaxHighlight(
  """
  function fibonacci(num) {
    if (num <= 1) {
      return 1
    }
    return fibonacci(num - 1) + fibonacci(num - 2)
  }
  """
)
```
