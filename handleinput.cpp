/*
ALVIN XU
10021846
*/

#include "handleinput.h"
#include "redditdata.h"
#include "redditfetcher.h"

#include <QString>
#include <Qvector>
#include <QDebug>
#include <QByteArray>

HandleInput::HandleInput(QObject *parent) : QObject(parent)
{

}

QVector<QString> subreddit_vector(0);


void HandleInput::handlesubmitSubreddit(const QString subreddit_data)
{
    qDebug() << subreddit_data;

    subreddit_vector.append(subreddit_data);

    qDebug() << subreddit_vector;

}

void HandleInput::handlesubmitKeyword(const QString keyword_data)
{
    qDebug() << "keyword_data1";

    qDebug() << keyword_data;

    HandleInput::visualize(keyword_data);
}


void HandleInput::visualize(const QString keyword_data)
{
    RedditFetcher *fetcher = new RedditFetcher(this);

    fetcher->setKeyword(keyword_data);
    fetcher->setSubreddits(subreddit_vector);

    connect(fetcher, SIGNAL(finished(QMap<QString, RedditData>)),
              this, SLOT(handleData(QMap<QString, RedditData>)));

    fetcher->getStats();
}



void HandleInput::handleData(QMap<QString, RedditData> data)
{
    for(int i=0; i<subreddit_vector.size(); i++)
    {
        qDebug() << data[subreddit_vector[i]].score;
    }
}











