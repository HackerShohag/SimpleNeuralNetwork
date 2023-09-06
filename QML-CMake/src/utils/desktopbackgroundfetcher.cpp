/*
 * Copyright (C) 2023  Abdullah AL Shohag
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * raven.downloader is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

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
