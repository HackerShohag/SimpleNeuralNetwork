/*
 * Copyright (C) 2023  Abdullah AL Shohag
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * raven.downloader is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick
import QtCharts
import FloatUI

import "utils.js" as Utils

FloatWindow {
    id : mainWindow
    width: 1280
    height: 720

    property var poison : {"2": 26,"11": 2,"13": 22,"4": 20,"3": 23,"9": 19,"0": 3,"10": 22,"17": 4,"18": 6,"5": 10,"14": 2,"6": 25,"16": 19,"7": 2,"26": 1,"20": 10,"21": 14,"12": 9,"23": 1,"1": 21}
    property var safe : {"14": 29,"46": 7,"28": 10,"21": 39,"36": 19,"24": 22,"32": 22,"33": 0,"26": 15,"44": 18,"22": 30,"43": 23,"48": 6,"2": 39,"10": 44,"19": 44,"16": 33,"27": 9,"3": 40,"35": 1,"9": 28,"5": 37,"13": 30,"41": 49,"15": 45,"20": 39,"42": 11,"6": 36,"31": 48,"40": 9,"37": 44,"11": 26,"45": 45,"38": 49,"17": 44,"29": 33,"30": 8,"25": 31,"0": 39,"47": 4,"7": 49,"23": 45,"18": 34,"34": 39,"12": 32,"4": 38,"39": 27,"49": 43}

    windowHeader: Item {
        anchors.fill: parent
        Text {
            id: windowTitle
            text: qsTr("Neural Network Trainer")
            anchors.centerIn: parent
            font.pixelSize: 20
            color: "black"
        }
    }

    mainContentItem: Item {
        anchors.fill: parent
        ChartView {
            id: chartView
            title: "Graph"
            anchors.centerIn: parent
            antialiasing: true

            backgroundColor: Utils.shadeColor(selectedColor, 20)

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

    menuItem: Rectangle {
        anchors.fill: parent
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
}
