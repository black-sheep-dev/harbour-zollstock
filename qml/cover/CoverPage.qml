import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Image {
        anchors.top: parent.top
        width: parent.width
        height: sourceSize.height * width / sourceSize.width
        smooth: true
        source: "/usr/share/harbour-zollstock/images/cover-background.svg"
        opacity: 0.1
    }
    Label {
        anchors {
            top: parent.top
            topMargin: Theme.paddingLarge
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: Theme.fontSizeLarge

        //% "Zollstock"
        text: qsTrId("id-app-name")
    }
}
