import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

import "pages"

ApplicationWindow {
    id: app

    ConfigurationGroup {
        id: settings
        path: "/apps/harbour-zollstock"
        synchronous: true

        property int maximumLength: 2000
    }

    initialPage: Component { MainPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
