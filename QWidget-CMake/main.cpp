#include <QApplication>

#include "src/mainwindow.h"

int main(int argc, char *argv[])
{
#ifdef QT_DEBUG
    qDebug() << "Running test on Debug";
#endif
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
