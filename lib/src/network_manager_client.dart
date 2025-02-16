import 'dart:async';

import 'package:dbus/dbus.dart';

/// Internet connectivity states.
enum NetworkManagerConnectivityState { unknown, none, portal, limited, full }

NetworkManagerConnectivityState _decodeConnectivityState(int value) {
  switch (value) {
    case 1:
      return NetworkManagerConnectivityState.none;
    case 2:
      return NetworkManagerConnectivityState.portal;
    case 3:
      return NetworkManagerConnectivityState.limited;
    case 4:
      return NetworkManagerConnectivityState.full;
    default:
      return NetworkManagerConnectivityState.unknown;
  }
}

/// Device states.
enum NetworkManagerDeviceState {
  unknown,
  unmanaged,
  unavailable,
  disconnected,
  prepare,
  config,
  need_auth,
  ip_config,
  ip_check,
  secondaries,
  activated,
  deactivating,
  failed
}

NetworkManagerDeviceState _decodeDeviceState(int value) {
  switch (value) {
    case 10:
      return NetworkManagerDeviceState.unmanaged;
    case 20:
      return NetworkManagerDeviceState.unavailable;
    case 30:
      return NetworkManagerDeviceState.disconnected;
    case 40:
      return NetworkManagerDeviceState.prepare;
    case 50:
      return NetworkManagerDeviceState.config;
    case 60:
      return NetworkManagerDeviceState.need_auth;
    case 70:
      return NetworkManagerDeviceState.ip_config;
    case 80:
      return NetworkManagerDeviceState.ip_check;
    case 90:
      return NetworkManagerDeviceState.secondaries;
    case 100:
      return NetworkManagerDeviceState.activated;
    case 110:
      return NetworkManagerDeviceState.deactivating;
    case 120:
      return NetworkManagerDeviceState.failed;
    default:
      return NetworkManagerDeviceState.unknown;
  }
}

/// Reasons for a device state.
enum NetworkManagerDeviceStateReason {
  none,
  unknown,
  nowManaged,
  nowUnmanaged,
  configFailed,
  ipConfigUnavailable,
  ipConfigExpired,
  noSecrets,
  supplicantDisconnect,
  supplicantConfigFailed,
  supplicantFailed,
  supplicantTimeout,
  pppStartFailed,
  pppDisconnect,
  pppFailed,
  dhcpStartFailed,
  dhcpError,
  dhcpFailed,
  sharedStartFailed,
  sharedFailed,
  autoIpStartFailed,
  autoIpError,
  autoIpFailed,
  modemBusy,
  modemNoDialTone,
  modemNoCarrier,
  modemDialTimeout,
  modemDialFailed,
  modemInitFailed,
  gsmApnFailed,
  gsmRegistrationNotSearching,
  gsmRegistrationDenied,
  gsmRegistrationTimeout,
  gsmRegistrationFailed,
  gsmPinCheckFailed,
  firmwareMissing,
  removed,
  sleeping,
  connectionRemoved,
  userRequested,
  carrier,
  connectionAssumed,
  supplicantAvailable,
  ModemNotFound,
  btFailed,
  gsmSimNotInserted,
  gsmSimPinRequired,
  gsmSimPukRequired,
  gsmSimWrong,
  infinibandMode,
  dependencyFailed,
  br2684Failed,
  ModemManagerUnavailable,
  ssidNotFound,
  SecondaryConnectionFailed,
  dcbFcoeFailed,
  teamdControlFailed,
  modemFailed,
  modemAvailable,
  simPinIncorrect,
  newActivation,
  parentChanged,
  parentManagedChanged,
  ovsdbFailed,
  ipAddressDuplicate,
  ipMethodUnsupported,
  sriovConfigurationFailed,
  peerNotFound
}

NetworkManagerDeviceStateReason _decodeDeviceStateReason(int value) {
  switch (value) {
    case 0:
      return NetworkManagerDeviceStateReason.none;
    case 1:
      return NetworkManagerDeviceStateReason.unknown;
    case 2:
      return NetworkManagerDeviceStateReason.nowManaged;
    case 3:
      return NetworkManagerDeviceStateReason.nowUnmanaged;
    case 4:
      return NetworkManagerDeviceStateReason.configFailed;
    case 5:
      return NetworkManagerDeviceStateReason.ipConfigUnavailable;
    case 6:
      return NetworkManagerDeviceStateReason.ipConfigExpired;
    case 7:
      return NetworkManagerDeviceStateReason.noSecrets;
    case 8:
      return NetworkManagerDeviceStateReason.supplicantDisconnect;
    case 9:
      return NetworkManagerDeviceStateReason.supplicantConfigFailed;
    case 10:
      return NetworkManagerDeviceStateReason.supplicantFailed;
    case 11:
      return NetworkManagerDeviceStateReason.supplicantTimeout;
    case 12:
      return NetworkManagerDeviceStateReason.pppStartFailed;
    case 13:
      return NetworkManagerDeviceStateReason.pppDisconnect;
    case 14:
      return NetworkManagerDeviceStateReason.pppFailed;
    case 15:
      return NetworkManagerDeviceStateReason.dhcpStartFailed;
    case 16:
      return NetworkManagerDeviceStateReason.dhcpError;
    case 17:
      return NetworkManagerDeviceStateReason.dhcpFailed;
    case 18:
      return NetworkManagerDeviceStateReason.sharedStartFailed;
    case 19:
      return NetworkManagerDeviceStateReason.sharedFailed;
    case 20:
      return NetworkManagerDeviceStateReason.autoIpStartFailed;
    case 21:
      return NetworkManagerDeviceStateReason.autoIpError;
    case 22:
      return NetworkManagerDeviceStateReason.autoIpFailed;
    case 23:
      return NetworkManagerDeviceStateReason.modemBusy;
    case 24:
      return NetworkManagerDeviceStateReason.modemNoDialTone;
    case 25:
      return NetworkManagerDeviceStateReason.modemNoCarrier;
    case 26:
      return NetworkManagerDeviceStateReason.modemDialTimeout;
    case 27:
      return NetworkManagerDeviceStateReason.modemDialFailed;
    case 28:
      return NetworkManagerDeviceStateReason.modemInitFailed;
    case 29:
      return NetworkManagerDeviceStateReason.gsmApnFailed;
    case 30:
      return NetworkManagerDeviceStateReason.gsmRegistrationNotSearching;
    case 31:
      return NetworkManagerDeviceStateReason.gsmRegistrationDenied;
    case 32:
      return NetworkManagerDeviceStateReason.gsmRegistrationTimeout;
    case 33:
      return NetworkManagerDeviceStateReason.gsmRegistrationFailed;
    case 34:
      return NetworkManagerDeviceStateReason.gsmPinCheckFailed;
    case 35:
      return NetworkManagerDeviceStateReason.firmwareMissing;
    case 36:
      return NetworkManagerDeviceStateReason.removed;
    case 37:
      return NetworkManagerDeviceStateReason.sleeping;
    case 38:
      return NetworkManagerDeviceStateReason.connectionRemoved;
    case 39:
      return NetworkManagerDeviceStateReason.userRequested;
    case 40:
      return NetworkManagerDeviceStateReason.carrier;
    case 41:
      return NetworkManagerDeviceStateReason.connectionAssumed;
    case 42:
      return NetworkManagerDeviceStateReason.supplicantAvailable;
    case 43:
      return NetworkManagerDeviceStateReason.ModemNotFound;
    case 44:
      return NetworkManagerDeviceStateReason.btFailed;
    case 45:
      return NetworkManagerDeviceStateReason.gsmSimNotInserted;
    case 46:
      return NetworkManagerDeviceStateReason.gsmSimPinRequired;
    case 47:
      return NetworkManagerDeviceStateReason.gsmSimPukRequired;
    case 48:
      return NetworkManagerDeviceStateReason.gsmSimWrong;
    case 49:
      return NetworkManagerDeviceStateReason.infinibandMode;
    case 50:
      return NetworkManagerDeviceStateReason.dependencyFailed;
    case 51:
      return NetworkManagerDeviceStateReason.br2684Failed;
    case 52:
      return NetworkManagerDeviceStateReason.ModemManagerUnavailable;
    case 53:
      return NetworkManagerDeviceStateReason.ssidNotFound;
    case 54:
      return NetworkManagerDeviceStateReason.SecondaryConnectionFailed;
    case 55:
      return NetworkManagerDeviceStateReason.dcbFcoeFailed;
    case 56:
      return NetworkManagerDeviceStateReason.teamdControlFailed;
    case 57:
      return NetworkManagerDeviceStateReason.modemFailed;
    case 58:
      return NetworkManagerDeviceStateReason.modemAvailable;
    case 59:
      return NetworkManagerDeviceStateReason.simPinIncorrect;
    case 60:
      return NetworkManagerDeviceStateReason.newActivation;
    case 61:
      return NetworkManagerDeviceStateReason.parentChanged;
    case 62:
      return NetworkManagerDeviceStateReason.parentManagedChanged;
    case 63:
      return NetworkManagerDeviceStateReason.ovsdbFailed;
    case 64:
      return NetworkManagerDeviceStateReason.ipAddressDuplicate;
    case 65:
      return NetworkManagerDeviceStateReason.ipMethodUnsupported;
    case 66:
      return NetworkManagerDeviceStateReason.sriovConfigurationFailed;
    case 67:
      return NetworkManagerDeviceStateReason.peerNotFound;
    default:
      return NetworkManagerDeviceStateReason.unknown;
  }
}

