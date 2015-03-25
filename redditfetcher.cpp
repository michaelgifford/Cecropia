#include "redditfetcher.h"

#include <QDebug>

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

void RedditFetcher::getData(const QString &subreddit, const QString &keyword)
{
    // build query string from params
    QUrlQuery query;
    query.addQueryItem("subreddit", subreddit);
    query.addQueryItem("q", keyword);

    // build the url string using query
    QUrl url = QUrl::fromEncoded("https://young-lowlands-3189.herokuapp.com/get_data");
    url.setQuery(query);

    // build network request and make get request
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(parseResponse(QNetworkReply*)));
    manager->get(QNetworkRequest(url));
}

void RedditFetcher::parseResponse(QNetworkReply *reply)
{
    QByteArray responseData = reply->readAll();
    QJsonDocument doc = QJsonDocument::fromJson(responseData);
    QJsonObject jsonObj = doc.object();
    RedditData redditData;
    redditData.numPosts = jsonObj.value("number_of_posts").toInt();
    redditData.score = jsonObj.value("score").toInt();
    redditData.numComments = jsonObj.value("number_of_comments").toInt();
    emit finished(redditData);
}
