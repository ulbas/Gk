import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
Rectangle{
    width: 600
    height: 600
    color: "transparent"


    Image{
        id:image1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 150
        source: "gk.png"
        width: parent/10
        height: parent/10
    }
    DropShadow {
            anchors.fill: image1
            horizontalOffset: 5
            verticalOffset: 4
            radius: 9.0
            samples: 17
            color: "#80000000"
            source: image1
        }
    Column{
        spacing:40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:image1.bottom
        anchors.topMargin: 50

        Rectangle{
            id:textbox1
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 50
            border.color: "darkgrey"
            border.width: 2
            radius:5

            TextInput{
                id:username
                font.pixelSize: 16
                Keys.onTabPressed:password.forceActiveFocus()
                Keys.onReturnPressed:buttonlog.clicked()
                Keys.onEnterPressed:buttonlog.clicked()
                anchors.centerIn: parent
                text:"Brukernavn"
                onFocusChanged: {
                    if(focus && username.text== "Brukernavn")
                        username.text = ""
                    else if(username.text=="")
                        username.text = "Brukernavn"
                }
            }
        }
        Rectangle{
            id:textbox2
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 50
            border.color: "darkgrey"
            border.width: 2
            radius: 5

            TextInput{

                id:password

                font.pixelSize: 16
                Keys.onTabPressed:buttonlog.forceActiveFocus()
                Keys.onReturnPressed:buttonlog.clicked()
                Keys.onEnterPressed:buttonlog.clicked()
                anchors.centerIn: parent
                text: "Passord"
                echoMode: TextInput.Password


                onFocusChanged: {
                    if(focus && password.text== "Passord")
                        password.text = ""
                    else if(password.text=="")
                        password.text = "Passord"
                }
            }
        }
        Rectangle{
            id:knapp
            width: 150
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#B6CAB4"
            Button{
                id:buttonlog
                style:ButtonStyle{
                    background: Rectangle{
                        border.width: 2
                        color: "#B6CAB4"
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
                anchors.fill:parent
                Keys.onReturnPressed:clicked()
                Keys.onEnterPressed:clicked()
                text:"Logg inn"
                onClicked: {

                    if (username.text == "Admin" && password.text == "Admin")
                        view.currentIndex=1
                    else if(username.text !="Admin" && password.text != "Admin")
                        warning.stateVisible=true
                }
            }
            Rectangle{
                id:warning
                anchors.top:knapp.bottom
                anchors.topMargin:30
                anchors.horizontalCenter: parent.horizontalCenter
                visible: stateVisible
                width: 250
                height: 50
                color: "white"
                border.color: "darkgrey"
                border.width: 2
                property bool stateVisible: false
                states: [
                    State { when: stateVisible;
                        PropertyChanges {   target: warning; opacity: 1.0    }
                    },
                    State { when: !stateVisible;
                        PropertyChanges {   target: warning; opacity: 0.0    }
                    }
                ]
                transitions: Transition {
                    NumberAnimation { property: "opacity"; target: warning; duration: 500}
                }
                TextEdit{
                    anchors.centerIn: parent
                    font.pixelSize: 12
                    readOnly: true
                    text:"Feil brukernavn eller passord, prøv igjen"
                }
            }
        }
    }
}




