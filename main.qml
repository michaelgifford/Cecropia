import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2


import "global_item_variables.js" as VarScript


ApplicationWindow {
    title: qsTr("Reddt Visualizer")
    width: 1440
    height: 820
    visible: true

    signal submitKeyword(string keyword_data)

    signal submitSubreddit(string subreddit_data)


    function sendGraph(nscore, numposts, numcomments){



    }



    function setSubn(text, number){
        switch(number) {
            case 1:
                VarScript.sub1text = text
                break;
            case 2:
                VarScript.sub2text = text
                break;
            case 3:
                VarScript.sub3text = text
                break;
            case 4:
                VarScript.sub4text = text
                break;
        }
       // VarScript.sub1text= text
        console.log(VarScript.sub1color)

    }








    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }


    MainForm {



        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        add_b.onClicked:
        {
            submitSubreddit(subreddit.text)

            sub1.text = VarScript.sub1text
            sub2.text = VarScript.sub2text
            sub3.text = VarScript.sub3text
            sub4.text = VarScript.sub4text
        }




        clear_b.onClicked:
        {
            subreddit.text = ""
            keyword.text = ""


        }


        visualize_b.onClicked:
        {
            submitKeyword(keyword.text)

            //key_display.text = keyword.text
        }
    /*    function superGraph(nscore, numposts, numcomments){

        } */





    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
