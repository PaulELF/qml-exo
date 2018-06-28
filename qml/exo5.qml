import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Item {
    Component.onCompleted: {
        console.log("QML: " + _Num.number)
    }

    ColumnLayout {
//        TextField {
//            text: _Connector.text
//        }
       Button {
            text: "Update"
            onClicked: {
                var value = Math.random()
                console.log(value)
                _Connector.text = value
            }
        }

        Text {
            text: "Connector.text: " + _Connector.text
        }
        Text {
            text: "Connector.text: " + _Num.number
        }

        Button{
            text: "click"
            onClicked: {
                var number = Math.random()
                console.log(number)
                _Num.number = number
            }
        }
        Text {
            text: "number : "+ _Num.number
        }

    }
}
