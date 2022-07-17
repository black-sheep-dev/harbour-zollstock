import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width:parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                //% "Settings"
                title: qsTrId("id-settings")
            }

            SectionHeader {
                //% "Calibration"
                text: qsTrId("id-calibration")
            }

            Label {
                x : Theme.horizontalPageMargin
                width: parent.width - 2*x
                wrapMode: Text.WordWrap
                color: Theme.highlightColor

                //% "This app uses the pixel density per millimeter reported by the device as the calibration for the scale."
                text: qsTrId("id-calibration-desc-1")
            }

            Label {
                x : Theme.horizontalPageMargin
                width: parent.width - 2*x
                wrapMode: Text.WordWrap
                color: Theme.highlightColor

                //% "You can change this with a scaling factor in the input field below."
                text: qsTrId("id-calibration-desc-2")
            }

            TextField {
                id: scalingFactorField
                //% "Scaling factor"
                label: qsTrId("id-scaling-factor")
                inputMethodHints: Qt.ImhDigitsOnly
                validator: DoubleValidator { bottom: 0.001 }

                text: settings.scalingFactor.toFixed(8)
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                //% "Reset"
                text: qsTrId("id-reset")
                onClicked: scalingFactorField.text = "1.00000000"
            }

            Item {
                width: 1
                height: Theme.paddingMedium
            }
        }
    }

    onStatusChanged: {
        if (status !== PageStatus.Deactivating) return
        settings.scalingFactor = scalingFactorField.text
    }
}
