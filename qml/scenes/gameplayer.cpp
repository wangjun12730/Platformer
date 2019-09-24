#include "gameplayer.h"


gamePlayer::gamePlayer(QObject *parent):QObject(parent)
{

}

QString gamePlayer::name() const
{
        return m_name;
}

int gamePlayer::grade() const
{
    return m_grade;
}

QDateTime gamePlayer::getTime() const
{
      return m_time;
}

void gamePlayer::setName(QString name)
{
    m_name=name;
    nameChanged();
}

void gamePlayer::setGrade( int grade)
{
    m_grade=grade;
    gradeChanged();
}

void gamePlayer::setTime(QDateTime time)
{
    m_time=time;
}
