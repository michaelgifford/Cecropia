#include "redditfetcher.h"

// Utils
#include <QDebug>
#include <QVector>
#include <QMap>

// Include QT network headers
#include <QUrl>
#include <QUrlQuery>
#include <QNetworkRequest>
#include <QNetworkAccessManager>
#include <QNetworkReply>

// Include QT Json things
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>


RedditFetcher::RedditFetcher(QObject *parent) : QObject(parent)
{

}

RedditFetcher::~RedditFetcher()
{

}

void RedditFetcher::setKeyword(const QString &keyword)
{
    this->keyword = keyword;
}

void RedditFetcher::setSubreddits(QVector<QString> subreddits)
{
    this->subreddits = subreddits;
}

void RedditFetcher::getStats()
{
    // error handle (just return for now)
   // if (this->subreddits.size() > 4)
   //     return; // TODO: error handle this issue!

    // build query string from params
    QUrlQuery query;
    query.addQueryItem("q", this->keyword);

    for (int i = 0; i < this->subreddits.size(); i++)
        query.addQueryItem(QString("sub").append(QString::number(i+1)),this->subreddits.at(i));

    // build the url string using query
    QUrl url = QUrl::fromEncoded("https://young-lowlands-3189.herokuapp.com/get_data2");
    url.setQuery(query);

    // build network request and make get request
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(normalizeStats(QNetworkReply*)));
    manager->get(QNetworkRequest(url));
    qDebug() << "make request";
}

void RedditFetcher::normalizeStats(QNetworkReply *reply)
{
    QByteArray responseData = reply->readAll();
    QJsonDocument doc = QJsonDocument::fromJson(responseData);
    QJsonObject jsonObj = doc.object();

    QMap<QString, RedditData> response;

    // loop through subreddits
    for (int i = 0; i < this->subreddits.size(); i++) {
        RedditData redditData;
        QJsonObject stats = jsonObj.value(this->subreddits.at(i)).toObject();
        redditData.numPosts = stats.value("number_of_posts").toInt();
        redditData.score = stats.value("score").toInt();
        redditData.numComments = stats.value("number_of_comments").toInt();
        redditData.numSubscribers = stats.value("number_of_subscribers").toInt();
        response[this->subreddits.at(i)] = redditData;
    }
    qDebug() << "done requests";
    emit finished(response);
}

// checks a subreddit for its existence
void RedditFetcher::checkSub(QString subreddit)
{
    // build query string from subreddit name
    QUrlQuery query;
    query.addQueryItem("subreddit", subreddit);// build the url string using query
    QUrl url = QUrl::fromEncoded("https://young-lowlands-3189.herokuapp.com/subreddit_exists");
    url.setQuery(query);

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(normalizeSub(QNetworkReply*)));
    this->subreddit = subreddit;
    manager->get(QNetworkRequest(url));
}

void RedditFetcher::normalizeSub(QNetworkReply *reply)
{
    QByteArray responseData = reply->readAll();
    QJsonObject jsonObj = QJsonDocument::fromJson(responseData).object();

    emit finishedSub(this->subreddit, jsonObj.value("exists").toBool());
}
