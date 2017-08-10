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

    width: units.gu(40)
    height: units.gu(75)

	anchorToKeyboard: true
	
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

    property real gridpadding: units.gu(2)
    property real buttonwidth: (grid.width - gridpadding) / 2
    property real buttonheight: (grid.height - gridpadding - units.gu(10)) / 2
    property real fontsize: 30
    
    PageStack {
        id: mainPageStack
        anchors.fill: parent
        width: parent.width
		Page {
			id: page
			visible: true
			anchors.fill: parent
			//anchors.bottomMargin: units.gu(3)
			header: PageHeader {
				id: pageHeader
				title: i18n.tr("Sheep Counter")
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
					font.bold: true
					color: "#843E64" //UbuntuColors.graphite
					objectName: "button"
					text: settings.sheep1
					onClicked: {
						settings.sheep1 = settings.sheep1 + 1
					}
					onPressAndHold: {
							settings.sheep1 = settings.sheep1 - 1
					}
				}
				Button {
					id: button2
					width: buttonwidth
					height: buttonheight
					font.pointSize: fontsize
					font.bold: true
					color: "#6E3C61" //UbuntuColors.coolGrey
					objectName: "button"
					text: settings.sheep2
					onClicked: {
						settings.sheep2 = settings.sheep2 + 1
					}
					onPressAndHold: {
							settings.sheep2 = settings.sheep2 - 1
					}
				}
				ListItem {
					width: buttonwidth
					height: label.height
					clip: true
					divider.visible: false
					highlightColor: "transparent"
					Label {
						id: label
						width: buttonwidth
						//height: units.gu(3)
						objectName: "label"
						text: settings.sheeptype1
					}
					TextField {
						id: editTextOne
						visible: false
						clip: true
						anchors.fill: parent
						placeholderText: i18n.tr("Type the text for first button")
						onVisibleChanged: {
							if (visible) {
								focus = true;
								label.visible = false;
							} else {
								label.visible = true;
								focus = false;
							}
						}
						onFocusChanged: if (!focus) {accepted();}
						onAccepted: {
							if (editTextOne.text == "" || editTextOne.text == " ") {
								sheepcounter.settings.sheeptype1 = i18n.tr("Sheep Type 1");
							} else {
								sheepcounter.settings.sheeptype1 = editTextOne.text;
							}
							editTextOne.visible = false;
						}
					}
					leadingActions:  ListItemActions {	
						actions: [
							Action {
								iconName: "reset"
								onTriggered: {
									settings.sheep1 = 0
								}
							}
						]
					}
					trailingActions: ListItemActions {
						actions: [
							Action {
								iconName: "edit"
								text: i18n.tr("Edit")
								onTriggered: {
									editTextOne.visible = true;
								}
							}
						]
					}
				}
				ListItem {
					width: buttonwidth
					height: label.height
					clip: true
					divider.visible: false
					highlightColor: "transparent"
					Label {
						id: label1
						width: buttonwidth
						objectName: "label"
						text: settings.sheeptype2
					}
					TextField {
						id: editTextTwo
						visible: false
						clip: true
						anchors.fill: parent
						placeholderText: i18n.tr("Type the text for second button")
						onVisibleChanged: {
							if (visible) {
								focus = true;
								label1.visible = false;
							} else {
								label1.visible = true;
								focus = false;
							}
						}
						onFocusChanged: if (!focus) {accepted();}
						onAccepted: {
							if (editTextTwo.text == "" || editTextTwo.text == " ") {
								sheepcounter.settings.sheeptype2 = i18n.tr("Sheep Type 2");
							} else {
								sheepcounter.settings.sheeptype2 = editTextTwo.text;
							}
							editTextTwo.visible = false;
						}
					}
					leadingActions:  ListItemActions {	
						actions: [
							Action {
								iconName: "reset"
								onTriggered: {
									settings.sheep2 = 0
								}
							}
						]
					}
					trailingActions: ListItemActions {
						actions: [
							Action {
								iconName: "edit"
								text: i18n.tr("Edit")
								onTriggered: {
									editTextTwo.visible = true;
								}
							}
						]
					}
				}  

				Button {
					width: buttonwidth
					height: buttonheight
					font.pointSize: fontsize
					font.bold: true
					color: "#84377D" //UbuntuColors.darkAubergine
					objectName: "button"
					text: settings.sheep3
					onClicked: {
						settings.sheep3 = settings.sheep3 + 1
					}
					onPressAndHold: {
							settings.sheep3 = settings.sheep3 - 1
					}
				}
				Button {
					width: buttonwidth
					height: buttonheight
					font.pointSize: fontsize
					font.bold: true
					color: "#56334B" //UbuntuColors.purple
					objectName: "button"
					text: settings.sheep4
					onClicked: {
						settings.sheep4 = settings.sheep4 + 1
					}
					onPressAndHold: {
							settings.sheep4 = settings.sheep4 - 1
					}
				}
				ListItem {
					width: buttonwidth
					height: label.height
					clip: true
					divider.visible: false
					highlightColor: "transparent"
					Label {
						id: label2
						width: buttonwidth
						objectName: "label"
						text: settings.sheeptype3
					}
					TextField {
						id: editTextThree
						visible: false
						clip: true
						anchors.fill: parent
						placeholderText: i18n.tr("Type the text for third button")
						onVisibleChanged: {
							if (visible) {
								focus = true;
								label2.visible = false;
							} else {
								label2.visible = true;
								focus = false;
							}
						}
						onFocusChanged: if (!focus) {accepted();}
						onAccepted: {
							if (editTextThree.text == "" || editTextThree.text == " ") {
								sheepcounter.settings.sheeptype3 = i18n.tr("Sheep Type 3");
							} else {
								sheepcounter.settings.sheeptype3 = editTextThree.text;
							}
							editTextThree.visible = false;
						}
					}
					leadingActions:  ListItemActions {	
						actions: [
							Action {
								iconName: "reset"
								onTriggered: {
									settings.sheep3 = 0
								}
							}
						]
					}
					trailingActions: ListItemActions {
						actions: [
							Action {
								iconName: "edit"
								text: i18n.tr("Edit")
								onTriggered: {
									editTextThree.visible = true;
								}
							}
						]
					}
				}
				ListItem {
					width: buttonwidth
					height: label.height
					clip: true
					divider.visible: false
					highlightColor: "transparent"
					Label {
						id: label3
						width: buttonwidth
						objectName: "label"
						text: settings.sheeptype4
					}
					TextField {
						id: editTextFour
						visible: false
						clip: true
						anchors.fill: parent
						placeholderText: i18n.tr("Type the text for fourth button")
						onVisibleChanged: {
							if (visible) {
								focus = true;
								label3.visible = false;
							} else {
								label3.visible = true;
								focus = false;
							}
						}
						onFocusChanged: if (!focus) {accepted();}
						
						onAccepted: {
							if (editTextFour.text == "" || editTextFour.text == " ") {
								sheepcounter.settings.sheeptype4 = i18n.tr("Sheep Type 4");
							} else {
								sheepcounter.settings.sheeptype4 = editTextFour.text;
							}
							editTextFour.visible = false;
						}
					}
					leadingActions:  ListItemActions {	
						actions: [
							Action {
								iconName: "reset"
								onTriggered: {
									settings.sheep4 = 0
								}
							}
						]
					}
					trailingActions: ListItemActions {
						actions: [
							Action {
								iconName: "edit"
								text: i18n.tr("Edit")
								onTriggered: {
									editTextFour.visible = true;
								}
							}
						]
					}
				}

			} //Grid
		} //Page
    } //PageStack
} //MainView
