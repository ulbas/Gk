#include "nodelistmodel.h"
#include <algorithm>
#include <QDebug>
NodeListModel::NodeListModel(QObject *parent) : QAbstractListModel(parent)
{

}

void NodeListModel::clear()
{   beginResetModel();
    m_noder.clear();
    endResetModel();
}

int NodeListModel::count()
{
    return rowCount();
}

void NodeListModel::changeForklaring(QString forklaring, int index)
{
    beginResetModel();
    m_noder[index]->setForklaring(forklaring);
    endResetModel();
}

QHash<int, QByteArray> NodeListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NodeNR] = "nodenr";
    roles[OmradeNR] = "omraadenr";
    roles[forklaring] = "forklaring";
    roles[sensorer] = "sensorer";
    roles[beskrivelse] ="beskrivelse";
    roles[kryptering] ="kryptering";
    return roles;

}

int NodeListModel::rowCount(const QModelIndex &parent) const
{
    return m_noder.size();
}

QVariant NodeListModel::data(const QModelIndex &index, int role) const
{
    int i = index.row();
    if(index.row()< 0 || index.row()>=rowCount())
        return QVariant();
    if(role == NodeNR)
        return m_noder[i]->nodenr();
    if(role == OmradeNR)
        return m_noder[i]->omraadenr();
    if(role == forklaring)
        return m_noder[i]->forklaring();
    if(role == sensorer)
        return m_noder[i]->sensorer();
    if(role == beskrivelse)
        return m_noder[i]->beskrivelse();
    if(role == kryptering)
        return m_noder[i]->kryptering();
    return QVariant();
}

void NodeListModel::add_node(GKNode *node)
{
    beginResetModel();
    //beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_noder.append(node);
    //endInsertRows();
    std::sort(m_noder.begin(), m_noder.end(), [](GKNode* nodeA, GKNode* nodeB){
        qDebug()<<"Sorting..";
        return nodeB->omraadenr() > nodeA->omraadenr();
    });
    endResetModel();
}

GKNode *NodeListModel::getNode(int index)
{
    return m_noder[index];
}
