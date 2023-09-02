import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "Buttons"

ApplicationWindow {
    id : mainWindow
    width: 1280
    height: 720
    visible: true
    flags: Qt.FramelessWindowHint | Qt.Window
    opacity: 0.1
    color: "transparent"
    title: qsTr("Hello World")

    property int itemRadius: 15
    property bool windowFullscreen

    onVisibilityChanged: {
        windowFullscreen = visibility == 4 || visibility == 5
    }

    onWidthChanged: {
        if (windowFullscreen) {
            contentContainer.anchors.leftMargin = 0
            menuContainer.x = width / 20
        }
        else {
            menuContainer.x = mainWindow.x / 2
            contentContainer.anchors.leftMargin = width / 20
        }
    }

    Rectangle {
        id: contentContainer
        radius: itemRadius
        opacity: 0.95
        anchors {
            leftMargin: parent.width / 20
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: parent.left
        }

        Rectangle {
            id: windowTitleBar
            anchors {
                top: parent.top
                topMargin: 10
                right: parent.right
                left: parent.left
            }
            height: parent.height * 0.05
            color: "transparent"
            radius: parent.radius

            ActionButton {
                id: exitButton
                anchors.left: parent.left
                bText: "✘"
                bgColor: "red"
                textColor: "white"
                callbackFunction: function() {Qt.quit();}
            }

            ActionButton {
                id: maximizeButton
                anchors.left: exitButton.right
                bText: "➖"
                bgColor: "yellow"
                textColor: "grey"
                callbackFunction: function() {mainWindow.showMinimized()}
            }

            ActionButton {
                id: minimizeButton
                anchors.left: maximizeButton.right
                bText: (mainWindow.visibility == 4 || mainWindow.visibility == 5) ? "⇲" : "⇱"
                bgColor: "green"
                textColor: "white"
                callbackFunction: function() {
                    if (mainWindow.visibility == 4 || mainWindow.visibility == 5)
                        mainWindow.showNormal()
                    else
                        mainWindow.showFullScreen()
                }
            }

            Text {
                id: windowTitle
                text: qsTr("Neural Network Trainer")
                anchors.centerIn: parent
                font.pixelSize: 20
                color: "black"
            }
        }

        Rectangle {
            anchors {
                top: windowTitleBar.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            color: "transparent"
            Image {
                id: introImage
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                    leftMargin: 50
                }
                height: parent.height * 0.6
                fillMode: Image.PreserveAspectFit
                source: "qrc:/assets/images/clean_my_mac.png"
            }
        }

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FCBAAD" }
            GradientStop { position: 1.0; color: "#916DB3" }
        }
    }
    Rectangle {
        id: menuContainer
        radius: itemRadius
        opacity: 0.9
        anchors {
            margins: Math.min(parent.height, parent.width) / 15
            rightMargin: parent.width * 0.8
            leftMargin: 0
            top: parent.top
            bottom: parent.bottom
        }

        width: parent.width * 0.2
        x: mainWindow.x / 2

        Rectangle {
            anchors {
                fill: parent
                margins: 10
            }
            color: "transparent"

            OverlayButton {
                id:btn1
                title: "Smart Scan"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                selected: true
            }
            InfoButton {
                id: btn2
                anchors.top: btn1.bottom
                title: "Clean Up"
            }
            OverlayButton {
                id:btn3
                anchors.top: btn2.bottom
                title: "System Junk"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
            }

            OverlayButton {
                id: btn4
                anchors.top: btn3.bottom
                title: "Mail Attachments"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
            }

            OverlayButton {
                id: btn5
                anchors.top: btn4.bottom
                title: "Trash Bins"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
            }
            InfoButton {
                id: btn6
                anchors.top: btn5.bottom
                title: "Protection"
            }
            OverlayButton {
                id: btn7
                anchors.top: btn6.bottom
                title: "Malware Removal"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
            }
            OverlayButton {
                id: btn8
                anchors.top: btn7.bottom
                title: "Privacy"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
            }
        }

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#fad4cd" }
            GradientStop { position: 1.0; color: "#bf8eed" }
        }
    }

    DropShadow {
        anchors.fill: contentContainer
        opacity: 0.2
        source: contentContainer
        radius: 5
        color: "gray"
    }

    DropShadow {
        anchors.fill: menuContainer
        opacity: 0.6
        source: menuContainer
        radius: 5
        color: "gray"
    }

//    FastBlur {
//        anchors.fill: menuContainer
//        source: menuContainer
//        radius: 32
//    }
}
