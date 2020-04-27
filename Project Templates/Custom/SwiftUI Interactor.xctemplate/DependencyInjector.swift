//___FILEHEADER___

import SwiftUI
import Combine

// MARK: - DIContainer
struct DIContainer: EnvironmentKey {

    let appState: Store<AppState>
    let interactors: Interactors

    static var defaultValue: Self { Self.default }

    private static let `default` = Self(appState: .init(AppState()),
                                        interactors: .stub)
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

// MARK: - Injection in the view hierarchy
extension View {

    func inject(_ appState: AppState,
                _ interactors: DIContainer.Interactors) -> some View {
        let container = DIContainer(appState: .init(appState),
                                    interactors: interactors)
        return inject(container)
    }

    func inject(_ container: DIContainer) -> some View {
        return self
            .modifier(RootViewAppearance())
            .environment(\.injected, container)
    }
}

#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(appState: .init(AppState.preview), interactors: .stub)
    }
}
#endif
