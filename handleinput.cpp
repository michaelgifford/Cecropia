/*
ALVIN XU
10021846
*/

#include "handleinput.h"
#include <QString>
#include <QDebug>

#include <string>

HandleInput::HandleInput(QObject *parent) :
    QObject(parent)
{
}


void HandleInput::handlesubmitUserInput(const QString &num1, const QString &num2)
{

    qDebug() << "subreddit:" << num1 <<endl << "keyword:" << num2;
    std::string subreddit = num1.toStdString();
    std::string keyword = num2.toStdString();

}









