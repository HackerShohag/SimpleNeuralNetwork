#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QScreen>
#include <QWindow>
#include <QQmlContext>
#include <QRect>
#include <QApplication>

#include "NeuralNetwork"

int main(int argc, char *argv[])
{
    NeuralNetwork network({2, 7, 5});
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/MainPage.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
