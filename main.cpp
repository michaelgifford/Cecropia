

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQuickWindow>
#include <QSurfaceFormat>
#include <QGuiApplication>
#include <QQuickWindow>
#include <QQmlContext>

#include "handleinput.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    HandleInput handleinput;

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    // connect our QML signal to our C++ slot
    QObject::connect(window, SIGNAL(submitUserInput(QString, QString)),
                         &handleinput, SLOT(handlesubmitUserInput(QString, QString)));


    // connect our C++ signal to our QML slot
    // NOTE: if we want to pass an parameter to our QML slot, it has to be
    // a QVariant.


    QObject::connect(&handleinput, SIGNAL(sendGraph(QVariant, QVariant, QVariant)),
                         window, SLOT(sendGraph(QVariant, QVariant, QVariant)));

    return app.exec();
}
