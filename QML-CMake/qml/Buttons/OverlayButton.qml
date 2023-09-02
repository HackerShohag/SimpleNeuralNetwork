import QtQuick
import QtQuick.Layouts

Rectangle {
    id: overlayButton

    property alias title: buttonText.text
    property alias icon: buttonIcon.source
    property bool selected: false

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        margins: 5
    }

    color: hoverHandler.containsMouse ? "#9E9AAB" : selected ? "#B9B4C7" : "transparent"
    height: 30
    radius: itemRadius / 2
    Row {
        anchors.fill: parent
        spacing: 5
        layoutDirection: Qt.LeftToRight
        padding: 4
        Image {
            id: buttonIcon
            anchors {
                verticalCenter: parent.verticalCenter
                margins: 5
            }
            width: 30
            height: 25
        }
        Text {
            id: buttonText
            anchors {
                verticalCenter: parent.verticalCenter
                margins: 5
            }
            color: "black"
//            font.bold: selected
        }
    }
    MouseArea {
        id: hoverHandler
        anchors.fill: parent
        hoverEnabled: true
        onPressed: overlayButton.color = "#8e8a99"
        onReleased: overlayButton.color = hoverHandler.containsMouse ? "#9E9AAB" : selected ? "#B9B4C7" : "transparent"
        onHoveredChanged: overlayButton.color = hoverHandler.containsMouse ? "#9E9AAB" : selected ? "#B9B4C7" : "transparent"
    }
}