class NetworkManagerDeviceStateAndReason {
  final NetworkManagerDeviceState state;
  final NetworkManagerDeviceStateReason reason;

  NetworkManagerDeviceStateAndReason(this.state, this.reason);
}

/// Device types.
enum NetworkManagerDeviceType {
  unknown,
  ethernet,
  wifi,
  bluetooth,
  olpc_mesh,
  wimax,
  modem,
  infiniband,
  bond,
  vlan,
  adsl,
  bridge,
  generic,
  team,
  tun,
  ip_tunnel,
  macvlan,
  vxlan,
  veth,
  macsec,
  dummy,
  ppp,
  ovs_interface,
  ovs_port,
  ovs_bridge,
  wpan,
  _6lowpan,
  wireguard,
  wifi_p2p,
  vrf
}

/// Traffic limitations.
enum NetworkManagerMetered { unknown, yes, no, guessYes, guessNo }

/// State of a [NetworkManagerActiveConnection].
enum NetworkManagerActiveConnectionState {
  unknown,
  activating,
  activated,
  deactivating,
  deactivated
}

NetworkManagerActiveConnectionState _decodeActiveConnectionState(int value) {
  switch (value) {
    case 1:
      return NetworkManagerActiveConnectionState.activating;
    case 2:
      return NetworkManagerActiveConnectionState.activated;
    case 3:
      return NetworkManagerActiveConnectionState.deactivating;
    case 4:
      return NetworkManagerActiveConnectionState.deactivated;
    default:
      return NetworkManagerActiveConnectionState.unknown;
  }
}

/// Flags describing a [NetworkManagerActiveConnectionState].
enum NetworkManagerActivationStateFlag {
  isMaster,
  isSlave,
  layer2Ready,
  ip4Ready,
  ip6Ready,
  masterHasSlaves,
  lifetimeBoundToProfileVisibility,
  external
}

/// Flags for a [NetworkManagerSettingsConnection].
enum NetworkManagerConnectionFlag {
  unsaved,
  networkManagerGenerated,
  volatile,
  external
}

/// Capabilities of a [NetworkManagerDevice].
enum NetworkManagerDeviceCapability {
  networkManagerSupported,
  carrierDetect,
  isSoftware,
  singleRootIOVirtualization
}

/// Interface flags for a [NetworkManagerDevice].
enum NetworkManagerDeviceInterfaceFlag { up, lowerUp, carrier }

/// WiFi operating modes.
enum NetworkManagerWifiMode { unknown, adhoc, infra, ap, mesh }

NetworkManagerWifiMode _decodeWifiMode(int value) {
  if (value == 1) {
    return NetworkManagerWifiMode.adhoc;
  } else if (value == 2) {
    return NetworkManagerWifiMode.infra;
  } else if (value == 3) {
    return NetworkManagerWifiMode.ap;
  } else if (value == 4) {
    return NetworkManagerWifiMode.mesh;
  } else {
    return NetworkManagerWifiMode.unknown;
  }
}

/// Wifi capabilities.
enum NetworkManagerDeviceWifiCapability {
  cipherWEP40,
  cipherWEP104,
  cipherTKIP,
  cipherCCMP,
  wpa,
  rsn,
  ap,
  adhoc,
  freqValid,
  freq2GHz,
  freq5GHz,
  mesh,
  ibssRsn
}

/// Flags for a [NetworkManagerAccessPoint].
enum NetworkManagerWifiAcessPointFlag { privacy, wps, wpsPushButton, wpsPin }

/// Security flags for a [NetworkManagerAccessPoint].
enum NetworkManagerWifiAcessPointSecurityFlag {
  pairWEP40,
  pairWEP104,
  pairTKIP,
  pairCCMP,
  groupWEP40,
  groupWEP104,
  groupTKIP,
  groupCCMP,
  keyManagementPSK,
  keyManagement802_1X,
  keyManagementSAE,
  keyManagementOWE,
  keyManagementOWE_TM
}

List<NetworkManagerWifiAcessPointSecurityFlag>
    _decodeWifiAcessPointSecurityFlags(int value) {
  var flags = <NetworkManagerWifiAcessPointSecurityFlag>[];
  if ((value & 0x1) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.pairWEP40);
  }
  if ((value & 0x2) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.pairWEP104);
  }
  if ((value & 0x4) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.pairTKIP);
  }
  if ((value & 0x8) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.pairCCMP);
  }
  if ((value & 0x10) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.groupWEP40);
  }
  if ((value & 0x20) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.groupWEP104);
  }
  if ((value & 0x40) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.groupTKIP);
  }
  if ((value & 0x80) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.groupCCMP);
  }
  if ((value & 0x100) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.keyManagementPSK);
  }
  if ((value & 0x200) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.keyManagement802_1X);
  }
  if ((value & 0x400) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.keyManagementSAE);
  }
  if ((value & 0x800) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.keyManagementOWE);
  }
  if ((value & 0x1000) != 0) {
    flags.add(NetworkManagerWifiAcessPointSecurityFlag.keyManagementOWE_TM);
  }
  return flags;
}

/// Capabilities of a [NetworkManagerDeviceBluetooth].
enum NetworkManagerBluetoothCapability { dun, tun }

/// Settings profile manager.
class NetworkManagerSettings {
  final String _settingsInterfaceName =
      'org.freedesktop.NetworkManager.Settings';

  final NetworkManagerClient _client;
  final _NetworkManagerObject _object;

  NetworkManagerSettings(this._client, this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_settingsInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Saved connections.
  List<NetworkManagerSettingsConnection> get connections {
    var objectPaths = _object.getObjectPathArrayProperty(
            _settingsInterfaceName, 'Connections') ??
        [];
    var connections = <NetworkManagerSettingsConnection>[];
    for (var objectPath in objectPaths) {
      var connection = _client._getConnection(objectPath);
      if (connection != null) {
        connections.add(connection);
      }
    }
    return connections;
  }

  /// The machine hostname.
  String get hostname =>
      _object.getStringProperty(_settingsInterfaceName, 'Hostname') ?? '';

  /// True if connections can be added or modified.
  bool get canModify =>
      _object.getBooleanProperty(_settingsInterfaceName, 'CanModify') ?? false;
}

/// Settings for a connection.
class NetworkManagerSettingsConnection {
  final String _settingsConnectionInterfaceName =
      'org.freedesktop.NetworkManager.Settings.Connection';

  final _NetworkManagerObject _object;

