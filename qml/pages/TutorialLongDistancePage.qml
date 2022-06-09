import QtQuick 2.0
import Sailfish.Silica 1.0

import "../components"
import "../."

Dialog {
    id: dialog

    allowedOrientations: Orientation.Portrait

    acceptDestination: Qt.resolvedUrl("MainPage.qml")
    acceptDestinationAction: PageStackAction.Replace
    acceptDestinationReplaceTarget: null

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width:parent.width
            spacing: Theme.paddingLarge

            DialogHeader {
                //% "Measure long distance"
                title: qsTrId("id-measure-long-distance")

                //% "Finish"
                acceptText: qsTrId("id-finish")
                //% "Previous"
                cancelText: qsTrId("id-previous")
            }

            Label {
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.highlightColor
                wrapMode: Text.Wrap
                //% "It is also possible to measure distances longer than the display size."
                text: qsTrId("id-long-distance-desc1")
            }
            Label {
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.highlightColor
                wrapMode: Text.Wrap
                //% "Move the second tool to the end of the display and mark its position on the measurement object."
                text: qsTrId("id-long-distance-desc2")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                sourceSize.width: parent.width * 0.8
                fillMode: Image.PreserveAspectFit
                source: "/usr/share/harbour-zollstock/images/phone-pos-a.svg"
            }

            Label {
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.highlightColor
                wrapMode: Text.Wrap
                //% "Then scroll the scale until the second tool is on the opposit side of the display."
                text: qsTrId("id-long-distance-desc3")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                sourceSize.width: parent.width * 0.8
                fillMode: Image.PreserveAspectFit
                source: "/usr/share/harbour-zollstock/images/phone-pos-b.svg"
            }

            Label {
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.highlightColor
                wrapMode: Text.Wrap
                //% "Move your device until the position of the tool fits the mark on the object."
                text: qsTrId("id-long-distance-desc4")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                sourceSize.width: parent.width * 0.8
                fillMode: Image.PreserveAspectFit
                source: "/usr/share/harbour-zollstock/images/phone-pos-c.svg"
            }

            Label {
                x: Theme.horizontalPageMargin
                width: parent.width - 2*x
                color: Theme.highlightColor
                wrapMode: Text.Wrap
                //% "Proceed with the same steps until you reached the end of the object."
                text: qsTrId("id-long-distance-desc5")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                sourceSize.width: parent.width * 0.8
                fillMode: Image.PreserveAspectFit
                source: "/usr/share/harbour-zollstock/images/phone-pos-d.svg"
            }

            Item {
                width: 1
                height: Theme.paddingLarge
            }
        }

        VerticalScrollDecorator {}
    }
}
