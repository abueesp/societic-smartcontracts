¡Bienvenid@ a la **Academia de Smart Contracts** en español! Este espacio tiene el propósito de presentar una guía introductoria, útil y sencilla, para todos aquellos que deseen empezar a comprender esta tecnología. 

### ¿Qué es Ethereum?

Podemos definir Ethereum de una forma aséptica y algo simplista como una *plataforma social [distribuida](http://www.nils-diewald.de/images/dsn/thumb/dsn-cent-decent-distr-federated.png) y de código abierto para la programación de contratos automatizados*. 

Ethereum fue ideadada por Vitalik Buterin a finales de 2013 en [Ethereum: A Next-Generation Cryptocurrency and Decentralized Application Platform](https://bitcoinmagazine.com/articles/ethereum-next-generation-cryptocurrency-decentralized-application-platform-1390528211), formalmente descrita por Gavin Wood a principios de 2014 en su [Yellow Paper](http://gavwood.com/Paper.pdf), y finalmente lanzada el 30 de julio de 2015.

Según Taylor Gerring el propósito del Proyecto Ethereum es construir una mejor World Wide Web, entre otras características, más privada y descentralizada. Para ello, y entre otras herramientas, cuenta con un sistema de publicación de contenido estático (*Swarm*), un sistema de mensajería privada de bajo nivel (*Whisper*), un sistema de transacciones que no precisa necesariamente de terceros de confianza (*Ethereum blockchain and EVM system*) y una interfaz de usuario integrada (*Mist*).

### Smart contracts

Smart contracts son piezas de código que se valen de un elemento de estado de confianza distribuida a fin de facilitar protocolos y programas destinados a **facilitar la ejecución automatizada de un contrato de forma distribuida***, y su principal desarrollo conceptual fue llevado a cabo por Nick Szasbo durante la década de 1990. En Ethereum pueden ser implementados en varios lenguajes, y son compilados en bytecode para la Máquina Virtual de Ethereum (EVM) antes de desplegar sus efectos en la cadena de bloques.

Cada ***smart contract (contract)*** consta de ***estructuras (struct)***, ***funciones (func)*** y ***estados (state)***, y es ejecutado en [cada nodo](http://ethernodes.org/network/1) de Ethereum simultáneamente, los cuales consensuan su resultado de forma distribuida. El [Ethereum Development Tutorial](https://github.com/ethereum/wiki/wiki/Ethereum-Development-Tutorial) hace notar que el coste de hacer uso de un poder de computación de una EVM tan confiable como ésta es tan alto, que, a efectos prácticos, en términos de carga y optimización se afirma que no debería pensar en programarse algo "que no pudieras ejecutar en un teléfono inteligente del año 1999.

### Ether y gas fee
La empleada en Ethereum es el éter (ether), una unidad de cuenta con [18 decimales](http://ether.fund/tool/converter), que es usada para pagar por la capacidad de procesamiento de la red. Para su desarrollo financiero inicial Ethereum realizó la venta de micromecenazgo (crowdfunding sale) de 60.102.216 éters que estuvo abierta del 7/23/2014 al 9/2/2014, llamada ***[the Genesis Presale](https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf)***, obteniendo 31.591 BTC, que correspondieron a [18.439.086 dólares estadounidenses](http://ether.fund/market) en aquel momento.
http://ether.fund/tool/calculator gas fee y gas price
http://ether.fund/tool/gas-price gas price graph
      <article class="markdown-body entry-content" itemprop="text"><p>Sale documents:</p>
      
###Cuentas
Hay **dos tipos de cuentas** en Ethereum que comparten el mismo espacio de direcciones: **Cuentas de Usuario** que son controladas por _pares de llaves pública y privada_ custodiadas directa o indirectamente por uno o varios sujetos, y **Cuentas de Contratos** que son controladas por el propio _código almacenado_ junto con la cuenta. 

Las **Cuentas de Usuario** están determinadas por las llaves públicas y éstas por las llaves privadas. Primero generas la **Llave Privada** de 64hex: Un número entero positivo aleatoriamente seleccionado (representado por una tabla de bytes con una longitud de 32 en formato big-endian) en el rango [1, secp256k1n − 1]. Entonces creas la **Llave Pública** de 64 bytes desde la llave privada usando el _Algoritmo de Curva Elíptica de Firma Digital (ECDSA)_. La llave privada es creada aleatoriamente, pero la llave pública y el hash que se utiliza como dirección no es aleatorio. Las **Direcciones** de Ethereum son hashes de la llave pública. Para generar uno tienes que generar la llave privada primero. Entonces creas la dirección usando la llave pública de 64 bytes. Calcula el hash _Keccak-256_ de la llave pública. Deberías ahora tener una cadena de 32 bytes (nota: SHA3-256 se terminó convirtiendo en standard tras ser apoyada por el _NIST_ pero Ethereum usa Keccack). Toma los últimos 20 bytes de esta llave pública  (Keccak-256). O, en otras palabras, elimina los primeros 12 bytes. Estos 20 bytes son la dirección, 40 carácteres. Cuando se le añade el prefijo 0x pasa a tener los 42 carácteres de largo.

Convierte llaves públicas en direcciones [modificar main.c y genKATShortMsg.cpp de KeccakTools con los cambios mencionados dará la posibilidad de calcular las direcciones](https://github.com/gvanas/KeccakTools)

###Versiones
[Ethereum Launch Process Milestone](https://blog.ethereum.org/2015/03/03/ethereum-launch-process/):

0. Frontier: La primera versión, el "salvaje Oeste".

1. Homestead: Una red más estable.

2. Metropolis: Un ecosistema diverso de software sencillo de usar, incluyendo Mist -el explorador de Dapps- y herramientas como el Mix -IDE-. A partir de este punto ya no se considera beta.

3. Serenity: La transación al nuevo protocolo y actualizaciones de escalabilidad para ser implantable a nivel industrial.

<ul>
<li><a href="https://www.ethereum.org/pdfs/IntendedUseOfRevenue.pdf">Intended use of revenue</a></li>
<li><a href="https://www.ethereum.org/pdfs/%C4%90%CE%9EVPLAN.pdf">ĐΞV plan</a></li>
<li><a href="https://www.ethereum.org/pdfs/EthereumWhitePaper.pdf">White paper</a></li>
<li><a href="https://www.ethereum.org/pdfs/EthereumYellowPaper.pdf">Yellow paper</a></li>
<li><a href="https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf">Terms and conditions</a></li>
<li><a href="https://www.ethereum.org/pdfs/EtherProductPurchaseAgreement.pdf">Ether Product Purchase Agreement</a></li>

###Antecedentes
Bitcoin, Hashcash, Criptografía asimétrica, zSNARKS, Protocolos de Estado, Tokenización

##Clients
Go https://github.com/ethereum/go-ethereum/wiki/geth

C++ https://github.com/ethereum/cpp-ethereum

Python https://github.com/ConsenSys/pyethereum

Haskell https://github.com/jamshidh/ethereum-client-haskell

Java https://github.com/ethereum/ethereumj

Rust https://github.com/ethcore/parity

JS https://github.com/ethereumjs/node-blockchain-server

###Browsers

Mist https://github.com/tgerring/mist

### POS
https://blog.ethereum.org/2014/11/25/proof-stake-learned-love-weak-subjectivity/

https://blog.ethereum.org/2014/10/03/slasher-ghost-developments-proof-stake/

###Markets

http://coinmarketcap.com/currencies/ethereum/#markets

https://tradeblock.com/markets/krkn/eth-xbt/1h/

### Programming

##Languages
Solidity (based on js/c++) http://ethereum.github.io/solidity/

Serpent (based on Python) https://github.com/ethereum/wiki/wiki/Serpent

LLL (based on Lisp)

Mutan (based on Go) https://github.com/ethereum/go-ethereum/wiki/Mutan


##Framework
Framework Truffle https://github.com/ConsenSys/truffle https://www.youtube.com/watch?v=Evpdt6wFphU

Framework Embark https://github.com/iurimatias/embark-framework https://www.youtube.com/watch?v=DKB_rCVVpWA https://github.com/iurimatias/embark-framework/wiki/Install-on-Linux

Framework Populus https://github.com/pipermerriam/populus

Framework Meteor Dapp Boilerplate https://github.com/SilentCicero/meteor-dapp-boilerplate

Framework Dapple https://github.com/nexusdev/dapple

##Scripters and terminals
Etherscripter Solidity http://chriseth.github.io/browser-solidity/

Etherscripter Block Serpent LLL XML http://etherscripter.com/0-5-1/ 

Etherscripter Solidity Serpent LLL Mutan http://ether.fund/tool/contract

Etherscripter Serpent http://ether.fund/contract/74e25/etherface

Terminal http://ether.fund/tool/terminal

Ethereum TestRPC https://github.com/ConsenSys/eth-testrpc

Ethereum Tester on Dedicated Network https://github.com/ethereum/system-testing

##APIs
Web3 JS Dapp API https://github.com/ethereum/wiki/wiki/JavaScript-API 

Etherscan http://etherscan.io/apis

Ether.fund http://api.ether.fund/

Monitoring Ethereum Transactions in RT https://github.com/ConsenSys/reflux-tx

Ethereum Alarm Governance https://github.com/pipermerriam/ethereum-alarm-governance

ethjsonrpc https://github.com/ConsenSys/ethjsonrpc

##Wallet

Mist Wallet https://github.com/ethereum/mist

MyEtherWallet Javascript Client-Side Key Pair Generator https://www.myetherwallet.com/  (old etheraddress.org) https://github.com/kvhnuke/etherwallet Bulk Encrypted SendOffline

JS Cold Wallet Generator https://github.com/ryepdx/ethaddress.org -> Trust here https://www.reddit.com/r/ethereum/comments/3jz85n/ethaddressorg_paper_wallets_for_ethereum/ Bulk Encrypted Vanity Split

Lightwallet register keystore API https://github.com/ConsenSys/uport-sso.js

Lightwallet https://github.com/ConsenSys/eth-lightwallet

Lightwallet Keystore server https://github.com/ConsenSys/keyserver

Lightwallet ColdStorage Solution https://github.com/ConsenSys/icebox

Cold Vanity Address Generators: Python Vanityreum.py https://github.com/antonio-fr/Vanityreum

Disposable Ethereum Wallet https://ethereumwallet.com

Wallet Interface for Geth http://etherwall.com/ https://github.com/almindor/etherwall

Go Cold Wallet Vanity Vanyeth https://github.com/makevoid/vanieth

JS Cold Vanity Wallet https://github.com/whitj00/ethereum-vanity

Cold Key Pair Generation Vitalik Python http://vitalik.ca/files/python_cold_wallet_instructions.txt


##JS
Meteor Embark https://github.com/hitchcott/meteor-embark

Meteor Dapp Catalog https://github.com/ethereum/meteor-dapp-catalog

Web3.js https://github.com/ethereum/web3.js/tree/master

Extension Web3.js https://github.com/ConsenSys/ether-pudding

ReactJS Framework https://github.com/ConsenSys/acid-reflux

Admin Panel for contracts in JS HTML https://github.com/tgerring/abi2html-js

Hooked Web3 provider for external devices or programs to manage keys and sign transactions (Ethereum Trezor) https://github.com/ConsenSys/hooked-web3-provider

Blockapps Web3 https://github.com/ConsenSys/blockapps-web3

Address to IP and Address to URL DNS https://github.com/ConsenSys/addresstoip https://github.com/ConsenSys/addresstourl

Build Solidity Contracts as JS https://github.com/ConsenSys/sol-builder

###Other tools
Package Solidity and Serpent for Atom https://atom.io/packages/language-ethereum

Solidity Contract Viewer https://github.com/ConsenSys/contract-viewer

Ethereum Wiki Information Source https://github.com/ethereum/wiki

Ethereum Wiki Dev Best Practices https://github.com/ConsenSys/Ethereum-Development-Best-Practices/wiki

Current EIPs https://github.com/ethereum/EIPs

About RLPx https://github.com/ethereum/devp2p/blob/master/rlpx.md

RLPx python https://github.com/ConsenSys/pydevp2p

DappStore https://dappstore.io https://github.com/ConsenSys/dapp-store-contracts

Address Explorer https://github.com/ConsenSys/address-explorer

Address List http://etherscan.io/accounts?sort=balance&order=desc

Blockexplorer EtherCamp https://live.ether.camp/account/fd2487cc0e5dce97f08be1bc8ef1dce8d5988b4d

Blockexplorer EtherScan http://etherscan.io/advsearch

Chat https://gitter.im

Ethnetstats https://ethstats.net/

101 https://medium.com/@ConsenSys/a-101-noob-intro-to-programming-smart-contracts-on-ethereum-695d15c1dab4#.g0rcl2rnt

BTCrelay https://github.com/ethereum/btcrelay https://github.com/ConsenSys/btcrelay-fetchd

Offchain processing https://github.com/ConsenSys/Flare

Encrypted queries, dapp stackexchange, identity registry and so forth from Oraclize https://github.com/oraclize

How to deploy a DAO https://github.com/slockit/DAO/wiki/How-To-Deploy-A-DAO-%5Bnon-devs%5D

##Games
Ether Crawler https://github.com/ConsenSys/ether-crawler

Etheria https://github.com/fivedogit/etheria

https://github.com/ConsenSys/dao-wars

##Algos
https://github.com/ethereum/wiki/blob/master/Dagger-Hashimoto.md http://vitalik.ca/ethereum/dagger.html

##Environment

    Ethereum
    Bitshares / Graphene
    Engima
    MaidSafe
    Dash
    Eris (as a platform)
    Tendermint (as a deterministic building block)

Corporate 

    OBC (IBM)
    Ripple
    Digital Assets
    BlockStream

Storage

    IPFS https://ipfs.io https://github.com/ipfs/papers + Swarm  (https://github.com/ipfs/awesome-ipfs)
    Tahoe-LAFS
    Storj

SmartContracts
    
    Codex Pax https://medium.com/@PaxDirectory/codex-a-legal-scripting-language-e3723cc76662#.eqovmsvh5
    CommonAccord www.commonaccord.org http://hardjono.mit.edu/sites/default/files/documents/CommonAccord_Provenance_11182015.pdf

