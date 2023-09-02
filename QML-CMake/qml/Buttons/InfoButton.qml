import QtQuick
import QtQuick.Layouts

Rectangle {
    id: infoButton

    property alias title: buttonText.text

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        topMargin: 20
        bottomMargin: 0
        margins: 10
    }

    height: 15
    radius: itemRadius / 2
    color: "transparent"
    Row {
        anchors.fill: parent
        spacing: 5
        layoutDirection: Qt.LeftToRight
        padding: 4
        Text {
            id: buttonText
            anchors {
                verticalCenter: parent.verticalCenter
                bottomMargin: 0
                margins: 10
            }
            color: "#5c5c5c"
//            font.bold: selected
        }
    }
}
