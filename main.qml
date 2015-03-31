import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2




ApplicationWindow {
    id: mainscreen
    title: qsTr("Reddt Visualizer")
    width: 1200
    height: 750
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
            error_msgs.text = ""
            rlogo.source = "regular_logo.png"
            switch(number) {
                case 0:
                    sub1.text = ""
                    sub2.text = ""
                    sub3.text = ""
                    sub4.text = ""
                    break;
                case 1:
                    sub1.text = text
                    removesub1.visible = true
                    break;
                case 2:
                    sub2.text = text
                    removesub2.visible = true
                    break;
                case 3:
                    sub3.text = text
                    removesub3.visible = true
                    break;
                case 4:
                    sub4.text = text
                    removesub4.visible = true
                    break;
            }
        }
        function cleargraph(){
            score1.width = score2.width = score3.width = score4.width = 1
            density1.width = density2.width = density3.width = density4.width = 1
            comments1.width = comments2.width = comments3.width = comments4.width = 1

        }


        function graph1(nsubs, nscore, numposts, numcomments){

            cleargraph()
            loading_box.text = ""
            rlogo.source = "regular_logo.png"
            error_msgs.text = ""

            score1.width = nscore/118
            density1.width = nscore/nsubs*1000
            comments1.width = numcomments/48

        }

        function graph2(nsubs, nscore, numposts, numcomments){

            score2.width = nscore/18
            density2.width = nscore/nsubs*1000
            comments2.width = numcomments/48

        }
        function graph3(nsubs, nscore, numposts, numcomments){

            score3.width = nscore/18
            density3.width = nscore/nsubs*1000
            comments3.width = numcomments/48

        }

        function graph4(nsubs, nscore, numposts, numcomments){

            score4.width = nscore/18
            density4.width = nscore/nsubs*1000
            comments4.width = numcomments/48
        }

        function errorbox(errmsg){
            error_msgs.text = errmsg
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
            error_msgs.text = ("finding subreddit...")
            rlogo.source = "finding_logo.png"

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
            loading_box.text = "LOADING..."
            error_msgs.text = "LOADING..."
            rlogo.source = "load_logo.png"
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

        Image {
            id: image1
            x: 8
            y: 16
            width: 52
            height: 51
            source: "qrc:/qtquickplugin/images/template_image.png"
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