  NetworkManagerSettingsConnection(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_settingsConnectionInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Updates the settings for this connection, writing them to persistent storage.
  void update(Map<String, Map<String, DBusValue>> properties) async {
    await _object.callMethod(_settingsConnectionInterfaceName, 'Update', [
      DBusDict(
        DBusSignature('s'),
        DBusSignature('a{sv}'),
        properties.map(
          (key, value) => MapEntry(
            DBusString(key),
            DBusDict(
              DBusSignature('s'),
              DBusSignature('v'),
              value.map((k, v) => MapEntry(DBusString(k), DBusVariant(v))),
            ),
          ),
        ),
      )
    ]);
  }

  /// Updates the settings for this connection, not writing them to persistent storage.
  void updateUnsaved(Map<String, Map<String, DBusValue>> properties) async {
    await _object
        .callMethod(_settingsConnectionInterfaceName, 'UpdateUnsaved', [
      DBusDict(
        DBusSignature('s'),
        DBusSignature('a{sv}'),
        properties.map(
          (key, value) => MapEntry(
            DBusString(key),
            DBusDict(
              DBusSignature('s'),
              DBusSignature('v'),
              value.map((k, v) => MapEntry(DBusString(k), DBusVariant(v))),
            ),
          ),
        ),
      )
    ]);
  }

  /// Deletes this network connection settings.
  Future<void> delete() async {
    await _object.callMethod(_settingsConnectionInterfaceName, 'Delete', []);
  }

  /// Gets the settings belonging to this network connection.
  Future<Map<String, Map<String, DBusValue>>> getSettings() async {
    var result = await _object
        .callMethod(_settingsConnectionInterfaceName, 'GetSettings', []);
    return (result.returnValues[0] as DBusDict).children.map(
          (key, value) => MapEntry(
            (key as DBusString).value,
            (value as DBusDict).children.map((k, v) =>
                MapEntry((k as DBusString).value, (v as DBusVariant).value)),
          ),
        );
  }

  /// Gets the secrets belonging to this network connection.
  Future<Map<String, Map<String, DBusValue>>> getSecrets(
      [String settingName = '']) async {
    var result = await _object.callMethod(_settingsConnectionInterfaceName,
        'GetSecrets', [DBusString(settingName)]);
    return (result.returnValues[0] as DBusDict).children.map((key, value) =>
        MapEntry(
            (key as DBusString).value,
            (value as DBusDict).children.map((k, v) =>
                MapEntry((k as DBusString).value, (v as DBusVariant).value))));
  }

  /// Clears the secrets belonging to this network connection.
  void clearSecrets() async =>
      _object.callMethod(_settingsConnectionInterfaceName, 'ClearSecrets', []);

  /// Saves the connection settings to persistent storage.
  void save() async =>
      _object.callMethod(_settingsConnectionInterfaceName, 'Save', []);

  // FIXME: Update2

  /// True if the settings have yet to be written to persistent storage.
  bool get unsaved =>
      _object.getBooleanProperty(_settingsConnectionInterfaceName, 'Unsaved') ??
      false;

  /// Flags associated with this connection.
  List<NetworkManagerConnectionFlag> get flags {
    var value =
        _object.getUint32Property(_settingsConnectionInterfaceName, 'Flags') ??
            0;
    var flags = <NetworkManagerConnectionFlag>[];
    if ((value & 0x01) != 0) {
      flags.add(NetworkManagerConnectionFlag.unsaved);
    }
    if ((value & 0x02) != 0) {
      flags.add(NetworkManagerConnectionFlag.networkManagerGenerated);
    }
    if ((value & 0x04) != 0) {
      flags.add(NetworkManagerConnectionFlag.volatile);
    }
    if ((value & 0x08) != 0) {
      flags.add(NetworkManagerConnectionFlag.external);
    }
    return flags;
  }

  /// File that stores these settings.
  String get filename =>
      _object.getStringProperty(_settingsConnectionInterfaceName, 'Filename') ??
      '';
}

/// DNS configuration and state.
class NetworkManagerDnsManager {
  final String _dnsManagerInterfaceName =
      'org.freedesktop.NetworkManager.DnsManager';

  final _NetworkManagerObject _object;

  NetworkManagerDnsManager(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_dnsManagerInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Current DNS processing mode.
  String get mode =>
      _object.getStringProperty(_dnsManagerInterfaceName, 'Mode') ?? '';

  /// Current resolv.conf management mode.
  String get rcManager =>
      _object.getStringProperty(_dnsManagerInterfaceName, 'RcManager') ?? '';

  /// Current DNS configuration. Each item has at least 'nameservers', 'priority' and optionally 'interface' and 'vpn'.
  List<Map<String, dynamic>> get configuration =>
      _object.getDataListProperty(_dnsManagerInterfaceName, 'Configuration') ??
      [];
}

/// A device managed by NetworkManager.
class NetworkManagerDevice {
  final String _deviceInterfaceName = 'org.freedesktop.NetworkManager.Device';

  final NetworkManagerClient _client;
  final _NetworkManagerObject _object;

  /// Information for Bluetooth devices or null.
  final NetworkManagerDeviceBluetooth bluetooth;

  /// Generic device information or null.
  final NetworkManagerDeviceGeneric generic;

  /// Device statistics or null.
  final NetworkManagerDeviceStatistics statistics;

  /// TUN device information or null.
  final NetworkManagerDeviceTun tun;

  /// Information for Virtual LAN devices or null.
  final NetworkManagerDeviceVlan vlan;

  /// Information for wired devices (e.g. Ethernet) or null.
  final NetworkManagerDeviceWired wired;

  /// Information for wireless devices (e.g WiFi) or null.
  final NetworkManagerDeviceWireless wireless;

