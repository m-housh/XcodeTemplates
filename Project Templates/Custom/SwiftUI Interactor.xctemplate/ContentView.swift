//___FILEHEADER___

import SwiftUI

struct ContentView: View {

    private let container: DIContainer

    init(container: DIContainer) {
        self.container = container
    }

    var body: some View {
        Group {
            content
                .inject(container)
        }
    }

    // Add your actual content here.
    private var content: some View {
        Text("Hello, world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .preview)
    }
}
