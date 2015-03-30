import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2


import "global_item_variables.js" as VarScript


ApplicationWindow {
    id: mainscreen
    title: qsTr("Reddt Visualizer")
    width: 1440
    height: 820
    visible: true

    signal submitKeyword(string keyword_data)

    signal removeSubreddit(string subreddit_remove)

<<<<<<< HEAD




=======
>>>>>>> FETCH_HEAD
    function grapher(gsub, nscore, numposts, numcomments){
        VarScript.sub1score = nscore
        VarScript.sub1posts = numposts
        VarScript.sub1comments = numcomments


       // messageDialog.show(qsTr("GRAPH!"));

    }

<<<<<<< HEAD
    function setSubn(text, number){



        switch(number) {
            case 0:
                VarScript.sub1text = ""
                VarScript.sub2text = ""
                VarScript.sub3text = ""
                VarScript.sub4text = ""
                break;
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





        console.log("calling the change")







        }











=======
>>>>>>> FETCH_HEAD
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
        signal submitSubreddit(string subreddit_data)
        objectName: "mainForm"

        function setSubn(text, number){
            console.log("Set text: ", text, " to ", number);
            switch(number) {
                case 0:
                    sub1.text = ""
                    sub2.text = ""
                    sub3.text = ""
                    sub4.text = ""
                    break;
                case 1:
                    sub1.text = text
                    break;
                case 2:
                    sub2.text = text
                    break;
                case 3:
                    sub3.text = text
                    break;
                case 4:
                    sub4.text = text
                    break;
            }
        }

        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent



        add_b.onClicked:
        {
            submitSubreddit(subreddit.text)
<<<<<<< HEAD

         //   callf()
           // console.log(callf())

            sub1.text = VarScript.sub1text
            sub2.text = VarScript.sub2text
            sub3.text = VarScript.sub3text
            sub4.text = VarScript.sub4text

=======
>>>>>>> FETCH_HEAD
        }

        removesub1.onClicked:
        {

            VarScript.sub1text = ""
            VarScript.sub2text = ""
            VarScript.sub3text = ""
            VarScript.sub4text = ""

            // messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(sub1.text)

            sub1.text = VarScript.sub1text
            sub2.text = VarScript.sub2text
            sub3.text = VarScript.sub3text
            sub4.text = VarScript.sub4text


        }

        removesub2.onClicked:
        {
            VarScript.sub1text = ""
            VarScript.sub2text = ""
            VarScript.sub3text = ""
            VarScript.sub4text = ""

            //messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(sub2.text)

            sub1.text = VarScript.sub1text
            sub2.text = VarScript.sub2text
            sub3.text = VarScript.sub3text
            sub4.text = VarScript.sub4text
        }
        removesub3.onClicked:
        {
            VarScript.sub1text = ""
            VarScript.sub2text = ""
            VarScript.sub3text = ""
            VarScript.sub4text = ""

            //messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(sub3.text)

            sub1.text = VarScript.sub1text
            sub2.text = VarScript.sub2text
            sub3.text = VarScript.sub3text
            sub4.text = VarScript.sub4text


        }
        removesub4.onClicked:
        {
            VarScript.sub1text = ""
            VarScript.sub2text = ""
            VarScript.sub3text = ""
            VarScript.sub4text = ""

            //messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(sub4.text)

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
            posts.height = (VarScript.sub1posts*2);
            score.height = (VarScript.sub1score/23);
            comments.height = (VarScript.sub1comments/5);

            submitKeyword(keyword.text)

            //donedata();

            posts.height = (VarScript.sub1posts*2);
            score.height = (VarScript.sub1score/23);
            comments.height = (VarScript.sub1comments/5);
        }






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
