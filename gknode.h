#ifndef GKNODE_H
#define GKNODE_H

#include <QObject>
#include <QList>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QVariantList>

class GKNode : public QObject
{
    Q_OBJECT
public:
    GKNode(QString nodenr,QString omraadenr, QString forklaring, QVariantList sensorer, QString beskrivelse, QString kyptering);
    GKNode();

    void loadFromJSON(const QJsonObject& json);
    void saveToJSON(QJsonObject& json);

    QString nodenr() const;
    void setNodenr(const QString &nodenr);

    QString omraadenr() const;
    void setOmraadenr(const QString &omraadenr);    

    QString forklaring() const;
    void setForklaring(const QString &forklaring);

    QVariantList sensorer() const;
    void setSensorer(const QVariantList &sensorer);

    QString beskrivelse() const;
    void setBeskrivelse (const QString &beskrivelse);

    QString kryptering() const;
    void setKryptering(const QString &kryptering);



signals:

public slots:

private:
    QString m_nodenr;
    QString m_omraadenr;
    QString m_forklaring;
    QVariantList m_sensorer;
    QString m_beskrivelse;
    QString m_kryptering;

};

#endif // GKNODE_H
