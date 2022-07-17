pragma Singleton
import QtQuick 2.0
import QtQuick.Window 2.0

QtObject {
    property real scalingFactor: 1.0

    function millimeterToPixel(value) {
        return Screen.pixelDensity * value * scalingFactor
    }

    function pixelPerMillimeter() {
        return Screen.pixelDensity
    }

    function pixelToMillimeter(pixel) {
        return pixel / (Screen.pixelDensity * scalingFactor)
    }

    function snapToMillimeter(pixel) {
        return pixel / (Screen.pixelDensity * scalingFactor)
    }
}
