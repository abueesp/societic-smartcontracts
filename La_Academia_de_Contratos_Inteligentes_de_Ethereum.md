¡Bienvenid@ a la **Academia de Smart Contracts de Ethereum** en español! Este espacio tiene el propósito de presentar una guía introductoria, útil y sencilla, para todos aquellos que deseen empezar a comprender esta tecnología. 

### ¿Qué es Ethereum?

Podemos definir Ethereum de una forma aséptica y algo simplista como una *plataforma social [distribuida](http://www.nils-diewald.de/images/dsn/thumb/dsn-cent-decent-distr-federated.png) y de código abierto para la programación de contratos automatizados*. 

Ethereum fue ideadada por Vitalik Buterin a finales de 2013 en [Ethereum: A Next-Generation Cryptocurrency and Decentralized Application Platform](https://bitcoinmagazine.com/articles/ethereum-next-generation-cryptocurrency-decentralized-application-platform-1390528211), formalmente descrita por Gavin Wood a principios de 2014 en su [Yellow Paper](http://gavwood.com/Paper.pdf), y finalmente lanzada el 30 de julio de 2015.

Según Taylor Gerring el propósito del Proyecto Ethereum es construir una mejor World Wide Web, entre otras características, más privada y descentralizada. Para ello, y entre otras herramientas, cuenta con un sistema de publicación de contenido estático (*Swarm*), un sistema de mensajería privada de bajo nivel (*Whisper*), un sistema de transacciones que no precisa necesariamente de terceros de confianza (*Ethereum blockchain and EVM system*) y una interfaz de usuario integrada (*Mist*).

### Smart contracts

Smart contracts son piezas de código que se valen de un elemento de estado de confianza distribuida a fin de facilitar protocolos y programas destinados a **facilitar la ejecución automatizada de un contrato de forma distribuida***, y su principal desarrollo conceptual fue llevado a cabo por Nick Szasbo durante la década de 1990. En Ethereum pueden ser implementados en varios lenguajes, y son compilados en bytecode para la Máquina Virtual de Ethereum (EVM) antes de desplegar sus efectos en la cadena de bloques.

Cada ***smart contract (contract)*** consta de ***estructuras (struct)***, ***funciones (func)*** y ***estados (state)***, y es ejecutado en [cada nodo](http://ethernodes.org/network/1) de Ethereum simultáneamente, los cuales consensuan su resultado de forma distribuida. El [Ethereum Development Tutorial](https://github.com/ethereum/wiki/wiki/Ethereum-Development-Tutorial) hace notar que el coste de hacer uso de un poder de computación de una EVM tan confiable como ésta es tan alto, que, a efectos prácticos, en términos de carga y optimización se afirma que no debería pensar en programarse algo "que no pudieras ejecutar en un teléfono inteligente del año 1999.

### Ether y gas
La unidad empleada en Ethereum es el éter (ether), una unidad de cuenta con [18 decimales](http://ether.fund/tool/converter), que es usada para pagar por la capacidad de procesamiento de la red. Para su desarrollo financiero inicial Ethereum realizó la venta de micromecenazgo (crowdfunding sale) de 60.102.216 éters que estuvo abierta del 7/23/2014 al 9/2/2014, llamada ***[the Genesis Presale](https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf)***, obteniendo 31.591 BTC, que correspondieron a [18.439.086 dólares estadounidenses](http://ether.fund/market) en aquel momento.
http://ether.fund/tool/calculator gas fee y gas price
http://ether.fund/tool/gas-price gas price graph

Cada operación es cargada con una cierta suma de gas, cuyo propósito es limitar la cantidad de trabajo que es necesitada para ejecutar la transacción y pagar por su ejecución. Con ello se procura evitar el spam y mantener la estabilidad de la red. Mientras la EVM ejecuta la transacción, el gas es gradualmente consumido de acuerdo con reglas específicas.

El precio del gas o `gas price` es un valor determinado por el creador de la transacción que es quien paga el mismo por ejecutar dicha llamada a un contrato o realizar una transacción. Si algo de gas sobra tras la ejecución, le es devuelto. Si el gas se termina antes de alcanzarse el requerido, se desencadena una excepción `out of gas`, la cual revierte todas las modificaciones hechas al estado por el actual llamda (`call frame`).
      
###Cuentas
Hay **dos tipos de cuentas** en Ethereum que comparten el mismo espacio de direcciones: **Cuentas de Usuario** que son controladas por _pares de llaves pública y privada_ custodiadas directa o indirectamente por uno o varios sujetos, y **Cuentas de Contratos** que son controladas por el propio _código almacenado_ junto con la cuenta. A octubre de 2016 las cuentas de contratos representan un 10% de las cuentas totales.

Las **Cuentas de Usuario** están determinadas por las llaves públicas y éstas por las llaves privadas. Primero generas la **Llave Privada** de 64hex: Un número entero positivo aleatoriamente seleccionado (representado por una tabla de bytes con una longitud de 32 en formato big-endian) en el rango [1, secp256k1n − 1]. Entonces creas la **Llave Pública** de 64 bytes desde la llave privada usando el _Algoritmo de Curva Elíptica de Firma Digital (ECDSA)_. La llave privada es creada aleatoriamente, pero la llave pública y el hash que se utiliza como dirección no es aleatorio. Las **Direcciones** de Ethereum son hashes de la llave pública. Para generar uno tienes que generar la llave privada primero. Entonces creas la dirección usando la llave pública de 64 bytes. Calcula el hash _Keccak-256_ de la llave pública. Deberías ahora tener una cadena de 32 bytes (nota: SHA3-256 se terminó convirtiendo en standard tras ser apoyada por el _NIST_ pero Ethereum usa Keccack). Toma los últimos 20 bytes de esta llave pública  (Keccak-256). O, en otras palabras, elimina los primeros 12 bytes. Estos 20 bytes son la dirección, 40 carácteres. Cuando se le añade el prefijo 0x pasa a tener los 42 carácteres de largo.

Convierte llaves públicas en direcciones [modificar main.c y genKATShortMsg.cpp de KeccakTools con los cambios mencionados dará la posibilidad de calcular las direcciones](https://github.com/gvanas/KeccakTools)
###Versiones
[Ethereum Launch Process Milestone](https://blog.ethereum.org/2015/03/03/ethereum-launch-process/):

0. Frontier: La primera versión, el "salvaje Oeste".

1. Homestead: Una red más estable.

2. Metropolis: Un ecosistema diverso de software sencillo de usar, incluyendo Mist -el explorador de Dapps- y herramientas como el Mix -IDE-. A partir de este punto ya no se considera beta.

3. Serenity: La transación al nuevo protocolo y actualizaciones de escalabilidad para ser implantable a nivel industrial.



###Almacenamiento, memoria y pila

Cada cuenta tiene una primera área de memoria persistente la cual es llamada **Almacenamiento** (`storage`). El Almacenamiento es un valor-llave almacenado que mapea Palabras (`words`) de 256 bits/32bytes. No es posible enumerar el Almacenamiento desde dentro del contrato y es comparativamente costoso de leer y, incluso más, modificar lo almacenado. Un contrato no puede ni leer ni escribir ningún almacenamiento aparte del suyo.

La segunda área de memoria es llamada **Memoria** (`memory`), de la cual un contrato obtiene un ejemplo nuevo en blanco para cada llamada de mensaje (`message call`). La Memoria puede ser direccionada at byte level, pero ha de ser leída y escrita en Trozos (`chunks`) de 32 bytes (256 bits). La Memoria es más costosa cuanto más crece, escalando cuadráticamente. 

La EVM no es una máquina de registro de entradas de bases de datos, sino una [Pila de llamadas](https://es.wikipedia.org/wiki/Pila_de_llamadas) [LIFO](https://es.wikipedia.org/wiki/LIFO) (`stack` o `call stack`), de tal forma que todas las operaciones computacionales se llevan a cabo en su área. Ésta tiene un tamaño máximo de 1024 elementos conteniendo Palabras de 256 bits. La estructura de la **Pila**, de arriba a abajo, es la siguiente: Es posible copiar uno de los primeros 16 elementos a la parte superior de la pila, es decir, intercambiar el elemento superior con cualquiera de los 16 elementos por debajo del mismo. Todas las operaciones toman dos elementos, uno a uno o los dos a la vez dependiendo de la operación, y ponen los resultados en la parte superior de la pila. Es posible mover elementos de la pila para almacenarnos en la memoria, pero no es posible acceder a elementos arbitrarios que se encuentren más abajo de la pila sin primero remover los que se encuentran primero. 

###Set de instrucciones

El Set de Instrucciones de la EVM es guardado en su mínima expresión para evitar incorrectas implementaciones las cuales podrían causar problemas. Todas las instrucciones operan en el más básico tipo de dato, Palabras de 256 bits. La aritmética habitual presenta operaciones compartivas con lógica binaria. Así, saltos condicionales o incondicionales son posibles. Además, los contratos pueden acceder propiedades relevates del bloque actual, como son su número y timestamp.

###Llamadas

####Llamadas de mensaje
Los contratos pueden llamar otras Cuentas de Contratos o enviar ethers a Cuentas de Usuario. Los Contratos pueden llamar otros contratos o enviar ethers a Cuentas de usuario mediante **Llamadas de mensaje** (`mensaje calls`). Las Llamadas de mensaje son similares a las transaciciones, en las que **tienen una dirección fuente, una dirección objetivo, un payload de datos, ethers, gas y `return data`**. De hecho, cada transacción consiste en una Llamada de mensaje de nivel superior la cual a su vez puede crear otras llamadas de mensaje.

Un contrato que realize una llamada (`caller`) puede decidir cuánto de su gas remanente debería ser enviado con la Llamada de mensaje interna y cuánto querría retener. Si una `out-of-gas exception` o cualquier otra excepción ocurre en la llamada interna, esto será señalado por un valor erróneo puesto en la pila. En Solidity, la llamada del contrato causa una excepción manual por defecto en tales situaciones, de tal forma que las excepciones son anuladas haciendo rebosar la Pila de llamadas. Es decir, en este caso, sólo el gas enviado junto con la llamada es utilizado y la operación realizada se considera nula revirtiéndose sus efectos.

Será de la Memoria de donde el contrato obtendrá un ejemplo nuevo en blanco para cada llamada de mensaje (`message call`) y obtiene acceso a la Llamada payload -la cual será provista en una área separada llamada `calldata`. Después de haber finalizado su ejecución, puede retornar datos lo cuales serán almacenados en la Memoria de llamada previamente determinada por el contrato que realiza la llamada. Las llamadas son limitadas a la profundidad de 1024, lo cual significa que durante operaciones más complejas, los `loops` deberían ser preferidos sobre las llamadas recursivas (`recursive calls`) -optimización-.

#### Llamadas delegadas / Librerías y código de llamadas

Ahí existe una especial variante de la llamada de mensaje, denominada **Llamadas delegadas** (`delegatecall`) que es idéntica a las llamadas de mensaje excepto por el hecho de que el código es ejecutado en el contexto del contrato llamador (su dirección objetivo siempre le pertenece) por lo que el msg.sender y el msg.value no cambian sus valores. Esto significa que el contrato puede dinamicamente cargar código de diferentes direcciones sobre la marcha. Almacenamiento, la dirección actual y el balance todavía se refieren al contrato que llama, sólo **tienen `payload de datos` y el `return data`**. Esto hace posible implementar la propiedad "librería" en Solidity: Librerías de código reutilizable que puede se raplicado a un contrato almacenado a fin de, por ejemplo, implementar estructuras más complejas. 

####Llamadas al registro de llamadas

Es posible almacenar datos en una estructura de datos especialmente indexada que mapee todos ellos hasta bien entrado el nivel del bloque. Esta propiedad de ir recopilando **Registros de llamadas** (`called logs`) es usada por Solidity a fin de implementar un histórico de eventos. Los contratos no pueden acceder llamadas a los logs después de que hayan sido creados, pero pueden eficientemente acceder desde fuera de la blockchain. Mientras que los datos de registro de llamadas esté almacenado en filtros bloom es posible buscar estos datos de una forma eficiente y criptográficamente segura, de tal forma que los pares de la red que no han descargado toda la blockchain (`light clients`) pueden aún así encontrar dichos registros. Los [filtros de Bloom](https://en.wikipedia.org/wiki/Bloom_filter) sirven para preguntar si un elemento está en un conjunto, y la respuesta puede ser "no, el elemento no está en el conjunto", de forma rotunda, siempre fiable, o bien "puede ser que el elemento esté en el conjunto", con un grado de certidumbre aproximado. De esta manera, Ethereum usa filtros bloom para verificar que se ha realizado una operación sin tener que consultar la información en toda la red.


####Llamadas de creación de contratos
Los contratos pueden incluso crear otros contratos usando un operador (`opcode`) especial, y no únicamente llamar a direcciones. La única diferencia entre estas **Llamadas de creación de contratos** (`create calls`) y las Llamadas de mensaje (`mensage call`) corrientes es que el `payload data` es ejecutado y el resultado almacenado como código y el contrato que realiza la llamada de creación recibe la dirección del nuevo contrato en la Pila de llamadas.
.
####Llamadas de autodestrucción 
La única posibilidad en la que un código puede ser retirado de la blockchain es cuando un contrato llama (`selfdestruct call`) a la dirección que realiza la operación de autodestrucción (`SELFDESTRUCT`). Los ethers sobrantes almacenados en la dirección son enviados a una dirección objetivo determinada y entonces el cógigo y el Almacenamiento son retirados. Fíjate que incluso si el código del contrato no contiene el operador SELFDESTRUCT, todavía puede llevar a cabo dicha operación usando `delegatecall` o `callcode`.


###Documentación
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

### Pools

No registration required
1. http://ethereumpool.co/ - 0.8% fees. Payouts released 2 times a day for balances higher than 0.5 ETH.
2. http://dwarfpool.com/ - 2% fees. Payouts released 4-6 times a day for balances higher than 1 ETH.
3. http://weipool.org/ - 0% fees. Payouts released every 24 hours for balances higher than 1 ETH.
4. http://ethpool.org/ - Predictable Solo Mining pool. 0% fees. Payouts after 10 confirmations. More info on @dr_pra comments below.
5. http://nanopool.org/ - PPLNS 1% fees. Payouts released 2 times a day for balances higher than 0.1 ETH.

Requires registration
1. https://eth.suprnova.cc/ - 1% fees. Payouts are up to the miner (Manual or Automatic from 0.01 ETH).
2. https://coinotron.com - PPLNS 1 % fees. RBPPS 4% fees. Payouts are up to the miner (Manual from 0.1 ETH).
3. https://www2.coinmine.pl/eth/index.php - 1% fees. 

### Programming

##Languages
Solidity (based on js/c++) http://ethereum.github.io/solidity/

Serpent (based on Python) https://github.com/ethereum/wiki/wiki/Serpent

LLL (based on Lisp)

Mutan (based on Go) https://github.com/ethereum/go-ethereum/wiki/Mutan

###Tesnets
Morden https://github.com/ethereum/wiki/wiki/Morden

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
API contract https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI.sol Eth examples https://github.com/oraclize/ethereum-examples


How to deploy a DAO https://github.com/slockit/DAO/wiki/How-To-Deploy-A-DAO-%5Bnon-devs%5D

##Games
FirstBlood https://firstblood.io/
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

