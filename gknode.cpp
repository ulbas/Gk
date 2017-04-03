#include "gknode.h"


GKNode::GKNode( QString omraadenr,QString nodenr, QString forklaring, QVariantList sensorer, QString beskrivelse,QString kryptering):
    m_nodenr{nodenr},
    m_omraadenr{omraadenr},
    m_forklaring{forklaring},
    m_sensorer{sensorer},
    m_beskrivelse{beskrivelse},
    m_kryptering{kryptering}

{

}

GKNode::GKNode()
{

}

void GKNode::loadFromJSON(const QJsonObject &json)
{
    m_nodenr = json["nodenumber"].toString();
    m_omraadenr = json["områdenr"].toString();
    m_forklaring = json["forklaring"].toString();
    m_beskrivelse =json["beskrivelse"].toString();
    m_kryptering =json["kryptering"].toString();
    m_sensorer = QVariantList();
    QJsonArray arr = json["sensorliste"].toArray();
    for(int i=0; i<arr.size(); i++){
        m_sensorer.append(QVariant::fromValue(arr[i].toString()));
    }
}

void GKNode::saveToJSON(QJsonObject &json)
{
    json["nodenumber"] = m_nodenr;
    json["områdenr"] = m_omraadenr;
    json["forklaring"] = m_forklaring;
    json["beskrivelse"] = m_beskrivelse;
    json["kryptering"] = m_kryptering;
    json["sensorliste"] = QJsonArray::fromVariantList(m_sensorer);
}

QString GKNode::nodenr() const
{
    return m_nodenr;
}

void GKNode::setNodenr(const QString &nodenr)
{
    m_nodenr = nodenr;
}

QString GKNode::omraadenr() const
{
    return m_omraadenr;
}

void GKNode::setOmraadenr(const QString &omraadenr)
{
    m_omraadenr = omraadenr;
}

QString GKNode::forklaring() const
{
    return m_forklaring;
}

void GKNode::setForklaring(const QString &forklaring)
{
    m_forklaring = forklaring;
}
QString GKNode::beskrivelse() const
{
    return m_beskrivelse;
}

void GKNode::setBeskrivelse(const QString &beskrivelse)
{
    m_beskrivelse= beskrivelse;
}
QString GKNode::kryptering() const
{
    return m_kryptering;
}

void GKNode::setKryptering(const QString &kryptering)
{
    m_kryptering = kryptering;
}

QVariantList GKNode::sensorer() const
{
    return m_sensorer;
}

void GKNode::setSensorer(const QVariantList &sensorer)
{
    m_sensorer = sensorer;
}
