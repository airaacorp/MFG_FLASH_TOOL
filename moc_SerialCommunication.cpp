/****************************************************************************
** Meta object code from reading C++ file 'SerialCommunication.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.6.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "SerialCommunication.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SerialCommunication.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.6.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSSerialCommunicationENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSSerialCommunicationENDCLASS = QtMocHelpers::stringData(
    "SerialCommunication",
    "fileTransferCompleted",
    "",
    "fileTransferFailed",
    "error",
    "connectSerial",
    "portName",
    "baudRate",
    "isPortConnected",
    "closeSerial",
    "sendFile",
    "filePath",
    "sendData",
    "data"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSSerialCommunicationENDCLASS_t {
    uint offsetsAndSizes[28];
    char stringdata0[20];
    char stringdata1[22];
    char stringdata2[1];
    char stringdata3[19];
    char stringdata4[6];
    char stringdata5[14];
    char stringdata6[9];
    char stringdata7[9];
    char stringdata8[16];
    char stringdata9[12];
    char stringdata10[9];
    char stringdata11[9];
    char stringdata12[9];
    char stringdata13[5];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSSerialCommunicationENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSSerialCommunicationENDCLASS_t qt_meta_stringdata_CLASSSerialCommunicationENDCLASS = {
    {
        QT_MOC_LITERAL(0, 19),  // "SerialCommunication"
        QT_MOC_LITERAL(20, 21),  // "fileTransferCompleted"
        QT_MOC_LITERAL(42, 0),  // ""
        QT_MOC_LITERAL(43, 18),  // "fileTransferFailed"
        QT_MOC_LITERAL(62, 5),  // "error"
        QT_MOC_LITERAL(68, 13),  // "connectSerial"
        QT_MOC_LITERAL(82, 8),  // "portName"
        QT_MOC_LITERAL(91, 8),  // "baudRate"
        QT_MOC_LITERAL(100, 15),  // "isPortConnected"
        QT_MOC_LITERAL(116, 11),  // "closeSerial"
        QT_MOC_LITERAL(128, 8),  // "sendFile"
        QT_MOC_LITERAL(137, 8),  // "filePath"
        QT_MOC_LITERAL(146, 8),  // "sendData"
        QT_MOC_LITERAL(155, 4)   // "data"
    },
    "SerialCommunication",
    "fileTransferCompleted",
    "",
    "fileTransferFailed",
    "error",
    "connectSerial",
    "portName",
    "baudRate",
    "isPortConnected",
    "closeSerial",
    "sendFile",
    "filePath",
    "sendData",
    "data"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSSerialCommunicationENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   56,    2, 0x06,    1 /* Public */,
       3,    1,   57,    2, 0x06,    2 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       5,    2,   60,    2, 0x02,    4 /* Public */,
       8,    0,   65,    2, 0x02,    7 /* Public */,
       9,    0,   66,    2, 0x02,    8 /* Public */,
      10,    1,   67,    2, 0x02,    9 /* Public */,
      12,    1,   70,    2, 0x02,   11 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    4,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::Int,    6,    7,
    QMetaType::Bool,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::QString,   13,

       0        // eod
};

Q_CONSTINIT const QMetaObject SerialCommunication::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSSerialCommunicationENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSSerialCommunicationENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSSerialCommunicationENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<SerialCommunication, std::true_type>,
        // method 'fileTransferCompleted'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fileTransferFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'connectSerial'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        // method 'isPortConnected'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'closeSerial'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'sendFile'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'sendData'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>
    >,
    nullptr
} };

void SerialCommunication::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SerialCommunication *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->fileTransferCompleted(); break;
        case 1: _t->fileTransferFailed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 2: _t->connectSerial((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[2]))); break;
        case 3: { bool _r = _t->isPortConnected();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: _t->closeSerial(); break;
        case 5: _t->sendFile((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 6: _t->sendData((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (SerialCommunication::*)();
            if (_t _q_method = &SerialCommunication::fileTransferCompleted; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (SerialCommunication::*)(const QString & );
            if (_t _q_method = &SerialCommunication::fileTransferFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject *SerialCommunication::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SerialCommunication::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSSerialCommunicationENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SerialCommunication::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void SerialCommunication::fileTransferCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void SerialCommunication::fileTransferFailed(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
