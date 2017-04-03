import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4


Rectangle {
    id: nedlastContainer
    width: 600
    height: 600
    color: "transparent"

    property string nodenummer: ""
    property string omradenr: ""
    property string forklaring: ""
    property var sensorer: [];
    property string kryptering: ""
    property string beskrivelse: ""


    Column{
        anchors.centerIn: parent
        id:column1
        Rectangle{
            id:textboks
            width: 700
            height: 550
            color: "white"
            border.color: "#5C5E5C"
            border.width: 1
            radius:5
            Rectangle{
                id:recbar
                width:parent.width
                height:30
                color:"#9EAB9C"
                border.width: 1
                border.color: "#5C5E5C"
                radius:1

                Button{
                    id:nynode


                    anchors.left: parent.left
                    width: 100
                    height: parent.height
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"NY NODE"
                                color:"white"
                                font.family: "Segoe UI Black"
                                font.bold:true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill:parent

                            }
                        }
                        background: Rectangle{
                            border.width: 1.2
                            color: "transparent"
                            border.color: "transparent"
                            radius: 1
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                    onClicked:
                    {
                        one.visible=true

                        eksisterende_liste.visible=false
                    }
                }


                Button{
                    id:eksisterende



                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    height: parent.height
                    width:100
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"EKSISTERENDE"
                                color:"white"
                                font.family: "Segoe UI Black"
                                font.bold:true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill:parent

                            }
                        }
                        background: Rectangle{
                            border.width: 1.2
                            color: "transparent"
                            border.color: "transparent"
                            radius: 1
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                    onClicked:
                    {
                        one.visible=false

                        eksisterende_liste.visible=true

                        utility.readJSONFIle();

                    }
                }
            }
            Rectangle{
                id:one
                visible: true
                anchors.top:recbar.bottom

                Rectangle{
                    id:firstrow
                    width: parent.width
                    height: 50
                    border.color: "grey"



                    Rectangle{
                        id:filsel
                        anchors.left:firstrow.left
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height
                        color: "#9EAB9C"
                        border.width: 1
                        border.color: "grey"
                        width: 700
                        Rectangle{
                            id:områdenr
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left:parent.left
                            anchors.leftMargin: 25
                            radius:5
                            width:130
                            height: 38
                            border.width: 1.5
                            border.color: "grey"
                            color: "white"

                            TextInput{
                                readOnly: true
                                anchors.left:parent.left
                                anchors.top:parent.top
                                anchors.leftMargin: 5
                                anchors.topMargin: 3
                                text:"OMRÅDE NR:"
                                font.pixelSize: 10
                                color:"grey"
                            }
                            TextEdit{
                                id:omradetext

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top:parent.top
                                anchors.topMargin: 13
                                font.pixelSize: 18

                                onTextChanged: {
                                    nedlastContainer.omradenr = text;
                                }


                            }

                        }
                        Rectangle{
                            id:nodenr
                            anchors.left:parent.left
                            anchors.leftMargin: 170
                            anchors.verticalCenter: parent.verticalCenter
                            height: 38
                            width: 130
                            radius:5
                            border.width: 1.5
                            border.color: "grey"
                            color:"white"
                            TextInput{
                                readOnly: true
                                anchors.left:parent.left
                                anchors.top:parent.top
                                anchors.leftMargin: 5
                                anchors.topMargin: 3
                                text:"NODE ID:"
                                font.pixelSize: 10
                                color:"grey"
                            }
                            TextEdit{
                                id:node
                                text:""
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top:parent.top
                                anchors.topMargin: 13
                                font.pixelSize: 18
                                onFocusChanged: {

                                }

                                onTextChanged: {
                                    nedlastContainer.nodenummer = text;
                                }

                            }

                        }
                        ComboBox{
                            id:combo

                            anchors.right: parent.right
                            anchors.rightMargin: 30
                            anchors.verticalCenter: parent.verticalCenter
                            width:300
                            height:30
                            editable: true
                            style:ComboBoxStyle{


                                background: Rectangle{
                                    color:"darkgrey"
                                    radius: 5
                                    border.color: "grey"
                                    border.width: 1.5

                                }
                            }

                            model: utility.getListOfNodeFiles()
                            onAccepted: {
                                console.log("Last ned clicked...")
                                utility.runArduinoFile(currentText);
                            }

                            Component.onCompleted: {
                                currentIndex = 1
                            }
                        }
                    }
                }
                Rectangle{
                    id:descript
                    anchors.left:parent.left

                    anchors.top:parent.top
                    anchors.topMargin: 50
                    width: 700
                    color: "#9EAB9C"
                    height: 200
                    border.color: "grey"
                    Rectangle{
                        id:descriptboks
                        color:"white"
                        border.color: "grey"
                        border.width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 650
                        height:parent.height
                        TextInput{

                            text:"Forklaring:"
                            font.pixelSize: 16
                            font.family:"Candara"
                            anchors.top:parent.top
                            anchors.left: parent.left
                            anchors.topMargin: 5
                            anchors.leftMargin: 5
                            color:"grey"
                        }
                        TextEdit{
                            font.family: "Candara"
                            font.pixelSize: 14
                            anchors.top:parent.top
                            anchors.topMargin: 30
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.rightMargin: 20
                            anchors.leftMargin: 20
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20

                            property bool firstclick: false

                            text:"Sett inn forklaring her"

                            onActiveFocusChanged: {
                                if(activeFocus & ! firstclick){
                                    firstclick = true;
                                    text = "";
                                }

                            }
                            onTextChanged: {
                                nedlastContainer.forklaring = text;
                            }
                        }

                    }
                }
                Rectangle{
                    id:bottombar
                    anchors.top:descript.bottom
                    anchors.left:parent.left

                    border.color: "grey"
                    border.width: 1
                    color: "#9EAB9C"
                    width: 700
                    height: 280



                    Rectangle{
                        width: 200
                        height: 40
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.topMargin: 5
                        anchors.leftMargin: 25
                        radius: 5
                        border.color: "grey"
                        border.width: 1.5
                        TextInput{
                            readOnly: true
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: 5
                            anchors.topMargin: 3
                            text:"Krypterings nøkkel:"
                            font.pixelSize: 10
                            color:"grey"
                        }
                        TextEdit{
                            id:krypteringinfo
                            text:""
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top:parent.top
                            anchors.topMargin: 13
                            font.pixelSize: 18
                            onFocusChanged: {

                            }

                            onTextChanged: {
                                nedlastContainer.kryptering = text;
                            }

                        }
                    }
                    Rectangle{
                        width: 300
                        height: 40
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.topMargin: 5
                        anchors.leftMargin: 375
                        radius: 5
                        border.color: "grey"
                        border.width: 1.5
                        TextInput{
                            readOnly: true
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: 5
                            anchors.topMargin: 3
                            text:"Område beskrivelse:"
                            font.pixelSize: 10
                            color:"grey"
                        }
                        TextEdit{
                            id:omraadebeskrivelse
                            text:""
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top:parent.top
                            anchors.topMargin: 13
                            font.pixelSize: 18
                            onFocusChanged: {

                            }

                            onTextChanged: {
                                nedlastContainer.beskrivelse = text;
                                console.log("Beskrivelse: "  + nedlastContainer.beskrivelse)
                            }

                        }
                    }

                    CheckBox {
                        anchors.left:parent.left
                        anchors.top:parent.top
                        anchors.leftMargin: 80
                        anchors.topMargin: 110
                        style: CheckBoxStyle {
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 3
                                border.color: control.activeFocus ? "darkblue" : "gray"
                                border.width: 1
                                Rectangle {
                                    visible: control.checked
                                    color: "#555"
                                    border.color: "#333"
                                    radius: 1
                                    anchors.margins: 4
                                    anchors.fill: parent
                                }
                            }
                            label:Component{
                                Text{
                                    text:qsTr("  LUFT")
                                    font.pixelSize: 16
                                    color: "white"
                                    font.bold:true
                                    font.family: "Segoe UI Black"
                                }
                            }
                        }

                        onCheckedChanged: {
                            if(checked){
                                if(nedlastContainer.sensorer.indexOf("FORURENSNING") == -1){
                                    nedlastContainer.sensorer.push("FORURENSNING");
                                }
                            }
                            if(!checked){
                                if(nedlastContainer.sensorer.indexOf("FORURENSNING")!=-1){
                                    nedlastContainer.sensorer.pop("FORURENSNING");
                                }
                            }
                        }
                    }
                    CheckBox {
                        anchors.left:parent.left
                        anchors.top:parent.top
                        anchors.leftMargin: 80
                        anchors.topMargin: 80
                        style: CheckBoxStyle {
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 3
                                border.color: control.activeFocus ? "darkblue" : "gray"
                                border.width: 1
                                Rectangle {
                                    visible: control.checked
                                    color: "#555"
                                    border.color: "#333"
                                    radius: 1
                                    anchors.margins: 4
                                    anchors.fill: parent
                                }
                            }
                            label:Component{
                                Text{
                                    text:qsTr("  FUKTIGHET")
                                    font.pixelSize:16
                                    color: "white"
                                    font.bold:true
                                    font.family: "Segoe UI Black"
                                }
                            }
                        }
                        onCheckedChanged: {
                            if(checked){
                                if(nedlastContainer.sensorer.indexOf("FUKTIGHET") == -1){
                                    nedlastContainer.sensorer.push("FUKTIGHET");
                                }
                            }
                            if(!checked){
                                if(nedlastContainer.sensorer.indexOf("FUKTIGHET")!=-1){
                                    nedlastContainer.sensorer.pop("FUKTIGHET");
                                }
                            }
                        }
                    }








                    CheckBox {
                        anchors.left:parent.left
                        anchors.top:parent.top
                        anchors.leftMargin: 80
                        anchors.topMargin: 140
                        style: CheckBoxStyle {
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 3
                                border.color: control.activeFocus ? "darkblue" : "gray"
                                border.width: 1
                                Rectangle {
                                    visible: control.checked
                                    color: "#555"
                                    border.color: "#333"
                                    radius: 1
                                    anchors.margins: 4
                                    anchors.fill: parent
                                }
                            }
                            label:Component{
                                Text{
                                    text:qsTr("  LYS")
                                    font.pixelSize:16
                                    color: "white"
                                    font.bold:true
                                    font.family: "Segoe UI Black"
                                }
                            }
                        }
                        onCheckedChanged: {
                            if(checked){
                                if(nedlastContainer.sensorer.indexOf("LYS") == -1){
                                    nedlastContainer.sensorer.push("LYS");
                                }
                            }
                            if(!checked){
                                if(nedlastContainer.sensorer.indexOf("LYS")!=-1){
                                    nedlastContainer.sensorer.pop("LYS");
                                }
                            }
                        }


                    }
                    CheckBox {
                        anchors.left:parent.left
                        anchors.top:parent.top
                        anchors.leftMargin: 80
                        anchors.topMargin: 170
                        style: CheckBoxStyle {
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 3
                                border.color: control.activeFocus ? "darkblue" : "gray"
                                border.width: 1
                                Rectangle {
                                    visible: control.checked
                                    color: "#555"
                                    border.color: "#333"
                                    radius: 1
                                    anchors.margins: 4
                                    anchors.fill: parent
                                }
                            }
                            label:Component{
                                Text{
                                    text:qsTr("  TEMPERATUR")
                                    font.pixelSize:16
                                    color: "white"
                                    font.bold:true
                                    font.family: "Segoe UI Black"
                                }
                            }

                        }
                        onCheckedChanged: {
                            if(checked){
                                if(nedlastContainer.sensorer.indexOf("TEMPERATUR") == -1){
                                    nedlastContainer.sensorer.push("TEMPERATUR");
                                }
                            }
                            if(!checked){
                                if(nedlastContainer.sensorer.indexOf("TEMPERATUR")!=-1){
                                    nedlastContainer.sensorer.pop("TEMPERATUR");
                                }
                            }
                        }
                    }




                    Rectangle{
                        anchors.right:bottombar.right
                        anchors.top:bottombar.top
                        height: bottombar.height
                        color: "transparent"
                        width: 300
                        id:knapper
                        Button{
                            id:nyttomrade
                            anchors.top:knapper.top
                            anchors.topMargin: 80
                            anchors.right: knapper.right
                            anchors.rightMargin: 100
                            width: 150
                            height: 35
                            style:ButtonStyle{
                                label: Component{
                                    Text{
                                        text:"NYTT OMRÅDE"
                                        font.bold: true
                                        color:"black"
                                        font.family: "Calibri"
                                        font.pixelSize:14
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.fill:parent

                                    }
                                }
                                background: Rectangle{
                                    border.width: 1.2
                                    radius: 5
                                    border.color: "grey"
                                    gradient: Gradient {
                                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                    }
                                }
                            }
                            onClicked: {
                                nyttom.visible=true

                            }
                        }

                        Button{
                            id:lagre
                            anchors.top:knapper.top
                            anchors.right:knapper.right
                            anchors.topMargin: 145
                            anchors.rightMargin: 100
                            width:150

                            height: 35

                            onClicked: {
                                console.log("Lagrer med beskrivelse: " + nedlastContainer.beskrivelse)


                                var _nynr = parseInt(nedlastContainer.nodenummer) + 1;
                                if(node.text=="")
                                {
                                    varselboks.visible=true
                                    varsel.text="Du må sette opp nytt området før du kan lagre!"
                                    return
                                }
                                utility.setupINOFile("" + _nynr, nedlastContainer.omradenr, nedlastContainer.kryptering);
                                utility.addNode(nedlastContainer.nodenummer, nedlastContainer.omradenr,
                                                nedlastContainer.forklaring,nedlastContainer.sensorer,nedlastContainer.beskrivelse,nedlastContainer.kryptering);


                                node.text++
                            }


                            style:ButtonStyle{
                                label: Component{
                                    Text{
                                        text:"LAGRE"
                                        font.bold: true
                                        color:"black"
                                        font.family: "Calibri"
                                        font.pixelSize:14
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.fill:parent

                                    }
                                }
                                background: Rectangle{
                                    border.width: 1.2
                                    radius: 5
                                    border.color: "grey"
                                    gradient: Gradient {
                                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                    }
                                }
                            }



                        }
                        Button{
                            id:lastned
                            anchors.bottom:knapper.bottom
                            anchors.right:knapper.right
                            anchors.bottomMargin: 35
                            anchors.rightMargin: 100
                            width:150
                            height: 35
                            style:ButtonStyle{
                                label: Component{
                                    Text{
                                        text:"LAST NED"
                                        color:"black"
                                        font.bold: true
                                        font.family: "Calibri"
                                        font.pixelSize:14
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.fill:parent

                                    }
                                }
                                background: Rectangle{
                                    border.width: 1.2
                                    radius: 5
                                    border.color: "grey"
                                    gradient: Gradient {
                                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                    }
                                }
                            }
                            onClicked:{
                                combo.forceActiveFocus()

                            }

                        }

                    }
                }
            }
            Rectangle{

                visible: false
                id:varselboks
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width:430
                height: 130
                color:"#9EAB9C"
                radius: 5
                border.color: "grey"
                border.width: 1
                Button{
                    width: 20
                    height: 20
                    anchors.top:parent.top
                    anchors.topMargin: 10
                    anchors.right:parent.right
                    anchors.rightMargin: 5
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"X"
                                font.bold: true
                                color:"black"
                                font.family: "Calibri"
                                font.pixelSize:14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill:parent

                            }
                        }
                        background: Rectangle{
                            border.width: 1.2
                            radius: 5
                            border.color: "grey"
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                    onClicked: {varselboks.visible=false}

                }

                Rectangle{
                    width: 400
                    height: 40
                    radius:5
                    anchors.centerIn: parent
                    border.color: "grey"
                    border.width: 1
                    TextInput {
                        id: varsel
                        text: ""
                        anchors.centerIn: parent
                    }
                }
            }

            Rectangle{
                id:eksisterende_liste
                visible:false
                anchors.top:recbar.bottom
                height:530
                width:700
                border.color: "grey"
                color: "#9EAB9C"

                Rectangle{
                    id:firstrow2
                    width: parent.width
                    height: 50
                    border.color: "grey"
                    border.width: 1.5


                    Rectangle{
                        id:filsel2
                        anchors.left:firstrow2.left
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height
                        color: "#9EAB9C"
                        border.width: 1.3
                        border.color: "grey"
                        width:parent.width
                        Rectangle{
                            id:områdenr2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left:parent.left
                            anchors.leftMargin: 25
                            radius:5
                            width:130
                            height: 38
                            border.width: 1.5
                            border.color: "grey"
                            color: "white"

                            TextInput{
                                readOnly: true
                                anchors.left:parent.left
                                anchors.top:parent.top
                                anchors.leftMargin: 5
                                anchors.topMargin: 3
                                text:"OMRÅDE NR:"
                                font.pixelSize: 10
                                color: "grey"
                            }
                            TextEdit{
                                id:omradetext2
                                readOnly: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top:parent.top
                                anchors.topMargin: 13
                                font.pixelSize: 18




                            }

                        }

                        Rectangle{
                            id:nodenr2
                            anchors.left:parent.left
                            anchors.leftMargin: 170
                            anchors.verticalCenter: parent.verticalCenter
                            height: 38
                            width: 130
                            radius:5
                            border.width: 1.5
                            border.color: "grey"
                            color:"white"
                            TextInput{
                                readOnly: true
                                anchors.left:parent.left
                                anchors.top:parent.top
                                anchors.leftMargin: 5
                                anchors.topMargin: 3
                                text:"NODE ID:"
                                font.pixelSize: 10
                                color: "grey"
                            }
                            TextEdit{
                                id:node2
                                text:""
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top:parent.top
                                anchors.topMargin: 13
                                font.pixelSize: 18
                                onFocusChanged: {
                                    if(focus && node2.text == "1")
                                        sentralen.text = ""
                                    else if(node2.text=="")
                                        node2.text = ""
                                }



                            }

                        }

                    }
                }
                Rectangle{
                    id:listeboks
                    anchors.top: firstrow2.bottom
                    anchors.horizontalCenter: parent.horizontalCenter


                    color: "white"
                    height: 200
                    width: 650
                    border.color:"grey"
                    border.width: 1

                    ListView{
                        id: gkNodeListView
                        anchors.fill: parent
                        model: utility.ptr.model
                        spacing: 0
                        delegate: Rectangle {
                            id:nodebokser
                            width: parent.width
                            height: 15
                            color: "lightgrey"
                            border.color: "grey"
                            MouseArea{
                                anchors.fill:parent
                                hoverEnabled: true
                                onEntered: nodebokser.color="grey"
                                onExited: nodebokser.color="lightgrey"
                                onClicked: {
                                    forklaringeks.text=forklaring
                                    node2.text=nodenr
                                    omradetext2.text=model.omraadenr
                                    krypteringinfo2.text=model.kryptering
                                    omraadebeskrivelse2.text=model.beskrivelse

                                    gkNodeListView.currentIndex = index


                                }


                            }

                            Component.onCompleted: {
                                console.log("Component done..")
                            }

                            Text {
                                anchors.centerIn: parent
                                text: model.omraadenr + " - "+model.nodenr +" : " +model.forklaring
                            }

                            property var sensorList: model.sensorer
                            onSensorListChanged: {
                                console.log("Sensorer is: "+ sensorList)
                            }
                        }

                        Component.onCompleted: {
                            console.log("Model: " + model)
                            console.log("Model size from QML side: " + model.count())
                        }
                    }



                }
                Rectangle{
                    id:bottombar2
                    anchors.top:listeboks.top
                    anchors.left:parent.left
                    anchors.bottom:parent.bottom
                    anchors.topMargin: 200
                    border.color: "grey"
                    border.width: 1
                    color: "#9EAB9C"
                    width: 700
                    height: 250

                    Rectangle{
                        width: 200
                        height: 40
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.topMargin: 5
                        anchors.leftMargin: 25
                        radius: 5
                        border.color: "grey"
                        border.width: 1.5
                        TextInput{
                            readOnly: true
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: 5
                            anchors.topMargin: 3
                            text:"Krypterings nøkkel:"
                            font.pixelSize: 10
                            color:"grey"
                        }
                        TextEdit{
                            id:krypteringinfo2
                            readOnly: true
                            text:""
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top:parent.top
                            anchors.topMargin: 13
                            font.pixelSize: 18
                            onFocusChanged: {

                            }



                        }
                    }
                    Rectangle{
                        width: 300
                        height: 40
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.topMargin: 5
                        anchors.leftMargin: 375
                        radius: 5
                        border.color: "grey"
                        border.width: 1.5
                        TextInput{
                            readOnly: true
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: 5
                            anchors.topMargin: 3
                            text:"Område beskrivelse:"
                            font.pixelSize: 10
                            color:"grey"
                        }
                        TextEdit{
                            id:omraadebeskrivelse2
                            text:""
                            readOnly: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top:parent.top
                            anchors.topMargin: 13
                            font.pixelSize: 18
                            onFocusChanged: {

                            }


                        }
                    }

                    Rectangle{
                        id:col
                        anchors.left:parent.left
                        anchors.leftMargin: 80
                        anchors.top:parent.top
                        anchors.topMargin: 80
                        width:275
                        height: 200
                        color: "transparent"

                        Column{
                            spacing: 30

                            CheckBox {
                                id:fuktighet2
                                style: CheckBoxStyle {
                                    indicator: Rectangle {
                                        implicitWidth: 20
                                        implicitHeight: 20
                                        radius: 3
                                        border.color: control.activeFocus ? "darkblue" : "gray"
                                        border.width: 1
                                        Rectangle {
                                            visible: control.checked
                                            color: "#555"
                                            border.color: "#333"
                                            radius: 1
                                            anchors.margins: 4
                                            anchors.fill: parent
                                        }
                                    }
                                    label:Component{
                                        Text{
                                            text:qsTr("  FUKTIGHET")
                                            font.pixelSize:16
                                            color: "white"
                                            font.bold:true
                                            font.family: "Segoe UI Black"
                                        }
                                    }
                                }


                                checked:gkNodeListView.currentItem.sensorList.indexOf("FUKTIGHET") !== -1



                            }
                        }
                    }
                    Rectangle{
                        id:col2
                        anchors.left:parent.left
                        anchors.leftMargin: 80
                        anchors.top:parent.top
                        anchors.topMargin: 110
                        width:275
                        height: 200
                        color: "transparent"

                        Column{
                            spacing: 30

                            CheckBox {
                                style: CheckBoxStyle {
                                    indicator: Rectangle {
                                        implicitWidth: 20
                                        implicitHeight: 20
                                        radius: 3
                                        border.color: control.activeFocus ? "darkblue" : "gray"
                                        border.width: 1
                                        Rectangle {
                                            visible: control.checked
                                            color: "#555"
                                            border.color: "#333"
                                            radius: 1
                                            anchors.margins: 4
                                            anchors.fill: parent
                                        }
                                    }
                                    label:Component{
                                        Text{
                                            text:qsTr("  LUFT")
                                            font.pixelSize:16
                                            color: "white"
                                            font.bold:true
                                            font.family: "Segoe UI Black"
                                        }
                                    }
                                }
                                onCheckedChanged: {

                                }


                            }
                        }
                    }
                    Rectangle{
                        id:col3
                        anchors.left:parent.left
                        anchors.leftMargin: 80
                        anchors.top:parent.top
                        anchors.topMargin: 140
                        width:275
                        height: 200
                        color: "transparent"

                        Column{
                            spacing: 30

                            CheckBox {
                                style: CheckBoxStyle {
                                    indicator: Rectangle {
                                        implicitWidth: 20
                                        implicitHeight: 20
                                        radius: 3
                                        border.color: control.activeFocus ? "darkblue" : "gray"
                                        border.width: 1
                                        Rectangle {
                                            visible: control.checked
                                            color: "#555"
                                            border.color: "#333"
                                            radius: 1
                                            anchors.margins: 4
                                            anchors.fill: parent
                                        }
                                    }
                                    label:Component{
                                        Text{
                                            text:qsTr("  LYS")
                                            font.pixelSize:16
                                            color: "white"
                                            font.bold:true
                                            font.family: "Segoe UI Black"
                                        }
                                    }
                                }
                                onCheckedChanged: {

                                }


                            }
                        }
                    }
                    Rectangle{
                        id:col4
                        anchors.left:parent.left
                        anchors.leftMargin: 80
                        anchors.top:parent.top
                        anchors.topMargin: 170
                        width:275
                        height: 200
                        color: "transparent"

                        Column{
                            spacing: 30


                            CheckBox {
                                style: CheckBoxStyle {
                                    indicator: Rectangle {
                                        implicitWidth: 20
                                        implicitHeight: 20
                                        radius: 3
                                        border.color: control.activeFocus ? "darkblue" : "gray"
                                        border.width: 1
                                        Rectangle {
                                            visible: control.checked
                                            color: "#555"
                                            border.color: "#333"
                                            radius: 1
                                            anchors.margins: 4
                                            anchors.fill: parent
                                        }
                                    }
                                    label:Component{
                                        Text{
                                            text:qsTr("  TEMPERATUR")
                                            font.pixelSize:16
                                            color: "white"
                                            font.bold:true
                                            font.family: "Segoe UI Black"
                                        }
                                    }
                                }
                                onCheckedChanged: {


                                }


                            }
                        }
                    }
                    Rectangle{
                        id:fork
                        anchors.right:parent.right
                        anchors.rightMargin: 25
                        anchors.top:parent.top
                        anchors.topMargin: 80
                        width: 350
                        height: 100
                        radius: 5
                        border.color: "grey"
                        border.width: 1.5
                        MouseArea{
                            anchors.fill:parent
                            onClicked:{

                                forklaringseks.forceActiveFocus()
                            }
                        }
                        TextInput{
                            readOnly: true
                            text:"Forklaring om noden"
                            font.pixelSize: 10
                            color: "grey"
                            anchors.top:parent.top
                            anchors.topMargin: 5
                            anchors.left:parent.left
                            anchors.leftMargin: 5
                        }

                        TextInput{
                            id:forklaringeks
                            anchors.top:parent.top
                            anchors.topMargin: 20
                            anchors.left:parent.left
                            anchors.leftMargin: 15
                            anchors.right:parent.right
                            anchors.bottom: parent.bottom
                            font.pixelSize: 14
                            text:""
                            property bool firstClick: false
                            onFocusChanged: {
                                if(!focus && text.length == 0){
                                    text = "                          Område ID                           "
                                }

                                if(focus ){
                                    firstClick = true
                                    text = "";
                                }
                            }

                        }
                    }
                    Button{
                        id:nylagring
                        width:100
                        height: 30
                        anchors.right: parent.right
                        anchors.rightMargin: 30
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: 20
                        style:ButtonStyle{
                            label: Component{
                                Text{
                                    text:"NY LAGRING"
                                    font.bold: true
                                    color:"black"
                                    font.family: "Calibri"
                                    font.pixelSize:14
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.fill:parent

                                }
                            }
                            background: Rectangle{
                                border.width: 1.2
                                radius: 5
                                border.color: "grey"
                                gradient: Gradient {
                                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                                }
                            }
                        }

                        onClicked: {
                            console.log("Lagring: "  + forklaringeks.text + "at index: " + gkNodeListView.currentIndex)
                            utility.model.changeForklaring(forklaringeks.text, gkNodeListView.currentIndex)
                            utility.writeToJSONFile("noder.txt")
                        }
                    }
                }


            }
        }
    }
    Rectangle{
        id:nyttom
        visible: false
        anchors.centerIn: parent
        height: 400
        width: 400
        radius: 5
        border.color: "grey"
        border.width: 2
        color: "#9EAB9C"
        Rectangle{
            width: 350
            height: 40
            radius:5
            border.color: "grey"
            border.width: 1
            anchors.top:parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    områdeIDText.forceActiveFocus()
                }
            }
            TextInput{
                readOnly: true
                text:"Velg ID for det nye området. (F.eks. B1 for byggning 1)"
                font.pixelSize: 10
                color:"grey"
                anchors.top:parent.top
                anchors.topMargin: 2
                anchors.left:parent.left
                anchors.leftMargin: 10
            }
            TextInput{
                id: områdeIDText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:parent.top
                anchors.topMargin: 15
                font.pixelSize: 16
                KeyNavigation.tab:områdeFull
                text:"                          Område ID                           "
                property bool firstClick: false
                onFocusChanged: {
                    if(!focus && text.length == 0){
                        text = "                          Område ID                           "
                    }

                    if(focus ){
                        firstClick = true
                        text = "";
                    }
                }




            }

        }
        Rectangle{
            id:omradebeskrivelse
            width: 350
            height: 40
            radius:5
            border.color: "grey"
            border.width: 1
            anchors.top:parent.top
            anchors.topMargin: 120
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    områdeFull.forceActiveFocus()
                }
            }
            TextInput{
                readOnly: true
                text:"Beskrivelse av området nodene skal settes opp."
                font.pixelSize: 10
                color:"grey"
                anchors.top:parent.top
                anchors.topMargin: 2
                anchors.left:parent.left
                anchors.leftMargin: 10
            }

            TextInput{
                id: områdeFull
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height
                font.pixelSize: 14
                text:"Skriv det fulle navnet på området."
                KeyNavigation.tab:krypteringtext
                property bool firstClick: false

                onFocusChanged: {
                    if(!focus && text.length == 0){
                        text = "Skriv det fulle navnet på området."
                    }

                    if(focus ){
                        firstClick = true
                        text = "";
                    }
                }


            }
        }
        Rectangle{
            id:krypteringboks
            width: 350
            radius: 5
            height:40
            anchors.top:omradebeskrivelse.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "grey"
            border.width: 1
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    krypteringtext.forceActiveFocus()
                }
            }
            TextInput{
                anchors.top:parent.top
                anchors.topMargin: 2
                anchors.left:parent.left
                anchors.leftMargin: 15
                text:"Sett inn krypterings nøkkel."
                font.pixelSize: 10
                color: "grey"
            }
            TextInput{
                id:krypteringtext
                anchors.top: krypteringboks.top
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height
                font.pixelSize: 14
                text:"Krypterings nøkkel"


                property bool firstClick: false
                onFocusChanged: {
                    if(!focus && text.length == 0){
                        text = "Krypterings nøkkel"
                    }

                    if(focus ){
                        firstClick = true
                        text = "";
                    }
                }
            }
        }

        Button{

            anchors.top:parent.top
            anchors.topMargin: 10

            anchors.right: parent.right
            anchors.rightMargin: 10
            height: 20
            width: 20
            style:ButtonStyle{
                label: Component{
                    Text{
                        text:"X"
                        font.bold: true
                        color:"black"
                        font.family: "Calibri"
                        font.pixelSize:14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill:parent

                    }
                }
                background: Rectangle{
                    border.width: 1.2
                    radius: 5

                    border.color: "grey"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }
            onClicked: {
                nyttom.visible=false
                nedlastContainer.forceActiveFocus();
                krypteringtext.text="Krypterings nøkkel"

            }
        }

        Button{
            id:nyttområdeknapp

            anchors.bottom:parent.bottom
            anchors.bottomMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            width:200
            height: 40
            Keys.onReturnPressed:clicked
            onClicked: {
                if(områdeFull.text.length>=1 && områdeIDText.text.length>=1)
                {
                    nyttom.visible=false
                }

                if(krypteringtext.text.length!=16) {
                    varselboks.visible=true
                    varsel.text="Du må gi krypteringsnøkkelen 16 tall!"
                    return;
                }


                node.text="2"
                omraadebeskrivelse.text=områdeFull.text
                if(omraadebeskrivelse.text==områdeFull.text)
                    områdeFull.text="Skriv det fulle navnet på området."
                krypteringinfo.text=krypteringtext.text
                if(krypteringinfo.text==krypteringtext.text)
                    krypteringtext.text="Krypterings nøkkel"
                omradetext.text= områdeIDText.text
                if(omradetext.text==områdeIDText.text)
                    områdeIDText.text="                          Område ID                           "

                utility.setupINOFile(nedlastContainer.nodenummer, nedlastContainer.omradenr, nedlastContainer.kryptering);
            }


            style:ButtonStyle{
                label: Component{
                    Text{
                        text:"LAGRE NYTT OMRÅDE"
                        font.bold: true
                        color:"black"
                        font.family: "Calibri"
                        font.pixelSize:14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill:parent

                    }
                }
                background: Rectangle{
                    border.width: 1.2
                    radius: 5
                    border.color: "grey"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }



        }


    }
}





