/*
ALVIN XU
10021846
*/

#ifndef HANDLEINPUT_H
#define HANDLEINPUT_H

#include <QObject>
#include <QDebug>
#include <QNetworkReply>

class HandleInput : public QObject
{
    Q_OBJECT
public:
    explicit HandleInput(QObject *parent = 0);

signals:  //ignore for now
    void setAnswer(QVariant numerator, QVariant denominator);
    void setError(QVariant error_code);

public slots:
    void handlesubmitUserInput(const QString &num1, const QString &num2);

private slots:
    void parseResponse(QNetworkReply *);

};

/**
 * @brief The RedditData class stores a response from the reddit API server
 */
class RedditData
{
    public:
        int numPosts;
        int score;
        int numComments;
};

#endif // HANDLEINPUT_H
