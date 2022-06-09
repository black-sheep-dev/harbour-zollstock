import QtQuick 2.0

import Sailfish.Silica 1.0
import "../."

Item {
    property int length: 20

    width: parent.width
    height: Helper.millimeterToPixel(length + 1)

    Repeater {
        model: parent.length + 1

        Rectangle {
            y: Helper.millimeterToPixel(index)
            anchors.right: parent.right
            width: {
                var value = 50

                if (index % 5 === 0) {
                    value = 75
                }

                if (index % 10 === 0) {
                    value = 100
                }

                return value
            }
            height: 1
            color: index % 10 === 0 ? Theme.primaryColor : Theme.secondaryColor


            Label {
                visible: index % 10 === 0
                anchors {
                    right: parent.left
                    rightMargin: Theme.paddingMedium
                    verticalCenter: parent.verticalCenter
                }
                rotation: 90
                text: index === 0 ? "0" : index / 10
            }
        }
    }
}
