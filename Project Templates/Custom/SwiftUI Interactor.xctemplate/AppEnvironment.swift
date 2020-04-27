//___FILEHEADER___

import Foundation

struct AppEnvironment {
    let container: DIContainer
    let systemEventsHandler: SystemEventsHandler
}

extension AppEnvironment {

    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let interactors = configuredInteractors(appState: appState)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        let systemEventsHandler = RealSystemEventsHandler(appState: appState)
        return AppEnvironment(container: diContainer, systemEventsHandler: systemEventsHandler)
    }

    // Configure the interactors for the application.
    private static func configuredInteractors(appState: Store<AppState>) -> DIContainer.Interactors {

        let interactor = RealInteractor(appState: appState)

        return .init(interactor: interactor)
    }
}
