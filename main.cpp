#include <QtQml>
#include <QTextStream>
#include <QFile>
#include <QDebug>
#include <QByteArray>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "utility.h"




#include "fileio.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


   // qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");



    QQmlApplicationEngine engine;
    Utility util;
    engine.rootContext()->setContextProperty("utility", &util);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
