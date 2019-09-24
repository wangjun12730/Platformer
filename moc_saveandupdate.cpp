/****************************************************************************
** Meta object code from reading C++ file 'saveandupdate.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "qml/scenes/saveandupdate.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'saveandupdate.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_saveAndUpdate_t {
    QByteArrayData data[18];
    char stringdata0[194];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_saveAndUpdate_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_saveAndUpdate_t qt_meta_stringdata_saveAndUpdate = {
    {
QT_MOC_LITERAL(0, 0, 13), // "saveAndUpdate"
QT_MOC_LITERAL(1, 14, 14), // "playersChanged"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 7), // "players"
QT_MOC_LITERAL(4, 38, 28), // "QQmlListProperty<gamePlayer>"
QT_MOC_LITERAL(5, 67, 12), // "playersCount"
QT_MOC_LITERAL(6, 80, 12), // "appendPlayer"
QT_MOC_LITERAL(7, 93, 11), // "gamePlayer*"
QT_MOC_LITERAL(8, 105, 7), // "chapter"
QT_MOC_LITERAL(9, 113, 8), // "playerAt"
QT_MOC_LITERAL(10, 122, 5), // "index"
QT_MOC_LITERAL(11, 128, 12), // "clearPlayers"
QT_MOC_LITERAL(12, 141, 6), // "append"
QT_MOC_LITERAL(13, 148, 4), // "name"
QT_MOC_LITERAL(14, 153, 5), // "grade"
QT_MOC_LITERAL(15, 159, 11), // "saveHistory"
QT_MOC_LITERAL(16, 171, 11), // "loadHistory"
QT_MOC_LITERAL(17, 183, 10) // "setPlayers"

    },
    "saveAndUpdate\0playersChanged\0\0players\0"
    "QQmlListProperty<gamePlayer>\0playersCount\0"
    "appendPlayer\0gamePlayer*\0chapter\0"
    "playerAt\0index\0clearPlayers\0append\0"
    "name\0grade\0saveHistory\0loadHistory\0"
    "setPlayers"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_saveAndUpdate[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       1,   84, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   64,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    0,   65,    2, 0x0a /* Public */,
       5,    0,   66,    2, 0x0a /* Public */,
       6,    1,   67,    2, 0x0a /* Public */,
       9,    1,   70,    2, 0x0a /* Public */,
      11,    0,   73,    2, 0x0a /* Public */,
      12,    2,   74,    2, 0x0a /* Public */,
      15,    0,   79,    2, 0x0a /* Public */,
      16,    0,   80,    2, 0x0a /* Public */,
      17,    1,   81,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    0x80000000 | 4,
    QMetaType::Int,
    QMetaType::Void, 0x80000000 | 7,    8,
    0x80000000 | 7, QMetaType::Int,   10,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::Int,   13,   14,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 4,    3,

 // properties: name, type, flags
       3, 0x80000000 | 4, 0x0049510b,

 // properties: notify_signal_id
       0,

       0        // eod
};

void saveAndUpdate::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<saveAndUpdate *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->playersChanged(); break;
        case 1: { QQmlListProperty<gamePlayer> _r = _t->players();
            if (_a[0]) *reinterpret_cast< QQmlListProperty<gamePlayer>*>(_a[0]) = std::move(_r); }  break;
        case 2: { int _r = _t->playersCount();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->appendPlayer((*reinterpret_cast< gamePlayer*(*)>(_a[1]))); break;
        case 4: { gamePlayer* _r = _t->playerAt((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< gamePlayer**>(_a[0]) = std::move(_r); }  break;
        case 5: _t->clearPlayers(); break;
        case 6: _t->append((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 7: _t->saveHistory(); break;
        case 8: _t->loadHistory(); break;
        case 9: _t->setPlayers((*reinterpret_cast< QQmlListProperty<gamePlayer>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< gamePlayer* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (saveAndUpdate::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&saveAndUpdate::playersChanged)) {
                *result = 0;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<saveAndUpdate *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QQmlListProperty<gamePlayer>*>(_v) = _t->players(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<saveAndUpdate *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setPlayers(*reinterpret_cast< QQmlListProperty<gamePlayer>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject saveAndUpdate::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_saveAndUpdate.data,
    qt_meta_data_saveAndUpdate,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *saveAndUpdate::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *saveAndUpdate::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_saveAndUpdate.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int saveAndUpdate::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void saveAndUpdate::playersChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
