//___FILEHEADER___

import SwiftUI

struct LoadableView<Value, Content>: View where Content: View {

    @Binding var loadable: Loadable<Value>
    let load: () -> ()
    let builder: (Value) -> Content

    init(
        _ loadable: Binding<Loadable<Value>>,
        load callback: @escaping () -> (),
        @ViewBuilder builder: @escaping (Value) -> Content
    ) {
        self.load = callback
        self.builder = builder
        self._loadable = loadable
    }

    var body: some View {
        content
    }

    private var content: AnyView {
        switch loadable {
        case .notRequested:
            return AnyView(notLoadedView)
        case let .isLoading(last, _):
            return AnyView(isLoadingView(last))
        case let .loaded(value):
            return AnyView(loadedView(value))
        case let .failed(error):
            return AnyView(failedView(error))
        }
    }
}

private extension LoadableView {

    var notLoadedView: some View {
        Text("")
            .onAppear() { self.load() }
    }

    func isLoadingView(_ previous: Value?) -> some View {
        VStack {
            ActivityIndicatorView()
            previous.map {
                loadedView($0)
            }
        }
    }

    func loadedView(_ value: Value) -> Content {
        builder(value)
    }

    func failedView(_ error: Error) -> some View {
        ErrorView(error: error, retryAction: { self.load() })
    }
}
