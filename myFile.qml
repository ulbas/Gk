import QtQuick 2.7
import FileIO 1.0

Rectangle {
    width: 360
    height: 360
    Text {
        id: myText
        text: "Hello World"
        anchors.centerIn: parent
    }

    FileIO {
        id: myFile
        source: "my_file.txt"
        onError: console.log(msg)
    }

    Component.onCompleted: {
        console.log( "WRITE"+ myFile.write("TEST"));
        myText.text =  myFile.read();
    }
}
