// This file is autogenerated by CMake. Do not edit.

#include <QtCore/qtsymbolmacros.h>
#include <QtQml/qqmlextensionplugin.h>




$<$<BOOL:qml_register_types_AiraaTextFieldPlugin>:QT_DECLARE_EXTERN_SYMBOL_VOID($<JOIN:qml_register_types_AiraaTextFieldPlugin,);
QT_DECLARE_EXTERN_SYMBOL_VOID(>);>

class AiraaTextFieldPluginPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

public:
    AiraaTextFieldPluginPlugin(QObject *parent = nullptr) : QQmlEngineExtensionPlugin(parent)
    {

$<$<BOOL:qml_register_types_AiraaTextFieldPlugin>:QT_KEEP_SYMBOL($<JOIN:qml_register_types_AiraaTextFieldPlugin,);
QT_KEEP_SYMBOL(>);>
    }
};



#include "AiraaTextFieldPlugin_AiraaTextFieldPluginPlugin.moc"
