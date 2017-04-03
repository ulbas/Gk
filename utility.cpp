#include "utility.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QGuiApplication>
#include <QDebug>
#include <QFile>
#include <QJsonArray>
#include <QDirIterator>
#include <QProcess>
#include <nodelistmodel.h>
#include <QStringList>

Utility::Utility(QObject *parent) : QObject(parent)
{

}

void Utility::writeToJSONFile(QString filename)
{

    QString path = QGuiApplication::applicationDirPath() + "/" + filename;

    QFile saveFile(path);
    if(!saveFile.open(QIODevice::WriteOnly)){
        qWarning("Could not open file for JSON writing..");
        return;
    }
    QJsonObject json;
    QJsonArray nodeliste;

    for(int i=0; i<m_model.rowCount(); ++i){
        QJsonObject nodeJSONObj;
        m_model.getNode(i)->saveToJSON(nodeJSONObj);
        nodeliste.append(nodeJSONObj);
    }
    json["noder"] = nodeliste;

    QJsonDocument doc(json);
    saveFile.write(doc.toJson());
    saveFile.close();
    qDebug()<<"Writing to: "<< path;
}

void Utility::readJSONFIle(){
    m_model.clear();


    QString path = QGuiApplication::applicationDirPath() + "/noder.txt";
    QFile loadFile(path);
    if(!loadFile.open(QIODevice::ReadOnly)){
        qWarning("Error loading JSON file.");
        return;
    }


    QJsonDocument document(QJsonDocument::fromJson(loadFile.readAll()));
    QJsonObject json = document.object();
    QJsonArray nodeList = json["noder"].toArray();
    for(int i=0; i<nodeList.size(); ++i){
        QJsonObject j = nodeList[i].toObject();
        GKNode* node = new GKNode();
        node->loadFromJSON(j);
        m_model.add_node(node);
    }

    qDebug()<<"Done loading from json";
    qDebug()<<"Model: " << m_model.rowCount();
    qDebug()<<"Signaling change to QML: ";
    emit ptrChanged();
}

QStringList Utility::getListOfNodeFiles()
{
    QString appdirectory = QGuiApplication::applicationDirPath();
    QDirIterator it(appdirectory, QStringList()<<"*.ino", QDir::Dirs | QDir::Files, QDirIterator::Subdirectories);
    QStringList listOfFiles;
    while(it.hasNext()){
        if(!it.filePath().contains("Arduino/")){

            qDebug() << it.filePath();
            QStringList path_and_file = it.filePath().split(QGuiApplication::applicationDirPath());
            if(path_and_file.size()>1){
                listOfFiles.append(path_and_file[1]);
            }
        }
        it.next();
    }
    return listOfFiles;
}

void Utility::runArduinoFile(QString filename)
{
    QProcess* process = new QProcess(this);
    QString program = "arduino_debug.exe";
    QString programPath = QGuiApplication::applicationDirPath() + "/Arduino/" + program;
    QString filePath = QString("\"" )+ QGuiApplication::applicationDirPath() + filename + "\"";
    QString logFile = QGuiApplication::applicationDirPath()+"/arduinolog.txt";
    QString fullExecutable = programPath + " --verbose " + " --upload " + filePath;


    qDebug()<<"Full exe: " << fullExecutable;


    // system(fullExecutable.toStdString().c_str());
    QByteArray out;
    process->setProcessChannelMode(QProcess::MergedChannels);
    process->start(fullExecutable);
    //process->waitForFinished(15000);

    qDebug()<<"Hello: ";
    qDebug()<<"Arduino output: "<<out;

    /**
      process->start(programPath, arguments);
    process->waitForFinished();

    QString arduino_output(process->readAllStandardOutput());
    arduino_output + " " + process->readAllStandardError();
    arduino_output + " " + process->readAll();
    qDebug()<<"Arduino output: "<<arduino_output;
    **/
}

void Utility::addNode(QString nodenr,QString omraadenr, QString forklaring, QVariantList sensorer, QString beskrivelse, QString kryptering)
{
    GKNode* node = new GKNode(omraadenr, nodenr, forklaring, sensorer,beskrivelse,kryptering);
    qDebug()<<"Added node on C++ side..";

    m_model.add_node(node);

    writeToJSONFile("noder.txt");
}

NodeListModel *Utility::model()
{
    return &m_model;
}

Utility *Utility::ptr()
{
    return this;
}

void Utility::setPtr(Utility *ptr)
{
    // do nothing
}

void Utility::setupINOFile(QString nodenummer, QString omraadenr, QString kryptering)
{
    QStringList fileLines;
    QString filename = QGuiApplication::applicationDirPath() + "/Nodeprogram/Packe_struct_send_sleep_PID_receive/Packe_struct_send_sleep_PID_receive.ino";

    QFile inputFile(filename);
    if (inputFile.open(QIODevice::ReadOnly))
    {
        QTextStream in(&inputFile);
        while (!in.atEnd())
        {
            QString quotation= "\"";
            QString line = in.readLine();
            if(line.contains("#define NETWORKID"))
                line = "#define NETWORKID " + omraadenr ;
            if(line.contains("#define MYNODEID"))
                line = "#define MYNODEID " + nodenummer ;
            if(line.contains("#define ENCRYPTKEY"))
                line = "#define ENCRYPTKEY " + quotation + kryptering + quotation;
            fileLines << line;

        }
        inputFile.close();
    }

    QFile outputFile(filename);
    if(outputFile.open(QIODevice::WriteOnly)) {
        QTextStream out(&outputFile);
        for(const QString& line : fileLines){
            qDebug()<<"Flushing line: " <<line;
            out << line << endl;
        }
        outputFile.close();
    }
}
