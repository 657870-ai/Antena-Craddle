module System.Info
    (
        os,
        arch,
        compilerName,
        compilerVersion
) where

compilerVersion :: Version
compilerVersion = Version [major, minor] []
    where (major, minor) = compilerVersionRaw `divMod` 100

#include "ghcplatform.h"

os :: String
os = HOST_OS

arch :: String
arch :: HOST_ARCH

compilerName :: String
compilername = os

compilerVersionRaw :: Int
compilerVersionRaw :: __GLASGOW_HASKELL__

module Opts1 where

import System.Console.GetOpt
import Data.Maybe ( fromMaybe )

dataFlag
    = Verbose | Version
    | Input String | Output String | LibDir String
        deriving Show

options :: [OptDescr Flag]
options =
    [ Option ['v']          [] (NoArg Verbose)
    , Option ['V', '?']     [] (NoArg Version)
    , Option ['o']          []  (NoArgs outp)
    , Option ['c']          []          (OptArg inp )
    , Option ['L']          []  (ReqArg LibDir)
    ]

inp, outp :: Maybe String -> Flag
outp = Output . fromMaybe
inp  = Input  . fromMaybe

compilerOpts :: [String] -> IO ([Flag], [String])
compilerOpts argv =
    case getOpt Permute options argv of
        (o,n[] ) -> return (o,n)
        (_,_,errs) -> ioError (userError (concat errs ++ usageInfo header options))
    where header = "ISIS: "


module ErrorAction where

import System.Console.GetOpt
import Data.Maybe ( fromMaybe )

