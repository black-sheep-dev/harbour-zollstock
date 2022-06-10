import QtQuick 2.0
import Sailfish.Silica 1.0

import "../components"
import "../."

Dialog {
    id: dialog

    allowedOrientations: Orientation.Portrait

    acceptDestination: Qt.resolvedUrl("TutorialMeasurementToolsResetPage.qml")

    Column {
        id: column
        width:parent.width
        spacing: Theme.paddingLarge

        DialogHeader {
            //% "Measurement tools"
            title: qsTrId("id-mesurement-tools")
            //% "Next"
            acceptText: qsTrId("id-next")
        }

        Label {
            x: Theme.horizontalPageMargin
            width: parent.width - 2*x
            color: Theme.highlightColor
            wrapMode: Text.Wrap
            //% "You can move the measurement tools by dragging them with your finger."
            text: qsTrId("id-mesurement-tools-desc4")
        }

        Label {
            x: Theme.horizontalPageMargin
            width: parent.width - 2*x
            color: Theme.highlightColor
            wrapMode: Text.Wrap
            //% "The position (P) on the scale is shown on left side."
            text: qsTrId("id-mesurement-tools-desc2")
        }

        Label {
            x: Theme.horizontalPageMargin
            width: parent.width - 2*x
            color: Theme.highlightColor
            wrapMode: Text.Wrap
            //% "The second one also shows the length (L) between the two tools."
            text: qsTrId("id-mesurement-tools-desc3")
        }

        Item {
            width: 1
            height: Theme.paddingLarge
        }

        Item {
            id: zollstockSample
            width: parent.width
            height: Helper.millimeterToPixel(60)

            PositionIndicatorItem {
                id: firstIndicator
                dragable: false
                position: 5
            }

            PositionIndicatorItem {
                id: secondIndicator
                dragable: false
                position: 20
                length: secondIndicator.tutorialPos - firstIndicator.position
                tutorial: true

                Image {
                    x: parent.width * 0.4
                    y: -parent.height * 0.8
                    width: parent.width
                    height: parent.width
                    source: "/usr/share/harbour-zollstock/images/tutorial-gesture-thumb.svg"
                }

                Behavior on y {
                    NumberAnimation {
                        duration: 1000
                    }
                }

                Timer {
                    property bool down: true

                    interval: 3000
                    repeat: true
                    running: status === PageStatus.Active
                    triggeredOnStart: true

                    onTriggered: {
                        secondIndicator.position = down ?  50 : 20
                        down = !down
                    }

                }
            }

            ScaleItem {
                length: 60
            }
        }
    }

}
