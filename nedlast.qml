import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id:nedlastsiden
    width: 600
    height: 600
    color: "transparent"

    Column{
        id:kollonne1
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30
        width:500
        topPadding:150
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            id:nettboks
            width: 220
            height: 50
            radius:5
            border.color: "#737373"
            border.width: 1.2
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    node.focus=true
                }
            }

            TextInput{
                id:node
                anchors.centerIn: nettboks
                font.pixelSize: 16
                Keys.onTabPressed:buttonlast.forceActiveFocus()
                font.family: "Candara"
                text:"Velg nett"
                focus:false
                onFocusChanged: {
                    if(focus && node.text== "Velg nett")
                        node.text = ""
                    else if(node.text=="")
                        node.text = "Velg nett"
                }
            }
        }
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 220
            radius: 5
            color: "transparent"


            Column{
                anchors.fill:parent
                spacing: 20
                /*Button{
                    id:forklarknapp
                    anchors.top:parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 200
                    height: 25
                    focus:true
                    style:ButtonStyle{
                        Label{
                            color: "black"
                            text:"Forklaring"
                            font.pixelSize: 18
                            font.underline: true
                            font.family: "Candara"
                        }
                        background:Rectangle{
                            color: "transparent"
                            border.color: "transparent"
                        }
                    }
                    onClicked:{
                    fork.visible=true
                    }
                }
                Button{
                    id:sensorknapp
                    anchors.top:forklarknapp.top
                    anchors.topMargin: 25
                    focus:true
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 200
                    height: 25
                    style:ButtonStyle{
                        Label{
                            color: "black"
                            text:"Sensor"
                            font.pixelSize: 18
                            font.underline: true
                            font.family: "Candara"
                        }
                        background:Rectangle{
                            color: "transparent"
                            border.color: "transparent"
                        }
                    }
                    onClicked:{
                    sens.visible=true
                    }
                }*/
                Rectangle{
                    id:fork
                    width:parent.width
                    height: 100
                    visible:true
                    border.color: "#737373"
                    border.width: 1.2
                    radius:5
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            forklaringinput.focus=true
                        }
                    }
                    TextEdit{
                        id:forklaring
                        readOnly: true
                        anchors.top:parent.top
                        anchors.topMargin: 3
                        anchors.left:parent.left
                        anchors.leftMargin: 5
                        font.family: "Candara"
                        font.pixelSize: 14
                        text:"Forklaring: "
                    }
                    TextEdit{
                        id:forklaringinput
                        anchors.top:forklaring.bottom
                        anchors.topMargin: 5
                        anchors.left:parent.left
                        anchors.leftMargin: 10
                        width:(parent.width)-20
                        font.family: "Candara"
                        font.pixelSize: 12
                        height: 40
                        wrapMode: TextEdit.WrapAnywhere


                    }
                } Rectangle{
                    id:sens
                    radius:5
                    width:parent.width
                    height: 100
                    visible:true
                    border.color: "#737373"
                    border.width: 1.2
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            sensorinput.focus=true
                        }
                    }
                    TextEdit{
                        id:sensorer
                        readOnly: true
                        anchors.top:parent.top
                        anchors.topMargin: 3
                        anchors.left:parent.left
                        anchors.leftMargin: 5
                        font.family: "Candara"
                        font.pixelSize: 14
                        text:"Sensorer: "

                    }
                    TextEdit{
                        id:sensorinput
                        anchors.top:sensorer.bottom
                        anchors.topMargin: 5
                        anchors.left:parent.left
                        anchors.leftMargin: 10
                        width:parent.width
                        font.family: "Candara"
                        font.pixelSize: 12
                        height: 80
                        Keys.onReturnPressed: {

                        }

                    }
                }
            }

        }
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            width:200
            height:30
            color:"transparent"
            ComboBox{
                id:combo
                anchors.left: parent.left
                anchors.leftMargin: 30
                width:130
                height:25
                style:ComboBoxStyle{
                    label: Component{
                        Text{
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text:"Velg fil"
                            font.family: "Candara"
                            font.pixelSize: 16
                            font.bold: false
                        }
                    }
                    background: Rectangle{
                        radius: 5
                        border.color: "#737373"
                        border.width: 1
                    }


                }


                model: ListModel{
                    ListElement{text:"Fil1"}
                    ListElement{text:"Fil2"}
                    ListElement{text:"Fil2"}
                }
            }
            Button{

                anchors.left:combo.right
                anchors.leftMargin: 5
                width:25
                height:25
                style:ButtonStyle{
                    label: Component{
                        Text{
                            text:"?"
                            color:"black"
                            font.family: "Georgia"
                            font.bold:true
                            font.pixelSize: 14
                            horizontalAlignment: Text.AlignHCenter
                            anchors.fill:parent
                        }
                    }
                    background: Rectangle{
                        border.width: 1
                        color: "#B6CAB4"
                        border.color: "#737373"
                        radius: 5
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
                onClicked: {
                    infoboks.visible=true
                }
            }
        }
        Rectangle{
            id:buttonLastned
            anchors.horizontalCenter: parent.horizontalCenter
            width: 220
            height: 50
            color: "#B6CAB4"
            Button{
                id:buttonlast
                anchors.centerIn: parent
                width: parent.width
                height: 45
                style:ButtonStyle{
                    label: Component{
                        Text{
                            text:"Last ned"
                            color: "Black"
                            font.family: "Candara"
                            font.pixelSize: 16
                            anchors.fill:parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    background: Rectangle{
                        border.width: 1.2
                        color: "#B6CAB4"
                        border.color: "#888"
                        radius: 5
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
                Keys.onReturnPressed: clicked()





                onClicked: {
                    if (focus && node.text==""){
                        boks.visible=true
                        warning2.visible=true
                    }
                    else {
                        boks.visible=true
                        prog.visible=true
                    }
                }
            }
            Rectangle{
                anchors.horizontalCenter: parent.horizontalCenter
                id:boks
                width:220
                height: 50
                color:"transparent"
                anchors.top:buttonlast.bottom
                visible: false

                TextInput{
                    id:warning2
                    visible: false
                    anchors.centerIn:parent
                    text:"Velg et gyldig nettverk navn \nfør du laster ned"
                }
                ProgressBar {
                    id:prog
                    visible: false
                    anchors.centerIn: parent
                    indeterminate: true

                }
            }

        }

    }
    Rectangle{
        id:infoboks
        visible: false
        anchors.centerIn: parent
        width: 400
        height: 350
        border.width: 1.2
        border.color: "grey"
        color: "#a8c0a5"
        radius:5

        Button{
            anchors.right:parent.right
            anchors.rightMargin: 5
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
                infoboks.visible=false
            }
        }
        TextEdit{
        anchors.top:parent.top
        anchors.topMargin:50
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: "white"
        width: parent.width
        height: parent.height
        wrapMode: Text.WrapAnywhere
        font.pixelSize: 18
        font.bold:true
        font.family: "Candara"
        text:"\n\n           Velg hvilken fil du ønsker å laste opp.\n\n\nOm du er usikker på hvilken du skal velge se info."
        }
    }
}