  NetworkManagerDevice(this._client, this._object)
      : bluetooth = NetworkManagerDeviceBluetooth(_object),
        generic = NetworkManagerDeviceGeneric(_object),
        statistics = NetworkManagerDeviceStatistics(_object),
        tun = NetworkManagerDeviceTun(_object),
        vlan = NetworkManagerDeviceVlan(_client, _object),
        wired = NetworkManagerDeviceWired(_object),
        wireless = NetworkManagerDeviceWireless(_client, _object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_deviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Disconnects a device and prevents the device from automatically activating further connections without user intervention.
  void disconnect() async =>
      _object.callMethod(_deviceInterfaceName, 'Disconnect', []);

  /// Deletes a software device from NetworkManager and removes the interface from the system.
  /// The method returns an error when called for a hardware device.
  void delete() async => _object.callMethod(_deviceInterfaceName, 'Delete', []);

  /// UDI for this device.
  String get udi =>
      _object.getStringProperty(_deviceInterfaceName, 'Udi') ?? '';

  /// Device filesystem path.
  String get path =>
      _object.getStringProperty(_deviceInterfaceName, 'Path') ?? '';

  /// Device filesystem path to IP data interface.
  String get ipInterface =>
      _object.getStringProperty(_deviceInterfaceName, 'IpInterface') ?? '';

  /// The kernel driver this device is using.
  String get driver =>
      _object.getStringProperty(_deviceInterfaceName, 'Driver') ?? '';

  /// The version of the kernel driver this device is using.
  String get driverVersion =>
      _object.getStringProperty(_deviceInterfaceName, 'DriverVersion') ?? '';

  /// The version of the firmware this device is using.
  String get firmwareVersion =>
      _object.getStringProperty(_deviceInterfaceName, 'FirmwareVersion') ?? '';

  /// Capabilities of this device
  List<NetworkManagerDeviceCapability> get capabilities {
    var value =
        _object.getUint32Property(_deviceInterfaceName, 'Capabilities') ?? 0;
    var values = <NetworkManagerDeviceCapability>[];
    if ((value & 0x01) != 0) {
      values.add(NetworkManagerDeviceCapability.networkManagerSupported);
    }
    if ((value & 0x02) != 0) {
      values.add(NetworkManagerDeviceCapability.carrierDetect);
    }
    if ((value & 0x03) != 0) {
      values.add(NetworkManagerDeviceCapability.isSoftware);
    }
    if ((value & 0x04) != 0) {
      values.add(NetworkManagerDeviceCapability.singleRootIOVirtualization);
    }
    return values;
  }

  /// The connection state of this device.
  NetworkManagerDeviceState get state {
    var value = _object.getUint32Property(_deviceInterfaceName, 'State') ?? 0;
    return _decodeDeviceState(value);
  }

  /// The state of this connection and the reason for that state.
  NetworkManagerDeviceStateAndReason get stateReason {
    var value = _object.getCachedProperty(_deviceInterfaceName, 'StateReason');
    if (value == null || value.signature != DBusSignature('uu')) {
      return NetworkManagerDeviceStateAndReason(
          NetworkManagerDeviceState.unknown,
          NetworkManagerDeviceStateReason.unknown);
    }
    var values = (value as DBusStruct).children.toList();
    var state = _decodeDeviceState((values[0] as DBusUint32).value);
    var reason = _decodeDeviceStateReason((values[1] as DBusUint32).value);

    return NetworkManagerDeviceStateAndReason(state, reason);
  }

  /// Connection that owns this device.
  NetworkManagerActiveConnection? get activeConnection {
    var objectPath =
        _object.getObjectPathProperty(_deviceInterfaceName, 'ActiveConnection');
    return _client._getActiveConnection(objectPath);
  }

  /// IPv4 configuration for this device.
  NetworkManagerIP4Config? get ip4Config {
    var objectPath =
        _object.getObjectPathProperty(_deviceInterfaceName, 'Ip4Config');
    return _client._getIP4Config(objectPath);
  }

  /// DHCPv4 configuration for this device.
  NetworkManagerDHCP4Config? get dhcp4Config {
    var objectPath =
        _object.getObjectPathProperty(_deviceInterfaceName, 'DHCP4Config');
    return _client._getDHCP4Config(objectPath);
  }

  /// IPv6 configuration for this device.
  NetworkManagerIP6Config? get ip6Config {
    var objectPath =
        _object.getObjectPathProperty(_deviceInterfaceName, 'Ip6Config');
    return _client._getIP6Config(objectPath);
  }

  /// DHCPv6 configuration for this device.
  NetworkManagerDHCP6Config? get dhcp6Config {
    var objectPath =
        _object.getObjectPathProperty(_deviceInterfaceName, 'DHCP6Config');
    return _client._getDHCP6Config(objectPath);
  }

  /// True if this device is being managed by NetworkManager.
  bool get managed =>
      _object.getBooleanProperty(_deviceInterfaceName, 'Managed') ?? false;

  /// Sets if this device is being managed by NetworkManager.
  set managed(bool value) =>
      _object.setProperty(_deviceInterfaceName, 'Managed', DBusBoolean(value));

  /// True if this device is allowed to automatically connect.
  bool get autoconnect =>
      _object.getBooleanProperty(_deviceInterfaceName, 'Autoconnect') ?? false;

  /// Sets if this device is allowed to automatically connect.
  set autoconnect(bool value) => _object.setProperty(
      _deviceInterfaceName, 'Autoconnect', DBusBoolean(value));

  /// True if this device is missing firware required for it to operate.
  bool get firmwareMissing =>
      _object.getBooleanProperty(_deviceInterfaceName, 'FirmwareMissing') ??
      false;

  /// True if this device is missing a plugin or needs plugin configuration for it to operate.
  bool get nmPluginMissing =>
      _object.getBooleanProperty(_deviceInterfaceName, 'NmPluginMissing') ??
      false;

  /// The type of device.
  NetworkManagerDeviceType get deviceType {
    var value = _object.getUint32Property(
          _deviceInterfaceName,
          'DeviceType',
        ) ??
        0;
    switch (value) {
      case 1:
        return NetworkManagerDeviceType.ethernet;
      case 2:
        return NetworkManagerDeviceType.wifi;
      case 5:
        return NetworkManagerDeviceType.bluetooth;
      case 6:
        return NetworkManagerDeviceType.olpc_mesh;
      case 7:
        return NetworkManagerDeviceType.wimax;
      case 8:
        return NetworkManagerDeviceType.modem;
      case 9:
        return NetworkManagerDeviceType.infiniband;
      case 10:
        return NetworkManagerDeviceType.bond;
      case 11:
        return NetworkManagerDeviceType.vlan;
      case 12:
        return NetworkManagerDeviceType.adsl;
      case 13:
        return NetworkManagerDeviceType.bridge;
      case 14:
        return NetworkManagerDeviceType.generic;
      case 15:
        return NetworkManagerDeviceType.team;
      case 16:
        return NetworkManagerDeviceType.tun;
      case 17:
        return NetworkManagerDeviceType.ip_tunnel;
      case 18:
        return NetworkManagerDeviceType.macvlan;
      case 19:
        return NetworkManagerDeviceType.vxlan;
      case 20:
        return NetworkManagerDeviceType.veth;
      case 21:
        return NetworkManagerDeviceType.macsec;
      case 22:
        return NetworkManagerDeviceType.dummy;
      case 23:
        return NetworkManagerDeviceType.ppp;
      case 24:
        return NetworkManagerDeviceType.ovs_interface;
      case 25:
        return NetworkManagerDeviceType.ovs_port;
      case 26:
        return NetworkManagerDeviceType.ovs_bridge;
      case 27:
        return NetworkManagerDeviceType.wpan;
      case 28:
        return NetworkManagerDeviceType._6lowpan;
      case 29:
        return NetworkManagerDeviceType.wireguard;
      case 30:
        return NetworkManagerDeviceType.wifi_p2p;
      case 31:
        return NetworkManagerDeviceType.vrf;
      default:
        return NetworkManagerDeviceType.unknown;
    }
  }

  // The connections that are configured for this device.
  List<NetworkManagerSettingsConnection> get availableConnections {
    var objectPaths = _object.getObjectPathArrayProperty(
            _deviceInterfaceName, 'AvailableConnections') ??
        [];
    var connections = <NetworkManagerSettingsConnection>[];
    for (var objectPath in objectPaths) {
      var connection = _client._getConnection(objectPath);
      if (connection != null) {
        connections.add(connection);
      }
    }
    return connections;
  }

  /// The pyhsical network port associated with this device.
  String get physicalPortId =>
      _object.getStringProperty(_deviceInterfaceName, 'PhysicalPortId') ?? '';

  /// The device MTU.
  int get mtu => _object.getUint32Property(_deviceInterfaceName, 'Mtu') ?? 0;

  /// True if the device has traffic limitations.
  NetworkManagerMetered get metered => NetworkManagerMetered
      .values[_object.getUint32Property(_deviceInterfaceName, 'Metered') ?? 0];

  // FIXME: LldpNeighbors

  /// True if the device exists.
  bool get real =>
      _object.getBooleanProperty(_deviceInterfaceName, 'Real') ?? false;

  /// IPv4 connectivity state.
  NetworkManagerConnectivityState get ip4Connectivity {
    var value =
        _object.getUint32Property(_deviceInterfaceName, 'Ip4Connectivity') ?? 0;
    return _decodeConnectivityState(value);
  }

  /// IPv6 connectivity state.
  NetworkManagerConnectivityState get ip6Connectivity {
    var value =
        _object.getUint32Property(_deviceInterfaceName, 'Ip6Connectivity') ?? 0;
    return _decodeConnectivityState(value);
  }

  /// Flags for network interfaces.
  List<NetworkManagerDeviceInterfaceFlag> get interfaceFlags {
    var value =
        _object.getUint32Property(_deviceInterfaceName, 'InterfaceFlags') ?? 0;
    var flags = <NetworkManagerDeviceInterfaceFlag>[];
    if ((value & 0x01) != 0) {
      flags.add(NetworkManagerDeviceInterfaceFlag.up);
    }
    if ((value & 0x02) != 0) {
      flags.add(NetworkManagerDeviceInterfaceFlag.lowerUp);
    }
    if ((value & 0x10000) != 0) {
      flags.add(NetworkManagerDeviceInterfaceFlag.carrier);
    }
    return flags;
  }

  /// Hardware address for this device.
  String get hwAddress =>
      _object.getStringProperty(_deviceInterfaceName, 'HwAddress') ?? '';
}

/// Information for Bluetooth devices.
class NetworkManagerDeviceBluetooth {
  final String _bluetoothDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Bluetooth';

  final _NetworkManagerObject _object;

  NetworkManagerDeviceBluetooth(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_bluetoothDeviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Bluetooth capabilities of this device.
  List<NetworkManagerBluetoothCapability> get btCapabilities {
    var value = _object.getUint32Property(
            _bluetoothDeviceInterfaceName, 'BtCapabilities') ??
        0;
    var flags = <NetworkManagerBluetoothCapability>[];
    if ((value & 0x1) != 0) {
      flags.add(NetworkManagerBluetoothCapability.dun);
    }
    if ((value & 0x2) != 0) {
      flags.add(NetworkManagerBluetoothCapability.tun);
    }
    return flags;
  }
}

/// Information for generic devices.
class NetworkManagerDeviceGeneric {
  final String _genericDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Generic';

  final _NetworkManagerObject _object;

  NetworkManagerDeviceGeneric(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_genericDeviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// A human readable description of this device.
  String get typeDescription =>
      _object.getStringProperty(
          _genericDeviceInterfaceName, 'TypeDescription') ??
      '';
}

/// Statistics for devices.
class NetworkManagerDeviceStatistics {
  final String _statisticsDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Statistics';

  final _NetworkManagerObject _object;

  NetworkManagerDeviceStatistics(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_statisticsDeviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Maximum time between properties being updated in milliseconds or 0 if guaranteed refresh rate.
  int get refreshRateMs =>
      _object.getUint32Property(
          _statisticsDeviceInterfaceName, 'RefreshRateMs') ??
      0;

  /// How many bytes have been transmitted.
  int get txBytes =>
      _object.getUint64Property(_statisticsDeviceInterfaceName, 'TxBytes') ?? 0;

  /// How many bytes have been received.
  int get rxBytes =>
      _object.getUint64Property(_statisticsDeviceInterfaceName, 'RxBytes') ?? 0;
}

/// Information for userspace tunneling devices.
class NetworkManagerDeviceTun {
  final String _tunDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Tun';

  final _NetworkManagerObject _object;

