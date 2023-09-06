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
