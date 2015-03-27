/*
ALVIN XU
10021846
*/

#include "handleinput.h"
#include "redditdata.h"
#include "redditfetcher.h"

#include <QString>
#include <QDebug>
#include <QByteArray>

HandleInput::HandleInput(QObject *parent) : QObject(parent)
{

}


void HandleInput::handlesubmitUserInput(const QString &num1, const QString &num2)
{
    RedditFetcher *fetcher = new RedditFetcher(this);
    connect(fetcher, SIGNAL(finished(RedditData)),
            this, SLOT(handleData(RedditData)));


    fetcher->getData(num1, num2);
}

void HandleInput::handleData(RedditData data)
{
    qDebug() << "score:" << data.score << "posts:" << data.numPosts << "comments:" <<data.numComments;
    emit sendGraph(data.score, data.numPosts, data.numComments);
}