  NetworkManagerDeviceTun(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_tunDeviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Permanent hardware address, e.g. '00:0a:95:9d:68:16'.
  String get permHwAddress =>
      _object.getStringProperty(_tunDeviceInterfaceName, 'PermHwAddress') ?? '';

  /// UID of tunnel owner or -1 if no owner.
  int get owner =>
      _object.getInt64Property(_tunDeviceInterfaceName, 'Owner') ?? 0;

  /// GID of tunnel group or -1 if no owner.
  int get group =>
      _object.getInt64Property(_tunDeviceInterfaceName, 'Group') ?? 0;

  /// Tunnel mode, either 'tun' or 'tap'.
  String get mode =>
      _object.getStringProperty(_tunDeviceInterfaceName, 'Mode') ?? '';

  /// True if no protocol info is prepended to the tunnel packets.
  bool get noPi =>
      _object.getBooleanProperty(_tunDeviceInterfaceName, 'NoPi') ?? false;

  /// True if the tunnel packets include a virtio network header.
  bool get vnetHdr =>
      _object.getBooleanProperty(_tunDeviceInterfaceName, 'VnetHdr') ?? false;

  /// True if callers can connect to the tap device multiple times, for multiple send/receive queues.
  bool get multiQueue =>
      _object.getBooleanProperty(_tunDeviceInterfaceName, 'MultiQueue') ??
      false;
}

/// Information for Virtual LAN devices.
class NetworkManagerDeviceVlan {
  final String _vlanDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Vlan';

  final NetworkManagerClient _client;
  final _NetworkManagerObject _object;

  NetworkManagerDeviceVlan(this._client, this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_vlanDeviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Parent device of this VLAN device.
  NetworkManagerDevice? get parent {
    var objectPath =
        _object.getObjectPathProperty(_vlanDeviceInterfaceName, 'Parent');
    return _client._getDevice(objectPath);
  }

  /// The VLAN ID in use.
  int get vlanId =>
      _object.getUint32Property(_vlanDeviceInterfaceName, 'VlanId') ?? 0;
}

/// Information for wired network devices.
class NetworkManagerDeviceWired {
  final String _wiredDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Wired';

  final _NetworkManagerObject _object;

  NetworkManagerDeviceWired(this._object);

  /// Permanent hardware address, e.g. '00:0a:95:9d:68:16'.
  String get permHwAddress =>
      _object.getStringProperty(_wiredDeviceInterfaceName, 'PermHwAddress') ??
      '';

  /// Design speed of this device in megabits/second.
  int get speed =>
      _object.getUint32Property(_wiredDeviceInterfaceName, 'Speed') ?? 0;

  /// Array of S/390 subchannels for S/390 or z/Architecture devices.
  List<String> get s390Subchannels =>
      _object.getStringArrayProperty(
          _wiredDeviceInterfaceName, 'S390Subchannels') ??
      [];
}

/// Information for wireless network devices.
class NetworkManagerDeviceWireless {
  final String _wirelessDeviceInterfaceName =
      'org.freedesktop.NetworkManager.Device.Wireless';

  final NetworkManagerClient _client;
  final _NetworkManagerObject _object;

  NetworkManagerDeviceWireless(this._client, this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_wirelessDeviceInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Permanent hardware address, e.g. '00:0a:95:9d:68:16'.
  String get permHwAddress =>
      _object.getStringProperty(
          _wirelessDeviceInterfaceName, 'PermHwAddress') ??
      '';

  /// Operating mode of the device.
  NetworkManagerWifiMode get mode {
    var value =
        _object.getUint32Property(_wirelessDeviceInterfaceName, 'Mode') ?? 0;
    return _decodeWifiMode(value);
  }

  // Bitrate currently in use, in kilobits/second.
  int get bitrate =>
      _object.getUint32Property(_wirelessDeviceInterfaceName, 'Bitrate') ?? 0;

  /// Access points available on this device.
  List<NetworkManagerAccessPoint> get accessPoints {
    var objectPaths = _object.getObjectPathArrayProperty(
            _wirelessDeviceInterfaceName, 'AccessPoints') ??
        [];
    var accessPoints = <NetworkManagerAccessPoint>[];
    for (var objectPath in objectPaths) {
      var accessPoint = _client._getAccessPoint(objectPath);
      if (accessPoint != null) {
        accessPoints.add(accessPoint);
      }
    }

    return accessPoints;
  }

  /// Access point currently in use.
  NetworkManagerAccessPoint? get activeAccessPoint {
    var objectPath = _object.getObjectPathProperty(
        _wirelessDeviceInterfaceName, 'ActiveAccessPoint');
    return _client._getAccessPoint(objectPath);
  }

  /// Device capabilities.
  List<NetworkManagerDeviceWifiCapability> get wirelessCapabilities {
    var value = _object.getUint32Property(
            _wirelessDeviceInterfaceName, 'WirelessCapabilities') ??
        0;
    var flags = <NetworkManagerDeviceWifiCapability>[];
    if ((value & 0x1) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.cipherWEP40);
    }
    if ((value & 0x2) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.cipherWEP104);
    }
    if ((value & 0x4) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.cipherTKIP);
    }
    if ((value & 0x8) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.cipherCCMP);
    }
    if ((value & 0x10) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.wpa);
    }
    if ((value & 0x20) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.rsn);
    }
    if ((value & 0x40) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.ap);
    }
    if ((value & 0x80) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.adhoc);
    }
    if ((value & 0x100) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.freqValid);
    }
    if ((value & 0x200) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.freq2GHz);
    }
    if ((value & 0x400) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.freq5GHz);
    }
    if ((value & 0x1000) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.mesh);
    }
    if ((value & 0x2000) != 0) {
      flags.add(NetworkManagerDeviceWifiCapability.ibssRsn);
    }
    return flags;
  }

  /// Last time this device completed a network scan in milliseconds since boot. -1 if has never scanned for access points.
  int get lastScan =>
      _object.getInt64Property(_wirelessDeviceInterfaceName, 'LastScan') ?? -1;

  /// Request this device to scan for access points.
  Future requestScan([Map<String, DBusValue> options = const {}]) async {
    var args = [
      DBusDict(
          DBusSignature('s'),
          DBusSignature('v'),
          options.map(
              (name, value) => MapEntry(DBusString(name), DBusVariant(value))))
    ];
    var result = await _object.callMethod(
        _wirelessDeviceInterfaceName, 'RequestScan', args);
    var values = result.returnValues;
    if (values.isNotEmpty) {
      throw 'RequestScan returned invalid result: $values';
    }
  }
}

/// Active connection.
class NetworkManagerActiveConnection {
  final String _activeConnectionInterfaceName =
      'org.freedesktop.NetworkManager.Connection.Active';

  final NetworkManagerClient _client;
  final _NetworkManagerObject _object;

