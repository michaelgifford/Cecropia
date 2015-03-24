/*
ALVIN XU
10021846
*/

#include "handleinput.h"
#include <QString>
#include <QDebug>
#include <QByteArray>

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

HandleInput::HandleInput(QObject *parent) : QObject(parent)
{

}


void HandleInput::handlesubmitUserInput(const QString &num1, const QString &num2)
{

    qDebug() << "subreddit:" << num1 <<endl << "keyword:" << num2;
    QString subreddit = num1;
    QString keyword = num2;

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

void HandleInput::parseResponse(QNetworkReply *reply)
{
    QByteArray responseData = reply->readAll();
    QJsonDocument doc = QJsonDocument::fromJson(responseData);
    QJsonObject jsonObj = doc.object();
    RedditData redditData;
    redditData.numPosts = jsonObj.value("number_of_posts").toInt();
    redditData.score = jsonObj.value("score").toInt();
    redditData.numComments = jsonObj.value("number_of_comments").toInt();

}






