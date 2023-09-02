#ifndef DESKTOPBACKGROUNDFETCHER_H
#define DESKTOPBACKGROUNDFETCHER_H

#include <QObject>
#include <QImage>

class DesktopBackgroundFetcher : public QObject
{
    Q_OBJECT
public:
    explicit DesktopBackgroundFetcher(QObject *parent = nullptr);

    Q_INVOKABLE QImage fetchDesktopBackgroundImage();
};

#endif // DESKTOPBACKGROUNDFETCHER_H
