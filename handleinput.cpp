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

    if(subreddit_vector.size() > 4) {
        // TODO: display errors to the user (alvin)
        qDebug() << "tried to add more than 4 subreddits";
        return;
    }

    if(subreddit_vector.contains(subreddit_data.toLower())) {
        // TODO: display errors here
        qDebug() << "that subreddit is already added!";
        return;
    }
    // if we made it this far--check if it's a subreddit

    RedditFetcher *fetcher = new RedditFetcher(this);

    connect(fetcher, SIGNAL(finishedSub(QString, bool)),
              this, SLOT(receivedSubredditExists(QString,bool)));

    qDebug() << "checking with Reddit if it exists..";
    fetcher->checkSub(subreddit_data.toLower());
}

void HandleInput::receivedSubredditExists(QString subreddit, bool exists) {
    if (!exists) {
        // TODO: display errors here
        qDebug() << "subreddit does not exist";
        return;
    }

    qDebug() << "it exists. add it to the vector and redraw";
    subreddit_vector.append(subreddit);
    // it exists, so add it and reprint the subs
    HandleInput::printSubs(subreddit_vector);
}


void HandleInput::handleremoveSubreddit(const QString subreddit_remove)
{
    qDebug() << "this is the subreddit to remove: " << subreddit_remove;

    subreddit_vector.removeAll(subreddit_remove);


    HandleInput::printSubs(subreddit_vector);

}


void HandleInput::printSubs(const QVector<QString> print_list)
{
    qDebug() << "this is the subreddits sent to the print list:" << print_list;
    if (print_list.size() == 0)
    {
        qDebug() << "printing list is empty";
        emit setSubn("", 0);
    }
    for(int i = 0; i < print_list.size(); i++)
    {
        qDebug() << "printing stuff" << i;

        emit setSubn(print_list[i], i+1);
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











