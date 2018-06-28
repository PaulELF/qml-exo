import QtQuick 2.0

Item {
    TextEdit {
        id:texte_princip
        width: 80
        height: 20
        text: ("Text Edit")
        font.pixelSize: 16
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Column{
        anchors.centerIn: parent
        spacing: 100
        Repeater{
            model:5

            Text{


                text: texte_princip.text.substring(index)


            }
        }

    }

}
