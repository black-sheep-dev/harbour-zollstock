pragma Singleton
import QtQuick 2.0
import QtQuick.Window 2.0

QtObject {
    function millimeterToPixel(value) {
        return Math.round(Screen.pixelDensity * value)
    }

    function pixelPerMillimeter() {
        return Screen.pixelDensity
    }

    function pixelToMillimeter(pixel) {
        return Math.round(pixel / Screen.pixelDensity)
    }

    function snapToMillimeter(pixel) {
        return Math.round(pixel / Screen.pixelDensity)
    }
}