  NetworkManagerActiveConnection(this._client, this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_activeConnectionInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// The connection settings.
  NetworkManagerSettingsConnection? get connection {
    var objectPath = _object.getObjectPathProperty(
      _activeConnectionInterfaceName,
      'Connection',
    );
    return _client._getConnection(objectPath);
  }

  /// ID for this connection, e.g. 'Ethernet', 'my-cool-wifi'.
  String get id =>
      _object.getStringProperty(_activeConnectionInterfaceName, 'Id') ?? '';

  /// Unique ID for this connection, e.g. '123e4567-e89b-12d3-a456-426614174000'.
  String get uuid =>
      _object.getStringProperty(_activeConnectionInterfaceName, 'Uuid') ?? '';

  /// Type of this connection, e.g. '802-11-wireless', '802-3-ethernet'.
  String get type =>
      _object.getStringProperty(_activeConnectionInterfaceName, 'type') ?? '';

  /// The state of this connection.
  NetworkManagerActiveConnectionState get state {
    var value =
        _object.getUint32Property(_activeConnectionInterfaceName, 'State') ?? 0;
    return _decodeActiveConnectionState(value);
  }

  /// Flags related to [state].
  List<NetworkManagerActivationStateFlag> get stateFlags {
    var value = _object.getUint32Property(
            _activeConnectionInterfaceName, 'StateFlags') ??
        0;
    var flags = <NetworkManagerActivationStateFlag>[];
    if ((value & 0x01) != 0) {
      flags.add(NetworkManagerActivationStateFlag.isMaster);
    }
    if ((value & 0x02) != 0) {
      flags.add(NetworkManagerActivationStateFlag.isSlave);
    }
    if ((value & 0x04) != 0) {
      flags.add(NetworkManagerActivationStateFlag.layer2Ready);
    }
    if ((value & 0x08) != 0) {
      flags.add(NetworkManagerActivationStateFlag.ip4Ready);
    }
    if ((value & 0x10) != 0) {
      flags.add(NetworkManagerActivationStateFlag.ip6Ready);
    }
    if ((value & 0x20) != 0) {
      flags.add(NetworkManagerActivationStateFlag.masterHasSlaves);
    }
    if ((value & 0x40) != 0) {
      flags.add(
          NetworkManagerActivationStateFlag.lifetimeBoundToProfileVisibility);
    }
    if ((value & 0x80) != 0) {
      flags.add(NetworkManagerActivationStateFlag.external);
    }
    return flags;
  }

  /// True if this is the default IPv4 connection.
  bool get default4 =>
      _object.getBooleanProperty(_activeConnectionInterfaceName, 'Default') ??
      false;

  /// IPv4 configuration for this connection.
  NetworkManagerIP4Config? get ip4Config {
    var objectPath = _object.getObjectPathProperty(
      _activeConnectionInterfaceName,
      'Ip4Config',
    );
    return _client._getIP4Config(objectPath);
  }

  /// DHCPv4 configuration for this connection.
  NetworkManagerDHCP4Config? get dhcp4Config {
    var objectPath = _object.getObjectPathProperty(
      _activeConnectionInterfaceName,
      'DHCP4Config',
    );
    return _client._getDHCP4Config(objectPath);
  }

  /// True if this is the default IPv6 connection.
  bool get default6 =>
      _object.getBooleanProperty(_activeConnectionInterfaceName, 'Default6') ??
      false;

  /// IPv6 configuration for this connection.
  NetworkManagerIP6Config? get ip6Config {
    var objectPath = _object.getObjectPathProperty(
      _activeConnectionInterfaceName,
      'Ip6Config',
    );
    return _client._getIP6Config(objectPath);
  }

  /// DHCPv6 configuration for this connection.
  NetworkManagerDHCP6Config? get dhcp6Config {
    var objectPath = _object.getObjectPathProperty(
      _activeConnectionInterfaceName,
      'DHCP6Config',
    );
    return _client._getDHCP6Config(objectPath);
  }

  /// True if this is a VPN connection.
  bool get vpn =>
      _object.getBooleanProperty(
        _activeConnectionInterfaceName,
        'Vpn',
      ) ??
      false;

  /// Devices this connection uses.
  List<NetworkManagerDevice> get devices {
    var deviceObjectPaths = _object.getObjectPathArrayProperty(
          _activeConnectionInterfaceName,
          'Devices',
        ) ??
        [];
    var devices = <NetworkManagerDevice>[];
    for (var objectPath in deviceObjectPaths) {
      var device = _client._getDevice(objectPath);
      if (device != null) {
        devices.add(device);
      }
    }
    return devices;
  }

  /// Master device if this connection is a slave.
  NetworkManagerDevice? get master {
    var objectPath = _object.getObjectPathProperty(
      _activeConnectionInterfaceName,
      'Master',
    );
    return _client._getDevice(objectPath);
  }
}

/// IPv4 configuration.
class NetworkManagerIP4Config {
  final String _ip4ConfigInterfaceName =
      'org.freedesktop.NetworkManager.IP4Config';

  final _NetworkManagerObject _object;

  NetworkManagerIP4Config(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_ip4ConfigInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// IP addresses. Each item will contain at least 'address' and 'prefix'. e.g. '192.168.1.42' and 24.
  List<Map<String, dynamic>> get addressData =>
      _object.getDataListProperty(_ip4ConfigInterfaceName, 'AddressData') ?? [];

  /// The gateway in use, e.g. '192.168.1.1'.
  String get gateway =>
      _object.getStringProperty(_ip4ConfigInterfaceName, 'Gateway') ?? '';

  /// Routes. Each item will contain at least 'dest' and 'prefix'.
  /// Some routes may include 'next-hop' and 'metric'.
  List<Map<String, dynamic>> get routeData =>
      _object.getDataListProperty(_ip4ConfigInterfaceName, 'RouteData') ?? [];

  /// Nameservers in use. Each item will contain at least 'address'.
  List<Map<String, dynamic>> get nameServerData =>
      _object.getDataListProperty(_ip4ConfigInterfaceName, 'NameServerData') ??
      [];

  /// Domains this address belongs to.
  List<String> get domains =>
      _object.getStringArrayProperty(_ip4ConfigInterfaceName, 'Domains') ?? [];

  /// DNS searches.
  List<String> get searches =>
      _object.getStringArrayProperty(_ip4ConfigInterfaceName, 'Searches') ?? [];

  /// Options that modify the behaviour of the DNS resolver.
  List<String> get dnsOptions =>
      _object.getStringArrayProperty(_ip4ConfigInterfaceName, 'DnsOptions') ??
      [];

  /// Relative priority of DNS servers.
  int get dnsPriority =>
      _object.getInt32Property(_ip4ConfigInterfaceName, 'DnsPriority') ?? 0;

  ///  The Windows Internet Name Service servers associated with the connection.
  List<String> get winsServerData =>
      _object.getStringArrayProperty(
          _ip4ConfigInterfaceName, 'WinsServerData') ??
      [];
}

/// DCHPv4 configuration.
class NetworkManagerDHCP4Config {
  final String _dhcp4ConfigInterfaceName =
      'org.freedesktop.NetworkManager.DHCP4Config';

  final _NetworkManagerObject _object;

  NetworkManagerDHCP4Config(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_dhcp4ConfigInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Configuration options returned by a DHCP server.
  Map<String, dynamic> get options {
    var value = _object.getCachedProperty(_dhcp4ConfigInterfaceName, 'Options');
    if (value == null) {
      return {};
    }
    if (value.signature != DBusSignature('a{sv}')) {
      return {};
    }
    return (value as DBusDict).children.map((key, value) => MapEntry(
        (key as DBusString).value, (value as DBusVariant).value.toNative()));
  }
}

/// IPv6 configuration.
class NetworkManagerIP6Config {
  final String _ip6ConfigInterfaceName =
      'org.freedesktop.NetworkManager.IP6Config';

  final _NetworkManagerObject _object;

  NetworkManagerIP6Config(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_ip6ConfigInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// IP addresses. Each item will contain at least 'address' and 'prefix'. e.g. '2001:db8:85a3::8a2e:370:7334' and 64.
  List<Map<String, dynamic>> get addressData =>
      _object.getDataListProperty(_ip6ConfigInterfaceName, 'AddressData') ?? [];

  /// The gateway in use, e.g. '2001:db8:85a3::8a2e:370:7334'.
  String get gateway =>
      _object.getStringProperty(_ip6ConfigInterfaceName, 'Gateway') ?? '';

  /// Routes. Each item will contain at least 'dest' and 'prefix'.
  /// Some routes may include 'next-hop' and 'metric'.
  List<Map<String, dynamic>> get routeData =>
      _object.getDataListProperty(_ip6ConfigInterfaceName, 'RouteData') ?? [];

  /// Nameservers in use. Each item will contain at least 'address'.
  List<Map<String, dynamic>> get nameServerData =>
      _object.getDataListProperty(_ip6ConfigInterfaceName, 'NameServerData') ??
      [];

  /// Domains this address belongs to.
  List<String> get domains =>
      _object.getStringArrayProperty(_ip6ConfigInterfaceName, 'Domains') ?? [];

  /// DNS searches.
  List<String> get searches =>
      _object.getStringArrayProperty(_ip6ConfigInterfaceName, 'Searches') ?? [];

  /// Options that modify the behaviour of the DNS resolver.
  List<String> get dnsOptions =>
      _object.getStringArrayProperty(_ip6ConfigInterfaceName, 'DnsOptions') ??
      [];

  /// Relative priority of DNS servers.
  int get dnsPriority =>
      _object.getInt32Property(_ip6ConfigInterfaceName, 'DnsPriority') ?? 0;
}

/// DCHPv6 configuration.
class NetworkManagerDHCP6Config {
  final String _dhcp6ConfigInterfaceName =
      'org.freedesktop.NetworkManager.DHCP6Config';

  final _NetworkManagerObject _object;

  NetworkManagerDHCP6Config(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_dhcp6ConfigInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Configuration options returned by a DHCP server.
  Map<String, dynamic> get options {
    var value = _object.getCachedProperty(_dhcp6ConfigInterfaceName, 'Options');
    if (value == null) {
      return {};
    }
    if (value.signature != DBusSignature('a{sv}')) {
      return {};
    }
    return (value as DBusDict).children.map((key, value) => MapEntry(
        (key as DBusString).value, (value as DBusVariant).value.toNative()));
  }
}

/// WiFi access point.
class NetworkManagerAccessPoint {
  final String _accessPointInterfaceName =
      'org.freedesktop.NetworkManager.AccessPoint';

  final _NetworkManagerObject _object;

