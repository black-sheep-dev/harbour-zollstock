import QtQuick 2.0
import Sailfish.Silica 1.0

import "../components"
import "../."

Dialog {
    id: dialog

    allowedOrientations: Orientation.Portrait

    acceptDestination: Qt.resolvedUrl("TutorialLongDistancePage.qml")

    Column {
        id: column
        width:parent.width
        spacing: Theme.paddingLarge

        DialogHeader {
            //% "Reset measurement tools"
            title: qsTrId("id-reset-mesurement-tools")
            //% "Next"
            acceptText: qsTrId("id-next")
            //% "Previous"
            cancelText: qsTrId("id-previous")
        }

        Label {
            x: Theme.horizontalPageMargin
            width: parent.width - 2*x
            color: Theme.highlightColor
            wrapMode: Text.Wrap
            //% "You can reset the measurement tool by double-tapping it."
            text: qsTrId("id-reset-measurement-tools-desc1")
        }

        Label {
            x: Theme.horizontalPageMargin
            width: parent.width - 2*x
            color: Theme.highlightColor
            wrapMode: Text.Wrap
            //% "In the case of the first, this is reset to zero, in the case of the second, both are reset to their starting values."
            text: qsTrId("id-reset-measurement-tools-desc2")
        }

        Item {
            width: 1
            height: Theme.itemSizeMedium
        }

        Item {
            width: parent.width
            height: Helper.millimeterToPixel(60)

            PositionIndicatorItem {
                id: resetIndicator
                dragable: false
                tutorial: true
                position: 30
            }

            ScaleItem {
                length: 60
            }

            Image {
                x: parent.width * 0.45
                y: Helper.millimeterToPixel(18)
                width: parent.width
                height: parent.width
                source: "/usr/share/harbour-zollstock/images/tutorial-gesture-thumb.svg"
                scale: 1.1

                Behavior on scale {
                    NumberAnimation {
                        duration: 100
                        easing.type: Easing.InOutQuad
                    }
                }

                Timer {
                    id: doubleClickTimer
                    property bool pulse: true
                    property int counter: 0

                    interval: 150
                    repeat: true
                    running: status === PageStatus.Active
                    triggeredOnStart: true

                    onTriggered: {
                        if (counter === 4) {
                            resetIndicator.position = 30
                            counter++
                            return

                        } else if (counter > 4) {
                            interval = 150
                            counter = 0
                            return
                        }

                        counter++

                        parent.scale = pulse ? 1.0 : 1.1
                        pulse = !pulse

                        if (counter >= 4) {
                            interval = 2000
                            resetIndicator.position = 0
                        }
                    }
                }
            }

        }
    }

}
