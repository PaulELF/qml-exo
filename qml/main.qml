import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 1024
    height: 768

    title: "Hello World"

    Item {
        anchors.fill: parent
        ColumnLayout {
            anchors.fill: parent

            ComboBox {
                id: combo
                model: ["exo1", "exo2", "exo3", "exo4"]
                currentIndex: 3
            }

            Loader {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 6
                source: combo.currentText + ".qml"
            }
        }

    }
}
