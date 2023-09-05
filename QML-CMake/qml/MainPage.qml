import QtQuick
import QtCharts
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "Buttons"
import "utils.js" as Utils

//import "data/safe.js" as Safe
//import "data/poison.js" as Poison

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
    property string selectedColor: contentContainerColor1[0]
    property int randomValueP

    property var contentContainerColor1: ["#64CCC5", "#EBEF95", "#E2C799", "#FFBB5C", "#FFFEC4"]
    property var contentContainerColor2: ["#176B87", "#EF9595", "#9A3B3B", "#C63D2F", "#FF9B9B"]

    property var poison : {"2": 26,"11": 2,"13": 22,"4": 20,"3": 23,"9": 19,"0": 3,"10": 22,"17": 4,"18": 6,"5": 10,"14": 2,"6": 25,"16": 19,"7": 2,"26": 1,"20": 10,"21": 14,"12": 9,"23": 1,"1": 21}
    property var safe : {"14": 29,"46": 7,"28": 10,"21": 39,"36": 19,"24": 22,"32": 22,"33": 0,"26": 15,"44": 18,"22": 30,"43": 23,"48": 6,"2": 39,"10": 44,"19": 44,"16": 33,"27": 9,"3": 40,"35": 1,"9": 28,"5": 37,"13": 30,"41": 49,"15": 45,"20": 39,"42": 11,"6": 36,"31": 48,"40": 9,"37": 44,"11": 26,"45": 45,"38": 49,"17": 44,"29": 33,"30": 8,"25": 31,"0": 39,"47": 4,"7": 49,"23": 45,"18": 34,"34": 39,"12": 32,"4": 38,"39": 27,"49": 43}

    function setRandomGradientValue() {
        var randomValue = Utils.getRandomInteger(contentContainerColor1.length)

        contentContainerGradientStartColor.color = contentContainerColor1[randomValue]
        contentContainerGradientEndColor.color = contentContainerColor2[randomValue]

        menuContainerGradientStartColor.color = Utils.shadeColor(contentContainerColor1[randomValue], 20)
        menuContainerGradientEndColor.color = Utils.shadeColor(contentContainerColor2[randomValue], 20)

        selectedColor = contentContainerColor1[randomValue]
    }

    onVisibilityChanged: (visibility) => {
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
//            Image {
//                id: introImage
//                anchors {
//                    verticalCenter: parent.verticalCenter
//                    horizontalCenter: parent.horizontalCenter
//                    leftMargin: 50
//                }
//                height: parent.height * 0.6
//                fillMode: Image.PreserveAspectFit
//                source: "qrc:/assets/images/clean_my_mac.png"
//            }
            ChartView {
                id: chartView
                title: "Graph"
                anchors.centerIn: parent
                antialiasing: true

                height: 500
                width: 700

                ScatterSeries {
                    id: scatter
                    name: "Poisonous Food"
                    color: "red"

                    XYPoint { x: 0; y: 0 }
                    XYPoint { x: 50; y: 50 }

                    Component.onCompleted: {
                        for (var key of Object.keys(safe)) {
                            scatter.append(parseInt(key), safe[key])
                        }

                        var myAxisX2 = chartView.axisX(scatter);
                        var myAxisY2 = chartView.axisY(scatter);
                        var scatterS = chartView.createSeries(ChartView.SeriesTypeScatter, "Safe Food", myAxisX2, myAxisY2);
                        scatterS.color = "green"

                        for (var key2 of Object.keys(poison)) {
                            scatterS.append(parseInt(key2), poison[key2])
                        }
                    }
                }
            }
        }

        gradient: Gradient {
            GradientStop {id: contentContainerGradientStartColor; position: 0.0; color: contentContainerColor1[0] }
            GradientStop {id: contentContainerGradientEndColor; position: 1.0; color: contentContainerColor2[0] }
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
                radius: itemRadius / 2
                selected: true
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }
            InfoButton {
                id: btn2
                anchors.top: btn1.bottom
                title: "Clean Up"
                radius: itemRadius / 2
            }
            OverlayButton {
                id:btn3
                anchors.top: btn2.bottom
                title: "System Junk"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                radius: itemRadius / 2
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }

            OverlayButton {
                id: btn4
                anchors.top: btn3.bottom
                title: "Mail Attachments"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                radius: itemRadius / 2
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }

            OverlayButton {
                id: btn5
                anchors.top: btn4.bottom
                title: "Trash Bins"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                radius: itemRadius / 2
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }
            InfoButton {
                id: btn6
                anchors.top: btn5.bottom
                title: "Protection"
                radius: itemRadius / 2
            }
            OverlayButton {
                id: btn7
                anchors.top: btn6.bottom
                title: "Malware Removal"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                radius: itemRadius / 2
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }
            OverlayButton {
                id: btn8
                anchors.top: btn7.bottom
                title: "Privacy"
                icon: "qrc:/assets/icons/neuralnet_icon.png"
                radius: itemRadius / 2
                selectColor: selectedColor
                callBackFunction: setRandomGradientValue
            }
        }

        gradient: Gradient {
            GradientStop { id: menuContainerGradientStartColor; position: 0.0; color: Utils.shadeColor(contentContainerColor1[0], 20) }
            GradientStop { id: menuContainerGradientEndColor; position: 1.0; color: Utils.shadeColor(contentContainerColor2[0], 20) }
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
