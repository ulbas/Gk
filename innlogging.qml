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
                font.family: "calibri"
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
                font.family: "calibri"
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
                width:parent.width
                height: parent.height
                style:ButtonStyle{
                    label: Component{
                        Text{
                            text:"Logg inn"
                            color:"black"
                            font.family: "candara"
                            //font.bold:true
                            font.pixelSize: 14
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter

                        }
                    }
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

                Keys.onReturnPressed:clicked()
                Keys.onEnterPressed:clicked()

                onClicked: {

                    /*if (username.text == "Admin" && password.text == "Admin")
                        view.currentIndex=1*/
                    if (username.text == "Brukernavn" && password.text == "Passord")
                        view.currentIndex = 1
                    else if(username.text !="Admin" && password.text != "Admin")
                        warning.visible=true

                }
            }

        }
    }
    Rectangle{
        id:warning

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 400
        visible: false
        width: 250
        height: 100
        radius:5
        color: "#a8c0a5"
        border.color: "#5C5E5C"
        border.width: 1.5

        Button{
            anchors.right:parent.right
            anchors.rightMargin: 4
            anchors.top:parent.top
            anchors.topMargin: 5

            height: 25
            width: 25
            style:ButtonStyle{
                label: Component{
                    Text{
                        text:"X"
                        color:"black"
                        font.family: "areal"
                        font.bold:true
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill:parent
                    }
                }
                background: Rectangle{
                    border.width: 1
                    color: "transparent"
                    border.color: "transparent"
                    //color: "#B6CAB4"
                    //border.color: "#888"
                    radius: 5
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }

            onClicked:{
                warning.visible=false
            }
        }
        TextEdit{
            anchors.centerIn: parent
            font.pixelSize: 12
            readOnly: true
            text:"Feil brukernavn eller passord.\n\n            Prøv igjen!"
        }
    }
}




