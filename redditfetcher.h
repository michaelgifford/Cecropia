#ifndef REDDITFETCHER_H
#define REDDITFETCHER_H

#include <QObject>
#include <QNetworkReply>
#include "redditdata.h"

class RedditFetcher : public QObject
{
    Q_OBJECT
public:
    explicit RedditFetcher(QObject *parent = 0);
    ~RedditFetcher();
    void getData(const QString &subreddit, const QString &keyword);
private slots:
    void parseResponse(QNetworkReply *reply);

signals:
    void finished(RedditData data);
};

#endif // REDDITFETCHER_H
