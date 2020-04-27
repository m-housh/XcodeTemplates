//___FILEHEADER___

import UIKit
import Combine

protocol SystemEventsHandler {
    func sceneOpenURLContexts(_ urlContexts: Set<UIOpenURLContext>)
    func sceneDidBecomeActive()
    func sceneWillResignActive()
}

struct RealSystemEventsHandler: SystemEventsHandler {

    let appState: Store<AppState>
    private var subscriptions = Set<AnyCancellable>()

    init(appState: Store<AppState>) {
        self.appState = appState
        NotificationCenter.default.keyboardHeightPublisher
            .sink { [appState] height in
                appState[\.system.keyboardHeight] = height
            }
            .store(in: &subscriptions)
    }

    func sceneOpenURLContexts(_ urlContexts: Set<UIOpenURLContext>) {
        guard let url = urlContexts.first?.url else { return }
        handle(url: url)
    }

    func handle(url: URL) {
        guard let deelLink = parseDeepLink(url: url) else { return }
        switch deelLink {
        case .showFamily(_):
            appState.bulkUpdate { appState in
                // Example update
                //$0.routing.equipmentFamilyList.equipmentDetails = family
            }
        }
    }

    func sceneDidBecomeActive() {
        appState[\.system.isActive] = true
    }

    func sceneWillResignActive() {
        appState[\.system.isActive] = false
    }
}

// MARK: - Notifications
private extension NotificationCenter {
    var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        let willShow = publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        let willHide = publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        return Publishers.Merge(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

private extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
            .cgRectValue.height ?? 0
    }
}

// MARK: - Deep Links
private extension RealSystemEventsHandler {

    // Add your deep link cases here.
    enum DeepLink {

        /// Example
        case showFamily(family: String)
    }

    func parseDeepLink(url: URL) -> DeepLink? {
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
            components.host == "www.example.com",
            let query = components.queryItems
            else { return nil }
        if let item = query.first(where: { $0.name == "details" }),
            let family = item.value {
                return .showFamily(family: family)
        }
        return nil
    }
}
