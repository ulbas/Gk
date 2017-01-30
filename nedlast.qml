import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Rectangle {
    id:nedlastsiden
    width: 600
    height: 600
    color: "transparent"

    Column{
        id:kollonne1
        anchors.centerIn: parent
        spacing: 30

        Rectangle{
            id:nettboks
            width: 220
            height: 50
            radius:5
            border.color: "grey"
            border.width: 1.5


            TextInput{
                id:nettverk
                anchors.centerIn: nettboks
                font.pixelSize: 16
                Keys.onTabPressed:buttonlast.forceActiveFocus()
                text:"Velg nett"
                onFocusChanged: {
                    if(focus && nettverk.text== "Velg nett")
                        nettverk.text = ""
                    else if(nettverk.text=="")
                        nettverk.text = "Velg nett"
                }
            }
        }

            ComboBox{
                /*style:ComboBoxStyle{
                background: Rectangle{
                    color:"#9EAB9C"
                    border.color: "grey"
                    border.width: 1.5
                    width: 200
                }  //Har kommentert ut for jeg må lære meg med om design av comboboxer

                selectionColor: Text {
                    color: "lightblue"

                }

                }*/


                model: ListModel{
                    ListElement{text:"Fil1"}
                    ListElement{text:"Fil2"}
                    ListElement{text:"Fil2"}
                }
            }



        Rectangle{
            id:buttonLastned
            width: 220
            height: 50
            color: "#B6CAB4"
            Button{
                id:buttonlast
                style:ButtonStyle{
                    background: Rectangle{
                        border.width: 2
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
                anchors.fill: parent
                anchors.centerIn: buttonLastned

                text:"Last ned"

                onClicked: {
                    if (focus && nettverk.text==""){
                        boks.visible=true
                        warning2.visible=true
                    }
                    else{
                        boks.visible=true
                        prog.visible=true
                    }
                }
            }
            Rectangle{
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
}

