#ifndef UTILITY_H
#define UTILITY_H

#include <QObject>
#include <QVariantList>
#include <QStringList>
#include "gknode.h"
#include "nodelistmodel.h"

class Utility : public QObject
{
    Q_OBJECT
    Q_PROPERTY(NodeListModel* model READ model NOTIFY modelChanged)
    Q_PROPERTY(Utility* ptr READ ptr WRITE setPtr NOTIFY ptrChanged)
public:
    explicit Utility(QObject *parent = 0);

    Q_INVOKABLE
    void writeToJSONFile(QString filename);

    Q_INVOKABLE
    void readJSONFIle();

    Q_INVOKABLE
    QStringList getListOfNodeFiles();

    Q_INVOKABLE
    void runArduinoFile(QString filename);

    Q_INVOKABLE
    void addNode(QString omraadenr, QString nodenr, QString forklaring, QVariantList sensorer, QString beskrivelse, QString kryptering);

    NodeListModel* model();

    Utility* ptr();
    void setPtr(Utility* ptr);

    Q_INVOKABLE
    void setupINOFile(QString nodenummer, QString omraadenr, QString kryptering);


signals:
    void modelChanged();
    void ptrChanged();

public slots:

private:
    NodeListModel m_model;
};




#endif // UTILITY_H
