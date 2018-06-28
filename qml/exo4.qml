import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4
import QtLocation 5.11
//import MaterialIcons 2.2

Item {
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            color: "lightsteelblue"
            Layout.fillWidth: true
            implicitHeight: 50
            RowLayout{
                anchors.centerIn: parent
                Repeater {

                  model: ListModel {
                        id: sourceData
                      ListElement {

                          source: "file:///C:/Users/DEV/Pictures/Icon/laptop.png"
                          name: "Pull"
                      }
                      ListElement {

                          source: "file:///C:/Users/DEV/Pictures/Icon/git-branch-512.png"
                          name: "Branch"
                      }
                  }

                   ListView {

                       //orientation: ListView.Horizontal
                       anchors.fill:parent
                       model: sourceData
                       delegate: RowLayout {
                            width: parent.width
                            Button {
                            text: name
                            iconSource: source
                            }
                       }
                    }
                }
            }
        }
        SplitView {
            // property int panelSize: 100
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                color: "gray"
                width: 200
                //implicitWidth: parent.panelSize
                Layout.maximumWidth: 300
                Layout.minimumWidth: 150

                ColumnLayout {
                    anchors.fill: parent
                    TextField {
                        placeholderText: ("Text Edit")
                        font.pixelSize: 16
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop
                        Layout.margins: 2
                    }
                    Rectangle{
                        color:"gray"
                        Layout.margins: 5
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                    ListModel {
                        id: sectionModel
                        ListElement {
                            name: "LOCAL"
                            image: "file:///C:/Users/DEV/Pictures/Icon/laptop.png"
                        }
                        ListElement {
                            name: "master"
                            image: "file:///C:/Users/DEV/Pictures/Icon/git-branch-512.png"
                        }
                        ListElement {
                            name: "REMOTE"
                            image: "file:///C:/Users/DEV/Pictures/Icon/clouds.png"
                        }
                    }
                    ListView {
                        anchors.fill:parent
                        model: sectionModel
                        highlight: Rectangle{ color:"lightgreen"}
                        focus: true
                        delegate: RowLayout {
                            width: parent.width
                            spacing: 10
                            Rectangle {
                                width: 34
                                height: 34
                                color: "gray"
                                Image {
                                    anchors.centerIn: parent
                                    source: image
                                    sourceSize: Qt.size(25, 25)
                                }
                            }
                            Text {
                                Layout.fillWidth: true
                                text: name
                                elide: Text.ElideMiddle
                             }
                            }
                        }
                    }
                }
            }
            Rectangle {
                color: "black"
                Layout.fillWidth: true
                Layout.minimumWidth: 300

                ListModel {
                    id: sectionItem
                    ListElement {
                        name: "add Layout"
                        image: "file:///C:/Users/DEV/Pictures/Icon/Shell_logo.svg"
                    }
                    ListElement {
                        name: "Rectangle"
                        image: "file:///C:/Users/DEV/Pictures/Icon/Shell_logo.svg"
                    }
                    ListElement {
                        name: "main init"
                        image: "file:///C:/Users/DEV/Pictures/Icon/Shell_logo.svg"
                    }
                }
                ListView {
                    anchors.fill:parent
                    anchors.topMargin: 20
                    anchors.leftMargin: 100
                    model: sectionItem
                    delegate: RowLayout {
                        width: parent.width
                        spacing: 10

                        Rectangle {
                            width: 28
                            height: 28
                            radius:100
                            color: "cyan"

                            Image {
                                anchors.centerIn: parent
                                source: image
                                sourceSize: Qt.size(24, 24)
                            }
                        }
                        Text {
                            Layout.fillWidth: true
                            text: name
                            color: "white"
                            elide: Text.ElideMiddle
                            }
                        }
                    }
                /*ColumnLayout{
                    Layout.fillHeight: true

                    Repeater {
                        model: 5
                        Text {

                            text: "A"
                            color: "white"
                            font.pixelSize: 60

                        }

                        Rectangle {
                            color: "black"
                            implicitHeight: 22
                            implicitWidth: 22
                            Image {
                                anchors.fill: parent
                                source: "file:///C:/Users/DEV/Pictures/Icon/Shell_logo.svg"
                            }
                        }
                    }
                }*/
            }
            Rectangle {
                color: "gray"
                width: 200
                Layout.maximumWidth: 350
                Layout.minimumWidth: 250
                // implicitWidth: parent.panelSize
                ColumnLayout {
                    anchors.fill: parent

                    Rectangle{
                        color:"black"
                        Layout.rightMargin: 15
                        Layout.leftMargin: 15
                        implicitHeight: 50
                        Layout.fillWidth: true
                        Text {
                            anchors.centerIn: parent
                            text:"add Layout"
                            color: "white"
                            font.pixelSize: 18
                        }
                    }

                    Rectangle {
                        color:"gray"
                        implicitHeight: 100
                        RowLayout{
                            anchors.fill:parent
                            Rectangle {
                                color: "gray"
                                Layout.leftMargin: 20
                                Layout.preferredWidth: 50
                                Layout.preferredHeight: 50
                                Image{
                                    anchors.fill:parent
                                    source: "file:///C:/Users/DEV/Pictures/Icon/Shell_logo.svg"
                                }
                            }
                            Text{
                                text: "utilisateur"
                                color: "white"
                                font.pixelSize: 20
                            }
                        }
                    }
                    Rectangle{
                        color: "black"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.margins: 15
                        ColumnLayout {
                            Layout.margins: 30

                            Repeater {
                                model: 3
                                Text {
                                    color: "orange"
                                    text: "qml"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