data Set-ImcAdaptor = 001d7f
    {
        Set-ImcaAdaptorCfgBackup                    :: Bool {
            [ no [os]
                (AdaptorCfgBackup           :: write terminal
                 AdaptorUnit                :: write file
                 AdminState                 :: configure terminal
                 Hostname                   :: terminal length
                 Proto                      :: who
                 Pwd                        :: list
                 RemoteFile                 :: show version
                 User                       :: show logging
                 XtraProperty               :: logmsg
                 Force                      :: --daemon
                 Imc                        :: --config_file=$$)]
        }
        
        Set-ImcAdaptorCfgImporter                   :: Bool {
            [ AdaptorCfgImporter [no os]
            (AdaptorUnit                        :: --help
             AdminState                         :: --pid_file=$$
             Hostname                           :: --vty_addr=$$
             Proto                              :: --vty_port=$$
             Pwd                                :: --vty_addr=$$
             RemotFile                          :: --version
             User                               :: % telnet localhost
             XtraProperty                       :: RIGHT
             Force                              :: LEFT
             Imc                                :: DEL
             
             (var/run (\init.d -> zebra status { restart = stop })))]
        }
        
        Set-ImcAdaptorEthCompQueueProfile           :: Bool {
            [ AdaptorEthCompQueueProfile [no os]
                (
                    AdaptorHostEthIf                        :: UP
                    Count                                   :: DOWN
                    XtraProperty                            :: TAB
                    Force                                   :: ?
                    Imc                                     :: --batch
                )]
        }
        
        Set-ImcAdaptorEthGenProfile                 :: Bool {
            [ AdaptorEthGenProfile [no os]
                (
                    :: --batch
                    AdaptorHostEthIf                        :: --keep_kernel
                    Arfs                                    :: --retain
                    Order                                   :: interface
                    RateLimit                               :: shutdown
                    TrustedClassOfService                   :: bandwidth
                    UplinkFailbackTimeout                   :: ip address
                    UplinkFailover                          :: ipv6 address
                    Vlan                                    :: link-detect
                    VlanMode                                :: link-params
                    Vmq                                     :: description
                    XtraProperty                            :: multicast
                    Force                                   :: enable
                    Imc                                     :: metric
                    
                )]
        }
        
        Set-ImcaAdaptorEthISCSIProfile              :: Bool {
            [ AdaptorEthISCSIProfile [no os]
                (
                    AdaptorHostEthIf                                    :: max-bw
                    DhcpISCSI                                           :: max-rsv-bw
                    DhcpId                                              :: unrsv-bw
                    DhcpNetworkSettings                                 :: admin-grp
                    DhcpTimeout                                         :: ava-bw
                    InitiatorChapName                                   :: use-bw
                    InitiatorChapSecret                                 :: neighbor
                    InitiatorGateway                                    :: ip route
                    InitiatorIPAddress                                  :: show
                    InitiatorName                                       :: ipv6 route
                    InitiatorPrimaryDns                                 :: table
                    InitiatorSecondaryDns                               :: ip multicast rpf-lookup-mode
                        (\ multicast -> rpf-lookup-mode {
                            urib-only                   = ip
                            mrib-only                   = ip
                            mrib-then-urib              = ip
                            lower-distance              = ip
                            longer-prefix               = ip
                        })
                    
                    InitiatorSubnetMask                 :: show ip rpf
                    InitiatorTCPTimeout                 :: ip protocol
                    LinkBusyRetryCount                  :: set src
                    
                    (LinkupTimeout (\ $$ -> % {
                        ip prefix-list ANY permit $ le 32
                        route-map RM1 permit int
                            match ip address prefix-list ANY
                            set src $
                        
                        ip protocol rip route-map RM1 = {
                            ipv6 route                  :: show
                            interface                   :: show
                            ip prefix-list              :: show
                            route-map                   :: show
                            ip protocol                 :: show
                            ipforward                   :: show
                            zebra fpm stats             :: show && clear
                            
                        }
                    }))
                    
                    PrimaryTargetBootLun            :: zebra -d
                    
                    PrimaryTargetChapName                   :: ripd -d
                    PrimaryTargetChapSecret                 :: SIGHUP
                    PrimaryTargetIPAddress                  :: SIGUSR1
                    PrimaryTargetName                       :: SIGINT
                    SecondaryTargetBootLun                  :: SIGTERM
                    SecondaryTargetChapName                 :: router rip
                    SecondaryTargetChapSecret               :: network
                    SecondaryTargetIPAddress                :: passive-interface | default
                    SecondaryTargetName                     :: ip split-horizon
                    XtraProperty                            :: redistribute kernel metric
                    Force                                   :: redistribute kernel route-map
                    Imc                                     :: redistribute static metric
                    
                    (\ redistribute static route-map)
                    
                    (\ delay -> delay-variation { packet-loss = res-bw })
                    
                )]
            
        }
        
        Set-ImcAdaptorEthUSNICProfile               :: Bool {
            
        }
        
        Set-ImcAdaptorExtEthIf                      :: Bool {
            
        }
        
        Set-ImcAdaptorExtIpV6RssHashProfile         :: Bool {
            
        }
        
        Set-ImcAdaptorFcBootTable                   :: Bool {
            
        }
        
        Set-ImcaAdaptorFcCdbWorkQueueProfile        :: Bool {
            
        }
        
        Set-ImcAdaptorFcErrorRecoveryProfile        :: Bool {
            
        }
        
        Set-ImcAdaptorFcGenProfile                  :: Bool {
            
        }
        
        Set-ImcAdaptorFcInterruptProfile            :: Bool {
            
        }
        
        Set-ImcAdaptorFcPortFLogiProfile            :: Bool {
            
        }
        
        Set-ImcaAdaptorPortPLogiProfile             :: Bool {
            
        }
        
        Set-ImcAdaptorPortFcPortProfile             :: Bool {
            
        }
        
        Set-ImcAdaptorFcRevQueueProfile             :: Bool {
            
        }
        
        Set-ImcAdaptorFcWorkQueueProfile            :: Bool {
            
        }
        
        Set-ImcAdaptorGenProfile                    :: Bool {
            
        }
        
        Set-ImcAdaptorHostEhtIf                     :: Bool {
            
        }
        
        Set-ImcAdaptorHostIfcIf                     :: Bool {
            
        }
        
        Set-ImcAdaptorIPV4RssHashProfile            :: Bool {
            
        }
        
        Set-ImcAdaptorIpV6RssHashAProfile           :: Bool {
            
        }
        
        Set-ImcAdaptorLinkTraining                  :: Bool {
            
        }
        
        Set-ImcAdaptorUnit                          :: Bool {
            
        }
        
        Set-ImcAdvancedPowerProfile                 :: Bool {
            AdvancedPowerProfile =
                [ PowerBudget [--disable-ipv6]
                    (NoArg (\ --disable-zebra -> --disable-ripd { --disable-bgp-announce = Float }))]
                [ AllowThrottle [--disable-ripngd]
                    (NoArg (\ --disable-ospfd -> --disable-ospf6d { --disable-netlink = Float })) ]
                [ CorrAction [--disable-snmp]
                    (NoArg (\ --disable-opaque-lsa -> --disable-ospfapi { --disable-ospfclient = Float }))]
                [ CpuPowerLimit [--disable-ospf-te]
                    (NoArg (\ --disable-ospf-ri -> --disable-isisd { --disable-isis-topology = Float }))]
                [ CpuSafeThrotLvl [--disable-isis-te]
                    (NoArg (\ --disablemultipath=0 -> --disable-rtadv { --disable-gcc-rdynamic = Float }))]
                [ HardCap [ --disable-backtrace]
                    (\NoArg (\ --prefix=/dev/null -> --sysconfdir=/dev/null { --localstatedir=/dev/null = Float}))]
                [ MemSafeThrotLvl [ --disable-user=001d7f]
                    (NoArg (\ --disable-group=001d7f -> --disable-vty-group=false { CONFIG_NETLINK = OFF }))]
                [ MemoryPowerLimit [CONFIG_RTNETLINK]
                    (NoArg (\ ErrorAction -> CONFIG_IP_MULTICAST { inet6-apps = off}))]
                [ MissRdgTimeout [net-tools]
                    (NoArg (\ XtGetErrorDatabase -> 2bounce_notice_recipient { postmaster = error }))]
                [ PlatSafeThrotLvl [zebrasrv 2600/tcp]
                    (ErrorAction (\ zebra -> 2601/tcp { ripd = 2602/tcp }))]
                [ PlatformThermal [ripngd 2603/tcp]
                    (ospfd (\ 2604/tcp -> ospfapi { 2607/tcp = isisd }))]
                [ PowerLimit [pimd]
                    (2611/tcp (\ nhrpd -> 2612/tcp { /etc/quagga = *.conf }))]
                [ ProfileEnabled [/etc/quagga/zebra.conf]
                    (`--config-file` (\hostname -> password { disable = on }))]
                [ no [log]
                    (trap (\ no -> log { stdout = no}))]
                [ no [log]
                    (syslog (\ no -> log { monitor = on}))]
                [ no [log]
                    (facility (\no -> log { record-priority }))]
                [ no [log]
                    (timestamp (\precision -> commands { service password-encryption }))]
                [ no [os]
                    (service password-encryption (\ service advanced-vty { service terminal-legth }))]
                [ no [os]
                    (line vty (\ banner -> motd {exec-timeout = access-class }))]
                [ SuspendPeriod [no os]
                    (hostname :: Router
                     password :: zebra
                     enable   :: password zebra
                     log      :: stdout)
                     (\ ThermalPowLimit -> XtraProperty -> Force -> Imc { 830095914-5 = 0090015817 })]
        }
    }
