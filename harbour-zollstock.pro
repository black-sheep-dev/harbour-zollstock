# VERSION
VERSION = 0.1.1
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

TARGET = harbour-zollstock
DEFINES += APP_TARGET=\\\"$$TARGET\\\"

CONFIG += sailfishapp_qml

DISTFILES += qml/harbour-zollstock.qml \
    qml/components/PositionIndicatorItem.qml \
    qml/components/ScaleItem.qml \
    qml/cover/CoverPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/TutorialLongDistancePage.qml \
    qml/pages/TutorialMeasurementToolsPage.qml \
    qml/pages/TutorialMeasurementToolsResetPage.qml \
    qml/qmldir \
    qml/tools/Helper.qml \
    rpm/harbour-zollstock.changes \
    rpm/harbour-zollstock.changes.run.in \
    rpm/harbour-zollstock.spec \
    rpm/harbour-zollstock.yaml \
    translations/*.ts \
    harbour-zollstock.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172 512x512

include(translations/translations.pri)

icons.files = icons/*.svg
icons.path = $$INSTALL_ROOT/usr/share/harbour-zollstock/icons

images.files = images/*.svg
images.path = $$INSTALL_ROOT/usr/share/harbour-zollstock/images

INSTALLS += icons images
