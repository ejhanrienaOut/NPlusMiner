. .\Include.ps1

$Path = ".\Bin\\Ethash-Phoenix\\PhoenixMiner.exe"
$Uri = "https://github.com/nemosminer/PhoenixMiner-2.5d/releases/download/2.5d/PhoenixMiner_2.5d.zip"

$Commands = [PSCustomObject]@{
    #"bitcore" = " -d $SelGPUCC --api-remote" #Bitcore
    #"jha" = " -d $SelGPUCC" #Jha
    #"blake2s" = " -d $SelGPUCC" #Blake2s
    #"blakecoin" = " -d $SelGPUCC" #Blakecoin
    #"vanilla" = "" #BlakeVanilla
    #"cryptonight" = " -d $SelGPUCC" #Cryptonight
    #"decred" = "" #Decred
    #"equihash" = "" #Equihash
    "ethash" = "" #Ethash
    #"groestl" = "" #Groestl
    #"hmq1725" = " -d $SelGPUCC" #hmq1725
    #"keccak" = "" #Keccak
    #"lbry" = " -d $SelGPUCC --api-remote" #Lbry
    #"lyra2v2" = "" #Lyra2RE2
    #"lyra2z" = " -d $SelGPUCC" #Lyra2z
    #"myr-gr" = "" #MyriadGroestl
    #"neoscrypt" = " -d $SelGPUCC" #NeoScrypt
    #"nist5" = "" #Nist5
    #"pascal" = "" #Pascal
    #"qubit" = "" #Qubit
    #"scrypt" = "" #Scrypt
    #"sia" = "" #Sia
    #"sib" = "" #Sib
    #"skein" = "" #Skein
    #"skunk" = " -d $SelGPUCC --api-remote" #Skunk
    #"timetravel" = " -d $SelGPUCC" #Timetravel
    #"tribus" = " -d $SelGPUCC" #Tribus
    #"x11" = "" #X11
    #"veltor" = "" #Veltor
    #"x11evo" = " -d $SelGPUCC" #X11evo
    #"x17" = " -d $SelGPUCC" #X17
    #"yescrypt" = "" #Yescrypt
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-rmode 0 -cdmport -23334 -cdm 1 -pool $($Pools.Ethash.Host):$($Pools.Ethash.Port) -wal $($Pools.Ethash.User) -pass $($Pools.Ethash.Pass) -proto 4 -coin auto -nvidia"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week}
        API = "Claymore"
        Port = 23334
        Wrap = $false
        URI = $Uri
    }
}