  NetworkManagerAccessPoint(this._object);

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _object.interfaces[_accessPointInterfaceName]
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Capabilities of this access point.
  List<NetworkManagerWifiAcessPointFlag> get flags {
    var value =
        _object.getUint32Property(_accessPointInterfaceName, 'Flags') ?? 0;
    var flags = <NetworkManagerWifiAcessPointFlag>[];
    if ((value & 0x01) != 0) {
      flags.add(NetworkManagerWifiAcessPointFlag.privacy);
    }
    if ((value & 0x02) != 0) {
      flags.add(NetworkManagerWifiAcessPointFlag.wps);
    }
    if ((value & 0x04) != 0) {
      flags.add(NetworkManagerWifiAcessPointFlag.wpsPushButton);
    }
    if ((value & 0x08) != 0) {
      flags.add(NetworkManagerWifiAcessPointFlag.wpsPin);
    }
    return flags;
  }

  /// WPA security capabilities of this access point.
  List<NetworkManagerWifiAcessPointSecurityFlag> get wpaFlags {
    var value =
        _object.getUint32Property(_accessPointInterfaceName, 'WpaFlags') ?? 0;
    return _decodeWifiAcessPointSecurityFlags(value);
  }

  /// RSN security capabilities of this access point.
  List<NetworkManagerWifiAcessPointSecurityFlag> get rsnFlags {
    var value =
        _object.getUint32Property(_accessPointInterfaceName, 'RsnFlags') ?? 0;
    return _decodeWifiAcessPointSecurityFlags(value);
  }

  /// SSID advertised by the access point.
  /// Note this is in binary form, but is likely to contain a text string.
  List<int> get ssid {
    var value = _object.getCachedProperty(_accessPointInterfaceName, 'Ssid');
    if (value == null) {
      return [];
    }
    if (value.signature != DBusSignature('ay')) {
      return [];
    }
    return (value as DBusArray)
        .children
        .map((e) => (e as DBusByte).value)
        .toList();
  }

  /// Radio frequency of this access point in MHz.
  int get frequency =>
      _object.getUint32Property(_accessPointInterfaceName, 'Frequency') ?? 0;

  /// The hardware address (BSSID) of this access point.
  String get hwAddress =>
      _object.getStringProperty(_accessPointInterfaceName, 'HwAddress') ?? '';

  /// Mode this access point is operating in.
  NetworkManagerWifiMode get mode {
    var value =
        _object.getUint32Property(_accessPointInterfaceName, 'Mode') ?? 0;
    return _decodeWifiMode(value);
  }

  /// Maximum bitrate this access point is capable of in kilobits/second.
  int get maxBitrate =>
      _object.getUint32Property(_accessPointInterfaceName, 'MaxBitrate') ?? 0;

  /// Signal quality of access point in percent.
  int get strength =>
      _object.getByteProperty(_accessPointInterfaceName, 'Strength') ?? 0;

  /// Last time this access point was seen in a scan in seconds since boot.
  int get lastSeen =>
      _object.getInt32Property(_accessPointInterfaceName, 'LastSeen') ?? 0;
}

class _NetworkManagerInterface {
  final Map<String, DBusValue> properties;
  final propertiesChangedStreamController =
      StreamController<List<String>>.broadcast();

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      propertiesChangedStreamController.stream;

  _NetworkManagerInterface(this.properties);

  void updateProperties(Map<String, DBusValue> changedProperties) {
    properties.addAll(changedProperties);
    propertiesChangedStreamController.add(changedProperties.keys.toList());
  }
}

class _NetworkManagerObject extends DBusRemoteObject {
  final interfaces = <String, _NetworkManagerInterface>{};

  void updateInterfaces(
      Map<String, Map<String, DBusValue>> interfacesAndProperties) {
    interfacesAndProperties.forEach((interfaceName, properties) {
      interfaces[interfaceName] = _NetworkManagerInterface(properties);
    });
  }

  void removeInterfaces(List<String> interfaceNames) {
    for (var interfaceName in interfaceNames) {
      interfaces.remove(interfaceName);
    }
  }

  void updateProperties(
      String interfaceName, Map<String, DBusValue> changedProperties) {
    var interface = interfaces[interfaceName];
    if (interface != null) {
      interface.updateProperties(changedProperties);
    }
  }

  /// Gets a cached property.
  DBusValue? getCachedProperty(String interfaceName, String name) {
    var interface = interfaces[interfaceName];
    if (interface == null) {
      return null;
    }
    return interface.properties[name];
  }

  /// Gets a cached boolean property, or returns null if not present or not the correct type.
  bool? getBooleanProperty(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('b')) {
      return null;
    }
    return (value as DBusBoolean).value;
  }

  /// Gets a cached unsigned 8 bit integer property, or returns null if not present or not the correct type.
  int? getByteProperty(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('y')) {
      return null;
    }
    return (value as DBusByte).value;
  }

  /// Gets a cached signed 32 bit integer property, or returns null if not present or not the correct type.
  int? getInt32Property(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('i')) {
      return null;
    }
    return (value as DBusInt32).value;
  }

  /// Gets a cached unsigned 32 bit integer property, or returns null if not present or not the correct type.
  int? getUint32Property(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('u')) {
      return null;
    }
    return (value as DBusUint32).value;
  }

  /// Gets a cached signed 64 bit integer property, or returns null if not present or not the correct type.
  int? getInt64Property(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('x')) {
      return null;
    }
    return (value as DBusInt64).value;
  }

  /// Gets a cached unsigned 64 bit integer property, or returns null if not present or not the correct type.
  int? getUint64Property(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('t')) {
      return null;
    }
    return (value as DBusUint64).value;
  }

  /// Gets a cached string property, or returns null if not present or not the correct type.
  String? getStringProperty(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('s')) {
      return null;
    }
    return (value as DBusString).value;
  }

  /// Gets a cached string array property, or returns null if not present or not the correct type.
  List<String>? getStringArrayProperty(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('as')) {
      return null;
    }
    return (value as DBusArray)
        .children
        .map((e) => (e as DBusString).value)
        .toList();
  }

  /// Gets a cached object path property, or returns null if not present or not the correct type.
  DBusObjectPath? getObjectPathProperty(String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('o')) {
      return null;
    }
    return (value as DBusObjectPath);
  }

  /// Gets a cached object path array property, or returns null if not present or not the correct type.
  List<DBusObjectPath>? getObjectPathArrayProperty(
      String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('ao')) {
      return null;
    }
    return (value as DBusArray)
        .children
        .map((e) => (e as DBusObjectPath))
        .toList();
  }

  /// Gets a cached list of data property, or returns null if not present or not the correct type.
  List<Map<String, dynamic>>? getDataListProperty(
      String interface, String name) {
    var value = getCachedProperty(interface, name);
    if (value == null) {
      return null;
    }
    if (value.signature != DBusSignature('aa{sv}')) {
      return null;
    }
    Map<String, dynamic> convertData(DBusValue value) {
      return (value as DBusDict).children.map((key, value) => MapEntry(
            (key as DBusString).value,
            (value as DBusVariant).value.toNative(),
          ));
    }

    return (value as DBusArray)
        .children
        .map((value) => convertData(value))
        .toList();
  }

  _NetworkManagerObject(DBusClient client, DBusObjectPath path,
      Map<String, Map<String, DBusValue>> interfacesAndProperties)
      : super(client, 'org.freedesktop.NetworkManager', path) {
    updateInterfaces(interfacesAndProperties);
  }
}

/// A client that connects to NetworkManager.
class NetworkManagerClient {
  final String _managerInterfaceName = 'org.freedesktop.NetworkManager';

  /// The bus this client is connected to.
  final DBusClient _bus;
  final bool _closeBus;

  /// The root D-Bus NetworkManager object at path '/org/freedesktop'.
  late final DBusRemoteObject _root;

  // Objects exported on the bus.
  final _objects = <DBusObjectPath, _NetworkManagerObject>{};

  // Subscription to object manager signals.
  StreamSubscription? _objectManagerSubscription;

  /// Creates a new NetworkManager client connected to the system D-Bus.
  NetworkManagerClient({DBusClient? bus})
      : _bus = bus ?? DBusClient.system(),
        _closeBus = bus == null {
    _root = DBusRemoteObject(
      _bus,
      'org.freedesktop.NetworkManager',
      DBusObjectPath('/org/freedesktop'),
    );
  }

  /// Stream of property names as their values change.
  Stream<List<String>> get propertiesChangedStream =>
      _manager?.interfaces['org.freedesktop.NetworkManager']
          ?.propertiesChangedStreamController.stream ??
      Stream<List<String>>.empty();

