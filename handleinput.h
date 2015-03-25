/*
ALVIN XU
10021846
*/

#ifndef HANDLEINPUT_H
#define HANDLEINPUT_H

#include <QObject>
#include <QDebug>
#include <QNetworkReply>
#include "redditdata.h"

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
    void handleData(RedditData);

};

#endif // HANDLEINPUT_H
