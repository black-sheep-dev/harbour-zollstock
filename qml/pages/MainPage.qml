import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Window 2.0

import "../components"
import "../."

Page {
    id: page

    function resetTools() {
        firstIndicator.position = 0
        secondIndicator.position = 50
        flickable.scrollToTop()
    }

    allowedOrientations: Orientation.Portrait

    RemorsePopup { id: remorse }

    SilicaFlickable {
        id: flickable
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                //% "About"
                text: qsTrId("id-about")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                //% "Tutorial"
                text: qsTrId("id-tutorial")
                onClicked: pageStack.push(Qt.resolvedUrl("TutorialMeasurementToolsPage.qml"))
            }

            MenuItem {
                //% "Reset"
                text: qsTrId("id-reset")
                //% "Resetting measurement"
                onClicked: remorse.execute(qsTrId("id-resetting-measurement"), function() { resetTools() })
            }
        }

        contentHeight: zollstock.height

        Item {
            id: zollstock
            anchors {
                top: parent.top
                topMargin: Helper.millimeterToPixel(10)
            }
            width: parent.width
            height: Helper.millimeterToPixel(settings.maximumLength + 20)

            PositionIndicatorItem {
                id: firstIndicator
                position: 0
                minPos: 0
                maxPos: secondIndicator.position - 1

                onReset: position = 0
            }

            PositionIndicatorItem {
                id: secondIndicator
                position: 50
                minPos: firstIndicator.position + 1
                maxPos: settings.maximumLength
                length: secondIndicator.position - firstIndicator.position

                onReset: {
                    firstIndicator.position = 0
                    position = 50
                    flickable.scrollToTop()
                }
            }

            ScaleItem {
                length: 2000
            }
        }

        VerticalScrollDecorator { id: scrollDecorator }
    }

    onStatusChanged: {
        if (status !== PageStatus.Active) return
        pageStack.pop(pageStack.previousPage())
    }
}
