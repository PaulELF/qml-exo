import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    Rectangle {
        id: root
        anchors.fill: parent
        anchors.margins: 20
        color: "red"

        Button {
            text: "clic"
            anchors.centerIn: parent
            onClicked: root.color = Qt.colorEqual(root.color, "red") ? "green" : "red"
        }
        Text {
            text: root.color
            anchors.horizontalCenter: root.horizontalCenter
            anchors.bottom: root.bottom
        }
    }
}
