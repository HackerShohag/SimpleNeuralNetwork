import QtQuick

Rectangle {
    id: actionButton
    property string bText
    property string bgColor
    property string textColor
    property var callbackFunction

    anchors {
        leftMargin: 15
        topMargin: 10
    }
    height: 15
    width: 15
    radius: 15
    color: bgColor
    Text {
        anchors.centerIn: parent
        text: bText
        color: actionButtonClickPoint.containsMouse ? textColor : bgColor
        font.pixelSize: 10
    }
    MouseArea {
        id: actionButtonClickPoint
        hoverEnabled: true
        anchors.fill: parent
        onClicked: callbackFunction()
    }
}
