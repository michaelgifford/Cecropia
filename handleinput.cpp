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
    qDebug() << "this is the subreddit passed in: " << subreddit_data;

    if(subreddit_vector.size() < 4){
        subreddit_vector.append(subreddit_data);
    }
    else
    {
        qDebug() << "too many subreddits passed in";

        //call error function
    }

    HandleInput::printSubs(subreddit_vector);

}

void HandleInput::printSubs(const QVector<QString> print_list)
{
    qDebug() << "this is the subreddits sent to the print list:" << print_list;
    for(int i = 0; i < print_list.size(); i++)
    {
        qDebug() << "printing stuff";

        emit setSubn(print_list[i].toLower(), i+1);
    }
}

void HandleInput::handlesubmitKeyword(const QString keyword_data)
{
    qDebug() << "this is the keyword:" << keyword_data;

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
        qDebug() << "test: this is the score for subreddit" << subreddit_vector[i] << data[subreddit_vector[i]].score;
        //fix this: emit setSubn(subreddit_vector[i], i);
    }
}











