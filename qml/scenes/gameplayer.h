#ifndef GAMEPLAYER_H
#define GAMEPLAYER_H
#include<QObject>
#include<QString>
#include<QDateTime>
class gamePlayer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int grade READ grade WRITE setGrade NOTIFY gradeChanged)
public:
    explicit gamePlayer(QObject *parent = nullptr);

    QString name()const;
    int grade()const;
    QDateTime getTime()const;

    void setName(QString name);
    void setGrade(int grade);
    void setTime(QDateTime time);
signals:
    void gradeChanged();
    void nameChanged();
private:
    QString m_name;
    int m_grade;
    QDateTime m_time;
};

#endif // GAMEPLAYER_H
