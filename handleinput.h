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

signals:  //ignore for now
    void sendGraph(QVariant nscore, QVariant numposts, QVariant numcomments);

public slots:

    void handlesubmitSubreddit(const QString subreddit_data);
    void handlesubmitKeyword(const QString keyword_data);

private slots:
    void visualize(const QString keyword_data);
    void handleData(QMap<QString, RedditData> data);

};

#endif // HANDLEINPUT_H