  /// Connects to the NetworkManager D-Bus objects.
  /// Must be called before accessing methods and properties.
  Future<void> connect() async {
    // Already connected
    if (_objectManagerSubscription != null) {
      return;
    }

    // Subscribe to changes
    var signals = _root.subscribeObjectManagerSignals();
    _objectManagerSubscription = signals.listen((signal) {
      if (signal is DBusObjectManagerInterfacesAddedSignal) {
        var object = _objects[signal.changedPath];
        if (object != null) {
          object.updateInterfaces(signal.interfacesAndProperties);
        } else {
          _objects[signal.changedPath] = _NetworkManagerObject(
              _bus, signal.changedPath, signal.interfacesAndProperties);
        }
      } else if (signal is DBusObjectManagerInterfacesRemovedSignal) {
        var object = _objects[signal.changedPath];
        if (object != null) {
          object.removeInterfaces(signal.interfaces);
        }
      } else if (signal is DBusPropertiesChangedSignal) {
        var object = _objects[signal.path];
        if (object != null) {
          object.updateProperties(
              signal.propertiesInterface, signal.changedProperties);
        }
      }
    });

    // Find all the objects exported.
    var objects = await _root.getManagedObjects();
    objects.forEach((objectPath, interfacesAndProperties) {
      _objects[objectPath] =
          _NetworkManagerObject(_bus, objectPath, interfacesAndProperties);
    });
  }

  /// The list of realized network device.
  /// Realized devices are those which have backing resources (eg from the kernel or a management daemon like ModemManager, teamd, etc).
  List<NetworkManagerDevice> get devices {
    return _getDevices('Devices');
  }

  /// The list of both realized and un-realized network devices.
  /// Un-realized devices are software devices which do not yet have backing resources, but for which backing resources can be created if the device is activated.
  List<NetworkManagerDevice> get allDevices {
    return _getDevices('AllDevices');
  }

  List<NetworkManagerDevice> _getDevices(String propertyName) {
    var deviceObjectPaths = _manager?.getObjectPathArrayProperty(
            _managerInterfaceName, propertyName) ??
        [];
    var devices = <NetworkManagerDevice>[];
    for (var objectPath in deviceObjectPaths) {
      var device = _getDevice(objectPath);
      if (device != null) {
        devices.add(device);
      }
    }

    return devices;
  }

  // FIXME: Checkpoints

  /// True if networking is enabled.
  bool get networkingEnabled {
    return _manager?.getBooleanProperty(
          _managerInterfaceName,
          'NetworkingEnabled',
        ) ??
        false;
  }

  /// True if wireless network is enabled.
  bool get wirelessEnabled {
    return _manager?.getBooleanProperty(
            _managerInterfaceName, 'WirelessEnabled') ??
        false;
  }

  /// Sets if wireless network is enabled.
  set wirelessEnabled(bool value) {
    _manager?.setProperty(
      _managerInterfaceName,
      'WirelessEnabled',
      DBusBoolean(value),
    );
  }

  /// True if wireless network is enabled via a hardware switch.
  bool get wirelessHardwareEnabled {
    return _manager?.getBooleanProperty(
            _managerInterfaceName, 'WirelessHardwareEnabled') ??
        false;
  }

  /// True if mobile broadband is enabled.
  bool get wwanEnabled {
    return _manager?.getBooleanProperty(_managerInterfaceName, 'WwanEnabled') ??
        false;
  }

  /// Sets if mobile broadband is enabled.
  set wwanEnabled(bool value) {
    _manager?.setProperty(
      _managerInterfaceName,
      'WwanEnabled',
      DBusBoolean(value),
    );
  }

  /// True if mobile broadband is enabled via a hardware switch.
  bool get wwanHardwareEnabled {
    return _manager?.getBooleanProperty(
          _managerInterfaceName,
          'WwanHardwareEnabled',
        ) ??
        false;
  }

  /// Currently active connections.
  List<NetworkManagerActiveConnection> get activeConnections {
    var connectionObjectPaths = _manager?.getObjectPathArrayProperty(
          _managerInterfaceName,
          'ActiveConnections',
        ) ??
        [];
    var connections = <NetworkManagerActiveConnection>[];
    for (var objectPath in connectionObjectPaths) {
      var connection = _objects[objectPath];
      if (connection != null) {
        connections.add(NetworkManagerActiveConnection(this, connection));
      }
    }

    return connections;
  }

  /// The primary connection being used to access the network.
  NetworkManagerActiveConnection? get primaryConnection {
    var objectPath = _manager?.getObjectPathProperty(
        _managerInterfaceName, 'PrimaryConnection');
    var connection = _objects[objectPath];
    if (connection == null) {
      return null;
    }

    return NetworkManagerActiveConnection(this, connection);
  }

  /// The type of connection being used to access the network.
  String get primaryConnectionType {
    return _manager?.getStringProperty(
          _managerInterfaceName,
          'PrimaryConnectionType',
        ) ??
        '';
  }

  /// True if the primary connection has traffic limitations.
  NetworkManagerMetered get metered {
    return NetworkManagerMetered.values[
        _manager?.getUint32Property(_managerInterfaceName, 'Metered') ?? 0];
  }

  // FIXME: ActivatingConnection

  /// True is NetworkManager is still starting up.
  bool get startup {
    return _manager?.getBooleanProperty(_managerInterfaceName, 'Startup') ??
        false;
  }

  /// The version of NetworkManager running.
  String get version {
    return _manager?.getStringProperty(_managerInterfaceName, 'Version') ?? '';
  }

  // FIXME: Capabilities

  /// The result of the last connectivity check.
  NetworkManagerConnectivityState get connectivity {
    var value =
        _manager?.getUint32Property(_managerInterfaceName, 'Connectivity') ?? 0;
    return _decodeConnectivityState(value);
  }

  /// True if connectivity checking is available.
  bool get connectivityCheckAvailable {
    return _manager?.getBooleanProperty(
          _managerInterfaceName,
          'ConnectivityCheckAvailable',
        ) ??
        false;
  }

  /// True if connectivity checking is enabled.
  bool get connectivityCheckEnabled {
    return _manager?.getBooleanProperty(
          _managerInterfaceName,
          'ConnectivityCheckEnabled',
        ) ??
        false;
  }

  /// Sets if connectivity checking is enabled.
  set connectivityCheckEnabled(bool value) => _manager?.setProperty(
        _managerInterfaceName,
        'ConnectivityCheckEnabled',
        DBusBoolean(value),
      );

  /// URI used for connectivity checking.
  String get connectivityCheckUri {
    return _manager?.getStringProperty(
          _managerInterfaceName,
          'ConnectivityCheckUri',
        ) ??
        '';
  }

  // FIXME: GlobalDnsConfiguration

  _NetworkManagerObject? get _manager =>
      _objects[DBusObjectPath('/org/freedesktop/NetworkManager')];

  /// Gets the settings object.
  NetworkManagerSettings get settings {
    var object =
        _objects[DBusObjectPath('/org/freedesktop/NetworkManager/Settings')];
    return NetworkManagerSettings(
        this, object ?? _NetworkManagerObject(_bus, DBusObjectPath('/'), {}));
  }

  /// Gets the DNS manager object.
  NetworkManagerDnsManager get dnsManager {
    var object =
        _objects[DBusObjectPath('/org/freedesktop/NetworkManager/DnsManager')];
    return NetworkManagerDnsManager(
        object ?? _NetworkManagerObject(_bus, DBusObjectPath('/'), {}));
  }

  /// Terminates all active connections. If a client remains unclosed, the Dart process may not terminate.
  Future<void> close() async {
    if (_objectManagerSubscription != null) {
      await _objectManagerSubscription!.cancel();
      _objectManagerSubscription = null;
    }
    if (_closeBus) {
      await _bus.close();
    }
  }

  NetworkManagerDevice? _getDevice(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerDevice(this, config);
  }

  NetworkManagerSettingsConnection? _getConnection(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerSettingsConnection(config);
  }

  NetworkManagerActiveConnection? _getActiveConnection(
      DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerActiveConnection(this, config);
  }

  NetworkManagerIP4Config? _getIP4Config(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerIP4Config(config);
  }

  NetworkManagerDHCP4Config? _getDHCP4Config(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerDHCP4Config(config);
  }

  NetworkManagerIP6Config? _getIP6Config(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerIP6Config(config);
  }

  NetworkManagerDHCP6Config? _getDHCP6Config(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerDHCP6Config(config);
  }

  NetworkManagerAccessPoint? _getAccessPoint(DBusObjectPath? objectPath) {
    if (objectPath == null) {
      return null;
    }
    var config = _objects[objectPath];
    if (config == null) {
      return null;
    }
    return NetworkManagerAccessPoint(config);
  }
}
