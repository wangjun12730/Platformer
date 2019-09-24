#ifndef SAVEANDUPDATE_H
#define SAVEANDUPDATE_H

#include <QObject>
#include<QList>
#include<QQmlListProperty>
#include<QString>

#include<QJsonDocument>
#include<QJsonArray>
#include<QJsonObject>
#include<QJsonValue>
#include<QJsonParseError>
#include<QDebug>
#include"gameplayer.h"
class saveAndUpdate : public QObject
{
    Q_OBJECT
public:
    explicit saveAndUpdate(QObject *parent = nullptr);
    Q_PROPERTY(QQmlListProperty<gamePlayer> players READ players WRITE setPlayers NOTIFY playersChanged)

signals:
    void playersChanged();
public:

public slots:
    QQmlListProperty<gamePlayer>players();
    int playersCount();
    void appendPlayer(gamePlayer*chapter);
    gamePlayer *playerAt(int index);
    void clearPlayers();
    void append(QString name,int grade);
    void saveHistory();
    void loadHistory();
    void setPlayers(QQmlListProperty<gamePlayer> players);
public:
    static void appendPlayer(QQmlListProperty<gamePlayer>*,gamePlayer *chapter);
    static int playersCount(QQmlListProperty<gamePlayer>*);
    static gamePlayer *playerAt(QQmlListProperty<gamePlayer>*,int index);
    static void clearPlayers(QQmlListProperty<gamePlayer>*);

private:
     QList<gamePlayer*>m_player;//玩家
     QString m_history;
};

#endif // SAVEANDUPDATE_H
