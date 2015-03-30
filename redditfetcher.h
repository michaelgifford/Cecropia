#ifndef REDDITFETCHER_H
#define REDDITFETCHER_H

#include <QObject>
#include <QVector>
#include <QMap>
#include <QNetworkReply>
#include "redditdata.h"

class RedditFetcher : public QObject
{
    Q_OBJECT
public:
    explicit RedditFetcher(QObject *parent = 0);
    ~RedditFetcher();

    // To get stats, set the keyword and subreddits
    void setKeyword(const QString &keyword);
    void setSubreddits(QVector<QString>);
    // then call getStats() and wait for finished signal
    void getStats();

    // To check if a subreddit exists, call checkSub with
    // the subreddit and wait for finishedCheck to be called
    void checkSub(QString);
private:
    QVector<QString> subreddits;
    QString keyword;
    QString subreddit;
private slots:
    void normalizeStats(QNetworkReply *reply);
    void normalizeSub(QNetworkReply *reply);

signals:
    void finished(QMap<QString, RedditData>);
    void finishedSub(const QString, bool);
};

#endif // REDDITFETCHER_H
