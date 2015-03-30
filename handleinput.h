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
    void sendGraph(QVariant nscore, QVariant numposts, QVariant numcomments);
    void setSubn(QVariant sub_text, QVariant subn);


public slots:

    void handlesubmitSubreddit(const QString subreddit_data);
    void handlesubmitKeyword(const QString keyword_data);
    void handleremoveSubreddit(const QString subreddit_data);

private slots:
    void visualize(const QString keyword_data);
    void printSubs(const QVector<QString>);
    void handleData(QMap<QString, RedditData> data);

};

#endif // HANDLEINPUT_H
