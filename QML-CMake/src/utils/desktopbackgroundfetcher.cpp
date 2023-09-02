// desktopbackgroundfetcher.cpp

#include <QPixmap>
#include <QScreen>
#include <QGuiApplication>

#include "desktopbackgroundfetcher.h"

DesktopBackgroundFetcher::DesktopBackgroundFetcher(QObject *parent) : QObject(parent) {}

QImage DesktopBackgroundFetcher::fetchDesktopBackgroundImage()
{
    QScreen *primaryScreen = QGuiApplication::primaryScreen();
    QPixmap pixmap = primaryScreen->grabWindow(0);
    return pixmap.toImage();
}
