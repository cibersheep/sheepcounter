import QtQuick 2.4
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0

/*!
    \Simple counter
*/

MainView {
    id: sheepcounter
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "sheepcounter"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "sheepcounter.cibersheep"

    width: units.gu(100)
    height: units.gu(75)


    property var settings: Settings {
        property bool firstRun: true
        property real sheep1: 0
        property real sheep2: 0
        property real sheep3: 0
        property real sheep4: 0
        property string sheeptype1: i18n.tr("Sheep Type 1")
        property string sheeptype2: i18n.tr("Sheep Type 2")
        property string sheeptype3: i18n.tr("Sheep Type 3")
        property string sheeptype4: i18n.tr("Sheep Type 4")
    }

    property real gridpadding: units.gu(3)
    property real buttonwidth: (grid.width - gridpadding) / 2
    property real buttonheight: (grid.height - gridpadding - units.gu(10)) / 2
    property real fontsize: 20
    PageStack {
        id: mainPageStack
        anchors.fill: parent
        width: parent.width
    Page {
        id: page
        visible: true
        anchors {
            fill: parent

        }
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Sheep Counter")
            StyleHints {
                foregroundColor: UbuntuColors.warmGrey
                backgroundColor: UbuntuColors.purple
                dividerColor: UbuntuColors.warmGrey
            }
            leadingActionBar {
                numberOfSlots: 1
                actions: [
                    Action {
                        id: actionSettings
                        iconName: "navigation-menu"
                        shortcut: "Ctrl+M"
                        text: i18n.tr("Menu")
                        onTriggered: {
                            Qt.inputMethod.hide();
                            page.visible = false;
                            mainPageStack.push(Qt.resolvedUrl("Menu.qml"))
                        }
                    }
                ]
            }
        }
        Component.onCompleted: {
            if (settings.firstRun) {
                settings.sheep1 = 0
                settings.sheep2 = 0
                settings.sheep3 = 0
                settings.sheep4 = 0
                settings.sheeptype1 = i18n.tr("Sheep Type 1")
                settings.sheeptype2 = i18n.tr("Sheep Type 2")
                settings.sheeptype3 = i18n.tr("Sheep Type 3")
                settings.sheeptype4 = i18n.tr("Sheep Type 4")

                settings.firstRun = false;
            }
        }
    Grid {
        id: grid
        anchors {
            top: pageHeader.bottom
            left: page.left
            right: parent.right
            bottom: page.bottom
            margins: gridpadding
        }
        columns: 2
        spacing: gridpadding

        Button {
            width: buttonwidth
            height: buttonheight
            font.pointSize: fontsize
            color: UbuntuColors.graphite
            objectName: "button"
            text: settings.sheep1
            onClicked: {
                settings.sheep1 = settings.sheep1 + 1
            }
        }
        Button {
            id: button2
            width: buttonwidth
            height: buttonheight
            font.pointSize: fontsize
            color: UbuntuColors.coolGrey
            objectName: "button"
            text: settings.sheep2
            onClicked: {
                settings.sheep2 = settings.sheep2 + 1
            }
        }
        Label {
            id: label
            width: buttonwidth
            objectName: "label"
            text: settings.sheeptype1
        }
        Label {
            id: label1
            width: buttonwidth
            objectName: "label"
            text: settings.sheeptype2
        }
        Button {
            width: buttonwidth
            height: buttonheight
            font.pointSize: fontsize
            color: UbuntuColors.darkAubergine
            objectName: "button"
            text: settings.sheep3
            onClicked: {
                settings.sheep3 = settings.sheep3 + 1
            }
        }
        Button {
            width: buttonwidth
            height: buttonheight
            font.pointSize: fontsize
            color: UbuntuColors.purple
            objectName: "button"
            text: settings.sheep4
            onClicked: {
                settings.sheep4 = settings.sheep4 + 1
            }
        }
        Label {
            id: label2
            width: buttonwidth
            objectName: "label"
            text: settings.sheeptype3
        }
        Label {
            id: label3
            width: buttonwidth
            objectName: "label"
            text: settings.sheeptype4
        }
    }
    }
    }
}
