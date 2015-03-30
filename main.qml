import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2




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
        function cleargraph(){
            score1.width = score2.width = score3.width = score4.width =5
            posts1.width = posts2.width = posts3.width = posts4.width = 5
            comments1.width = comments2.width = comments3.width = comments4.width = 5
        }

        function graph1(gsub, nscore, numposts, numcomments){

            cleargraph()

            score1.width = ((nscore/numposts)-1)*10
            posts1.width = numposts*5
            comments1.width = ((numcomments/numposts)-1)*10


        }

        function graph2(gsub, nscore, numposts, numcomments){

            score2.width = ((nscore/numposts)-1)*10
            posts2.width = numposts*5
            comments2.width = ((numcomments/numposts)-1)*10


        }
        function graph3(gsub, nscore, numposts, numcomments){

            score3.width = ((nscore/numposts)-1)*10
            posts3.width = numposts*5
            comments3.width = ((numcomments/numposts)-1)*10


        }

        function graph4(gsub, nscore, numposts, numcomments){

            score4.width = ((nscore/numposts)-1)*10
            posts4.width = numposts*5
            comments4.width = ((numcomments/numposts)-1)*10

        }


        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent



        add_b.onClicked:
        {
            submitSubreddit(subreddit.text)
            subreddit.text = ""
        }

        removesub1.onClicked:
        {
            var subText = sub1.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""

            removeSubreddit(subText)
        }

        removesub2.onClicked:
        {
            var subText = sub2.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""

            removeSubreddit(subText)
        }
        removesub3.onClicked:
        {
            var subText = sub3.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""


            removeSubreddit(subText)
        }
        removesub4.onClicked:
        {
            var subText = sub4.text;
            sub1.text = ""
            sub2.text = ""
            sub3.text = ""
            sub4.text = ""


            removeSubreddit(subText)
        }








        visualize_b.onClicked:
        {


            submitKeyword(keyword.text)
            key_display.text = keyword.text.toLowerCase()

            //donedata();


        }

        clear_b.onClicked:
        {

            removeSubreddit(sub4.text)
            removeSubreddit(sub3.text)
            removeSubreddit(sub2.text)
            removeSubreddit(sub1.text)
            keyword.text = ""
            subreddit.text = ""
            key_display.text = ""
            cleargraph()
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
