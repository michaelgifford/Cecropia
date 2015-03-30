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
        objectName: "mainForm"

        signal submitSubreddit(string subreddit_data)
        signal removeSubreddit(string subreddit_remove)


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

        function grapher(gsub, nscore, numposts, numcomments){

            score.height = nscore
            posts.height = numposts
            comments.height = numcomments

        }

        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent



        add_b.onClicked:
        {
            submitSubreddit(subreddit.text)
        }

        removesub1.onClicked:
        {
            var subText = sub1.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""
            // messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(subText)
        }

        removesub2.onClicked:
        {
            var subText = sub2.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""

            //messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(subText)
        }
        removesub3.onClicked:
        {
            var subText = sub3.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""

            //messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(subText)
        }
        removesub4.onClicked:
        {
            var subText = sub4.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""

            //messageDialog.show(qsTr("REMOVE"));
            removeSubreddit(subText)
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
