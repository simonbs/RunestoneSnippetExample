import RunestoneOneDarkTheme
import RunestonePlainTextTheme
import RunestoneThemeCommon
import RunestoneTomorrowNightTheme
import RunestoneTomorrowTheme

enum ThemeSetting: CaseIterable, Identifiable {
    case oneDark
    case plainText
    case tomorrowNight
    case tomorrow

    var id: Self {
        self
    }

    var title: String {
        switch self {
        case .oneDark:
            "One Dark"
        case .plainText:
            "Plain Text"
        case .tomorrowNight:
            "Tomorrow Night"
        case .tomorrow:
            "Tomorrow"
        }
    }

    var theme: EditorTheme {
        switch self {
        case .oneDark:
            OneDarkTheme()
        case .plainText:
            PlainTextTheme()
        case .tomorrowNight:
            TomorrowNightTheme()
        case .tomorrow:
            TomorrowTheme()
        }
    }
}
