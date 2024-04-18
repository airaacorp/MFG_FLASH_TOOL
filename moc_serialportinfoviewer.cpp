/****************************************************************************
** Meta object code from reading C++ file 'serialportinfoviewer.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.6.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "serialportinfoviewer.h"
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'serialportinfoviewer.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS_t {};
static constexpr auto qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS = QtMocHelpers::stringData(
    "SerialPortInfoViewer",
    "serialPortInfoChanged",
    "",
    "connectionStateChanged",
    "serialPortInfoList",
    "QList<QVariantMap>",
    "isConnected",
    "updateSerialPortInfo",
    "showDeviceInfo",
    "portName",
    "connectToDevice",
    "disconnectDevice",
    "executeCommand",
    "command",
    "detectOperatingSystem",
    "QSerialPortInfo",
    "info"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS_t {
    uint offsetsAndSizes[34];
    char stringdata0[21];
    char stringdata1[22];
    char stringdata2[1];
    char stringdata3[23];
    char stringdata4[19];
    char stringdata5[19];
    char stringdata6[12];
    char stringdata7[21];
    char stringdata8[15];
    char stringdata9[9];
    char stringdata10[16];
    char stringdata11[17];
    char stringdata12[15];
    char stringdata13[8];
    char stringdata14[22];
    char stringdata15[16];
    char stringdata16[5];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS_t qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS = {
    {
        QT_MOC_LITERAL(0, 20),  // "SerialPortInfoViewer"
        QT_MOC_LITERAL(21, 21),  // "serialPortInfoChanged"
        QT_MOC_LITERAL(43, 0),  // ""
        QT_MOC_LITERAL(44, 22),  // "connectionStateChanged"
        QT_MOC_LITERAL(67, 18),  // "serialPortInfoList"
        QT_MOC_LITERAL(86, 18),  // "QList<QVariantMap>"
        QT_MOC_LITERAL(105, 11),  // "isConnected"
        QT_MOC_LITERAL(117, 20),  // "updateSerialPortInfo"
        QT_MOC_LITERAL(138, 14),  // "showDeviceInfo"
        QT_MOC_LITERAL(153, 8),  // "portName"
        QT_MOC_LITERAL(162, 15),  // "connectToDevice"
        QT_MOC_LITERAL(178, 16),  // "disconnectDevice"
        QT_MOC_LITERAL(195, 14),  // "executeCommand"
        QT_MOC_LITERAL(210, 7),  // "command"
        QT_MOC_LITERAL(218, 21),  // "detectOperatingSystem"
        QT_MOC_LITERAL(240, 15),  // "QSerialPortInfo"
        QT_MOC_LITERAL(256, 4)   // "info"
    },
    "SerialPortInfoViewer",
    "serialPortInfoChanged",
    "",
    "connectionStateChanged",
    "serialPortInfoList",
    "QList<QVariantMap>",
    "isConnected",
    "updateSerialPortInfo",
    "showDeviceInfo",
    "portName",
    "connectToDevice",
    "disconnectDevice",
    "executeCommand",
    "command",
    "detectOperatingSystem",
    "QSerialPortInfo",
    "info"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSSerialPortInfoViewerENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       2,   92, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   74,    2, 0x06,    3 /* Public */,
       3,    0,   75,    2, 0x06,    4 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       4,    0,   76,    2, 0x10a,    5 /* Public | MethodIsConst  */,
       6,    0,   77,    2, 0x10a,    6 /* Public | MethodIsConst  */,
       7,    0,   78,    2, 0x0a,    7 /* Public */,
       8,    1,   79,    2, 0x0a,    8 /* Public */,
      10,    1,   82,    2, 0x0a,   10 /* Public */,
      11,    0,   85,    2, 0x0a,   12 /* Public */,
      12,    1,   86,    2, 0x0a,   13 /* Public */,
      14,    1,   89,    2, 0x0a,   15 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    0x80000000 | 5,
    QMetaType::Bool,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void,
    QMetaType::QString, QMetaType::QString,   13,
    QMetaType::QString, 0x80000000 | 15,   16,

 // properties: name, type, flags
       4, 0x80000000 | 5, 0x00015009, uint(0), 0,
       6, QMetaType::Bool, 0x00015001, uint(1), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject SerialPortInfoViewer::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSSerialPortInfoViewerENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS_t,
        // property 'serialPortInfoList'
        QtPrivate::TypeAndForceComplete<QList<QVariantMap>, std::true_type>,
        // property 'isConnected'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<SerialPortInfoViewer, std::true_type>,
        // method 'serialPortInfoChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'connectionStateChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'serialPortInfoList'
        QtPrivate::TypeAndForceComplete<QList<QVariantMap>, std::false_type>,
        // method 'isConnected'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'updateSerialPortInfo'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'showDeviceInfo'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'connectToDevice'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'disconnectDevice'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'executeCommand'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'detectOperatingSystem'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QSerialPortInfo &, std::false_type>
    >,
    nullptr
} };

void SerialPortInfoViewer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SerialPortInfoViewer *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->serialPortInfoChanged(); break;
        case 1: _t->connectionStateChanged(); break;
        case 2: { QList<QVariantMap> _r = _t->serialPortInfoList();
            if (_a[0]) *reinterpret_cast< QList<QVariantMap>*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->isConnected();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: _t->updateSerialPortInfo(); break;
        case 5: _t->showDeviceInfo((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 6: _t->connectToDevice((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 7: _t->disconnectDevice(); break;
        case 8: { QString _r = _t->executeCommand((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: { QString _r = _t->detectOperatingSystem((*reinterpret_cast< std::add_pointer_t<QSerialPortInfo>>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (SerialPortInfoViewer::*)();
            if (_t _q_method = &SerialPortInfoViewer::serialPortInfoChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (SerialPortInfoViewer::*)();
            if (_t _q_method = &SerialPortInfoViewer::connectionStateChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QVariantMap> >(); break;
        }
    }  else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<SerialPortInfoViewer *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QList<QVariantMap>*>(_v) = _t->serialPortInfoList(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->isConnected(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *SerialPortInfoViewer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SerialPortInfoViewer::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSSerialPortInfoViewerENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SerialPortInfoViewer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 10;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void SerialPortInfoViewer::serialPortInfoChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void SerialPortInfoViewer::connectionStateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
