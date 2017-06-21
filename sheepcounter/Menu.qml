import QtQuick 2.4
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0

/*!
    \Simple counter
*/

MainView {
    id: menuView
    anchors.fill: parent
    anchorToKeyboard: false


    property real settingButtonWidth: pageMenu.width * .75
    property real settingLeftMargin: pageMenu.width * .1

    Page {
        id: pageMenu

        property bool expandLink: false
        property bool expandImg: false
        property bool expandTableCreate: false
        property bool expandFind: false
        property bool expandReplace: false

        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Menu")
            StyleHints {
                foregroundColor: UbuntuColors.lightGrey
                backgroundColor: UbuntuColors.darkAubergine
                dividerColor: UbuntuColors.warmGrey
            }
            leadingActionBar {
                numberOfSlots: 1
                actions: [
                    Action {
                        id: actionSettings
                        iconName: "back"
                        text: i18n.tr("Back")
                        shortcut: "Ctrl+B"
                        onTriggered: {
                            onClicked: mainPageStack.pop(pageMenu)
                            page.visible = true;
                        }
                    }
                ]
            }
        }
            Flickable {
                id: flickable
                anchors.fill: parent
                anchors {
                    top: pageHeader.bottom

                    leftMargin: settingLeftMargin

                }
                contentHeight: settingsColumn.height + buttonColumn.height + units.gu(75)

                Column {
                    id: settingsColumn
                    spacing: units.gu(1)
                    anchors {
                        top: parent.top; left: parent.left; right: parent.right; topMargin: units.gu(10)
                    }

                    Label {
                        id: changeLabel1

                        objectName: "label"
                        text: sheepcounter.settings.sheeptype1
                    }

                    TextField {
                        id: inputFrom1
                        objectName: "inputFrom1"
                        errorHighlight: false
                        height: units.gu(5)
                        width: settingButtonWidth
                        font.pixelSize: FontUtils.sizeToPixels("medium")
                        text: i18n.tr("Type the text for first button")
                        onFocusChanged: {
                            inputFrom1.text = ""
                        }

                        onAccepted: {
                            sheepcounter.settings.sheeptype1 = inputFrom1.text
                            inputFrom1.text = ""
                        }

                    }
                    Label {
                        id: changeLabel2

                        objectName: "label"
                        text: sheepcounter.settings.sheeptype2
                    }

                    TextField {
                        id: inputFrom2
                        objectName: "inputFrom2"
                        errorHighlight: false
                        height: units.gu(5)
                        width: settingButtonWidth
                        font.pixelSize: FontUtils.sizeToPixels("medium")
                        text: i18n.tr("Type the text for second button")
                        onFocusChanged: {
                            inputFrom2.text = ""
                        }

                        onAccepted: {
                            sheepcounter.settings.sheeptype2 = inputFrom2.text
                            inputFrom2.text = ""
                        }

                    }
                    Label {
                        id: changeLabel3

                        objectName: "label"
                        text: sheepcounter.settings.sheeptype3
                    }

                    TextField {
                        id: inputFrom3
                        objectName: "inputFrom3"
                        errorHighlight: false
                        height: units.gu(5)
                        width: settingButtonWidth
                        font.pixelSize: FontUtils.sizeToPixels("medium")
                        text: i18n.tr("Type the text for third button")
                        onFocusChanged: {
                            inputFrom3.text = ""
                        }

                        onAccepted: {
                            sheepcounter.settings.sheeptype3 = inputFrom3.text
                            inputFrom3.text = ""
                        }

                    }
                    Label {
                        id: changeLabel4

                        objectName: "label"
                        text: sheepcounter.settings.sheeptype4
                    }

                    TextField {
                        id: inputFrom4
                        objectName: "inputFrom4"
                        errorHighlight: false
                        height: units.gu(5)
                        width: settingButtonWidth
                        font.pixelSize: FontUtils.sizeToPixels("medium")
                        text: i18n.tr("Type the text for fourth button")
                        onFocusChanged: {
                            inputFrom4.text = ""
                        }

                        onAccepted: {
                            sheepcounter.settings.sheeptype4 = inputFrom4.text
                            inputFrom4.text = ""
                        }

                    }

		}
		Column {
                    id: buttonColumn
                    spacing: units.gu(10)
                    anchors {
                        top: settingsColumn.bottom; left: parent.left; right: parent.right; topMargin: units.gu(10)
                    }

		        Button {
		            id: resetButton

		            width: settingButtonWidth
		            height: units.gu(6)
		            font.pointSize: fontsize - 5
		            color: UbuntuColors.red
		            objectName: "button"
		            text: i18n.tr("Reset all counters")
		            onClicked: {
		                sheepcounter.settings.sheep1 = 0
		                sheepcounter.settings.sheep2 = 0
		                sheepcounter.settings.sheep3 = 0
		                sheepcounter.settings.sheep4 = 0
		            }
		        }
		}
            
        }

    }



}
