

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
    QObject *mainForm = window->findChild<QObject*>("mainForm");

    // connect our QML signal to our C++ slot

    QObject::connect(mainForm, SIGNAL(submitSubreddit(QString)),
                         &handleinput, SLOT(handlesubmitSubreddit(QString)));

    QObject::connect(mainForm, SIGNAL(removeSubreddit(QString)),
                         &handleinput, SLOT(handleremoveSubreddit(QString)));

    QObject::connect(window, SIGNAL(submitKeyword(QString)),
                         &handleinput, SLOT(handlesubmitKeyword(QString)));

    // connect our C++ signal to our QML slot
    // NOTE: if we want to pass an parameter to our QML slot, it has to be
    // a QVariant.

/*
    QObject::connect(&handleinput, SIGNAL(sendGraph(QVariant, QVariant, QVariant)),
                         window, SLOT(sendGraph(QVariant, QVariant, QVariant)));
                         */
    QObject::connect(&handleinput, SIGNAL(setSubn(QVariant, QVariant)),
                         mainForm, SLOT(setSubn(QVariant, QVariant)));
    QObject::connect(&handleinput, SIGNAL(sendGraph(QVariant, QVariant, QVariant, QVariant)),
                         window, SLOT(grapher(QVariant, QVariant, QVariant, QVariant)));



    return app.exec();
}
