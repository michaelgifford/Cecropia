/*
ALVIN XU
10021846
*/

#ifndef HANDLEINPUT_H
#define HANDLEINPUT_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QVector>
#include <QNetworkReply>
#include "redditdata.h"

class HandleInput : public QObject
{
    Q_OBJECT
public:
    explicit HandleInput(QObject *parent = 0);

protected:
    bool is_sub;

signals:  //ignore for now
    void sendGraph1(QVariant gsub, QVariant nscore, QVariant numposts, QVariant numcomments);
    void sendGraph2(QVariant gsub, QVariant nscore, QVariant numposts, QVariant numcomments);
    void sendGraph3(QVariant gsub, QVariant nscore, QVariant numposts, QVariant numcomments);
    void sendGraph4(QVariant gsub, QVariant nscore, QVariant numposts, QVariant numcomments);
    void cleargraph();
    void setSubn(QVariant sub_text, QVariant subn);
    void errorbox(QVariant errotext);


public slots:

    void handlesubmitSubreddit(const QString &subreddit_data);
    void handlesubmitKeyword(const QString &keyword_data);
    void handleremoveSubreddit(const QString &subreddit_data);

private slots:
    void visualize(const QString keyword_data);
    void printSubs(const QVector<QString>);
    void handleData(QMap<QString, RedditData> data);
    void receivedSubredditExists(const QString subreddit, bool exists);

};

#endif // HANDLEINPUT_H
