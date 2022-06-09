import QtQuick 2.0
import Sailfish.Silica 1.0

import "../."

Item {
    property bool dragable: true
    property int position: 0    // mm
    property int minPos: 0      // mm
    property int maxPos: 0      // mm
    property int length: 0      // mm
    property bool tutorial: false
    property int tutorialPos: 0 //mm

    signal reset()

    function setPosition() {
        position = Helper.snapToMillimeter(y + height / 2)
    }

    onYChanged: {
        if (!tutorial) return

        tutorialPos = Helper.snapToMillimeter(y + height / 2)
    }

    y: Helper.millimeterToPixel(position) - height / 2
    height: Theme.itemSizeLarge
    width: parent.width

    Label {
        anchors {
            left: parent.left
            leftMargin: Theme.horizontalPageMargin
            top: parent.top
        }
        font.pixelSize: Theme.fontSizeSmall
        text: "P: " + ((tutorial ? tutorialPos : position )/ 10).toFixed(1) + " cm"
    }

    Label {
        visible: length !== 0
        anchors {
            left: parent.left
            leftMargin: Theme.horizontalPageMargin
            bottom: parent.bottom
        }
        font.pixelSize: Theme.fontSizeSmall
        text: "L: " + (length / 10).toFixed(1) + " cm"
    }

    Rectangle {
        anchors {
            left: parent.left
            right: indicator.left
            verticalCenter: parent.verticalCenter
        }
        color: Theme.highlightColor
        height: 2
    }

    Rectangle {
        anchors {
            right: parent.right
            left: indicator.right
            verticalCenter: parent.verticalCenter
        }
        color: Theme.highlightColor
        height: 2
    }

    Rectangle {
        id: indicator
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height
        width: height
        radius: height / 2
        color: "transparent"
        border {
            color: Theme.highlightColor
            width: height * 0.1
        }

        Icon {
            anchors {
                top: parent.top
                topMargin: 0.25 * parent.height
                horizontalCenter: parent.horizontalCenter
            }
            source: "image://theme/icon-s-arrow?" + Theme.highlightColor
            rotation: 180
        }

        Icon {
            anchors {
                bottom: parent.bottom
                bottomMargin: 0.25 * parent.height
                horizontalCenter: parent.horizontalCenter
            }
            source: "image://theme/icon-s-arrow?" + Theme.highlightColor
        }
    }

    Drag.active: dragArea.drag.active

    MouseArea {
        enabled: dragable
        id: dragArea
        anchors.fill: parent

        drag {
            target: parent
            axis: "YAxis"
            minimumY: Helper.millimeterToPixel(minPos) - parent.height / 2
            maximumY: Helper.millimeterToPixel(maxPos) - parent.height / 2
        }

        onMouseYChanged: setPosition()
        onReleased: setPosition()
        onDoubleClicked: reset()
    }
}
