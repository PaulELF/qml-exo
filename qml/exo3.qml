import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.0

Item {

    property string imagePath
    property string displayPath: imagePath.replace("file:///", "")
    property url test
    ColumnLayout {
        anchors.fill: parent

        RowLayout {

            TextField {
                id: text_source
                Layout.fillWidth: true
                placeholderText: "Choose picture"
                font.pixelSize: 16
                selectByMouse: true
                text: displayPath
                onAccepted: imagePath = "file:///" + text
            }

            Button {
                text: "Browse"
                onClicked: fileDialog.open()
            }
        }

        Image {
            id: photo
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: imagePath
            autoTransform: true
            fillMode: Image.PreserveAspectFit

            Text {
                anchors.centerIn: parent
                font.pixelSize: 25
                text:  'Error invalid file'
                visible: photo.status === Image.Error
            }
        }
    }

    FileDialog {
        id: fileDialog
        folder: StandardPaths.writableLocation(StandardPaths.PicturesLocation)
        currentFile: imagePath
        onAccepted: imagePath = file
    }

    DropArea {
        property var imgExtensions: ["jpg", "png"]
        anchors.fill: parent
        onDropped: {
            console.log("drop : " + drop.urls)
            // 1. if drop has url
            if (drop.urls) {
                imagePath = drop.urls[0]
            }
        }
        onEntered: {
            console.log(" entered " +drag.urls)
            drag.accepted = false
             var i=0;
             // for url in urls
             for(i=0; i < drag.urls.length; i++){
                 //console.log(drag.urls[i].toString().endswith(".jpg"))
                 var url = drag.urls[i]
                 if(validateFileExtension(url)){
                   console.log("exist")
                   drag.accept()
                  }
              }
             function validateFileExtension(url){
                 console.log(url.split("."))
                 return url.split('.').pop().toLowerCase() === "jpg"
             }
        }
    }
}
