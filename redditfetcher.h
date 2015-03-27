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
    void getStats();
    void setKeyword(const QString &keyword);
    void setSubreddits(QVector<QString>);
private:
    QVector<QString> subreddits;
    QString keyword;
private slots:
    void normalizeStats(QNetworkReply *reply);

signals:
    void finished(QMap<QString, RedditData>);
};

#endif // REDDITFETCHER_H
