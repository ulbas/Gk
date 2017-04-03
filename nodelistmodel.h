#ifndef NODELISTMODEL_H
#define NODELISTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "gknode.h"

class NodeListModel : public QAbstractListModel
{
    Q_OBJECT
public:

    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role=Qt::DisplayRole) const;

    void add_node(GKNode* node);
    GKNode* getNode(int index);
    NodeListModel(QObject *parent = 0);

    void clear();

    Q_INVOKABLE
    int count();

    Q_INVOKABLE
    void changeForklaring(QString forklaring, int index);

    enum NodeRoles {
        NodeNR = Qt::UserRole + 1,
        OmradeNR,
        forklaring,
        sensorer,
        beskrivelse,
        kryptering

    };
signals:

public slots:


private:
    QList<GKNode*> m_noder;

protected:
    QHash<int, QByteArray> roleNames() const;

};

#endif // NODELISTMODEL_H
