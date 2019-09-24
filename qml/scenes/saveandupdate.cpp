#include "saveandupdate.h"
#include<QDir>
saveAndUpdate::saveAndUpdate(QObject *parent) : QObject(parent)
{
    loadHistory();
}

QQmlListProperty<gamePlayer> saveAndUpdate::players()
{
    return QQmlListProperty<gamePlayer>(this,this,
                                        &saveAndUpdate::appendPlayer,
                                        &saveAndUpdate::playersCount,
                                        &saveAndUpdate::playerAt,
                                        &saveAndUpdate::clearPlayers
                                        );

}

int saveAndUpdate::playersCount()
{
    return m_player.count();

}

void saveAndUpdate::appendPlayer(gamePlayer *chapter)
{
    m_player.append(chapter);
     playersChanged();
}

gamePlayer *saveAndUpdate::playerAt(int index)
{
    return m_player.at(index);
}

void saveAndUpdate::clearPlayers()
{
    m_player.clear();
}

void saveAndUpdate::append(QString name, int grade)
{
    gamePlayer *one=new gamePlayer();
    one->setName(name);
    one->setGrade(grade);
    appendPlayer(one);

}

void saveAndUpdate::saveHistory()
{
    QFile file("./gameHistory.json");
       if(!file.open(QIODevice::ReadWrite)) {
           qDebug() << "File open error";
       } else {
           qDebug() <<"File open!";
       }

    QJsonArray array;
    QJsonObject obj;
    for (auto play:m_player){
           QJsonObject jsonObject;
           jsonObject.insert("name", play->name());
           jsonObject.insert("grade", play->grade());
           jsonObject.insert("time", QDateTime::currentDateTime().toString());
           array.append(jsonObject);
    }
    QJsonDocument jsonDoc;
    jsonDoc.setArray(array);
    file.write(jsonDoc.toJson());
    file.close();
    qDebug() <<QDir::currentPath() + "/1.json"<<"Write to file";



}

void saveAndUpdate::loadHistory()
{
    QFile f("./gameHistory.json");
    qDebug() <<QDir::currentPath() + "/1.json"<<"Write to file";
    if(!f.open(QIODevice::ReadOnly))
       {
           qDebug() << "could't open projects json";
           return;
       }
    QByteArray allData = f.readAll();
    f.close();

    QJsonDocument jsonDoc(QJsonDocument::fromJson(allData));
     auto arr=jsonDoc.array();
     for(auto i:arr){
         auto temp=i.toObject();
         append(temp["name"].toString(),temp["grade"].toInt());
     }
}

void saveAndUpdate::setPlayers(QQmlListProperty<gamePlayer> players)
{
    return ;
}

void saveAndUpdate::appendPlayer(QQmlListProperty<gamePlayer> *list, gamePlayer *chapter)
{
    reinterpret_cast<saveAndUpdate*>(list->data)->appendPlayer(chapter);
}

int saveAndUpdate::playersCount(QQmlListProperty<gamePlayer> *list)
{
    return  reinterpret_cast<saveAndUpdate* >(list->data)->playersCount();
}

gamePlayer *saveAndUpdate::playerAt(QQmlListProperty<gamePlayer> *list, int index)
{
    return  reinterpret_cast<saveAndUpdate*>(list->data)->playerAt(index);

}

void saveAndUpdate::clearPlayers(QQmlListProperty<gamePlayer> *list)
{
    reinterpret_cast<saveAndUpdate*>(list->data)->clearPlayers();

}

