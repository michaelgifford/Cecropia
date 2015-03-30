import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Reddt Visualizer")
    width: 1440
    height: 820
    visible: true

    signal submitKeyword(string keyword_data)

    signal submitSubreddit(string subreddit_data)

    function sendGraph(nscore, numposts, numcomments){
        messageDialog.show(nscore)

        posts.height = 500
        score.height = (500*nscore/numposts)
        comments.height= (500*nscore/numcomments*100)




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
        Rectangle {
            id: rectangle2
            x: 260
            y: 0
            width: 1440-260
            height: 840
            color: "#ffffff"

            GroupBox {
                id: groupBox3
                x: 0
                y: 0
                width: 761
                height: 710
                title: qsTr("Group Box")
                Row {
                    spacing: 20

                    id: row1
                    x: 23
                    y: 37
                    width: 700
                    height: 590

                    Rectangle {
                        id: posts
                        width: 200
                        height: 5
                        color: "red"
                    }

                    Rectangle {
                        id: score
                        width: 200
                        height: 5
                        color: "blue"
                    }

                    Rectangle {
                        id: comments
                        width: 200
                        height: 5
                        color: "green"
                    }
                }


            }
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
