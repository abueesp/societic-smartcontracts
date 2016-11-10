¡Bienvenid@ a la **Academia de Smart Contracts de Ethereum** en español! Este espacio tiene el propósito de presentar una guía introductoria, útil y sencilla, para todos aquellos que deseen empezar a comprender esta tecnología. 

### ¿Qué es Ethereum?

Podemos definir Ethereum de una forma aséptica y algo simplista como una *red de nodos con una base de datos [distribuida](http://www.nils-diewald.de/images/dsn/thumb/dsn-cent-decent-distr-federated.png) con estado bajo licencia libre para la programación de contratos automatizados*.

Ethereum fue ideadada por Vitalik Buterin a finales de 2013 en [Ethereum: A Next-Generation Cryptocurrency and Decentralized Application Platform](https://bitcoinmagazine.com/articles/ethereum-next-generation-cryptocurrency-decentralized-application-platform-1390528211), formalmente descrita por Gavin Wood a principios de 2014 en su [Yellow Paper](http://gavwood.com/Paper.pdf), y finalmente lanzada el 30 de julio de 2015.

Según Taylor Gerring el propósito del Proyecto Ethereum es construir una mejor World Wide Web, entre otras características, más privada y descentralizada. Para ello, entre otras herramientas y aplicaciones, cuenta con un sistema de publicación de contenido estático (*IPFS*), un sistema de mensajería privada de bajo nivel (*Whisper*), un sistema de transacciones que no precisa necesariamente de terceros de confianza (*Ethereum blockchain and EVM system*) y una interfaz de usuario integrada (*Mist*).

### Smart contracts

Smart contracts son piezas de código que se valen de un elemento de estado y de una red distribuida a fin de facilitar protocolos de estado y programas destinados a **facilitar la ejecución automatizada de un contrato de forma distribuida***, y su principal desarrollo conceptual fue llevado a cabo por Nick Szasbo durante la década de 1990. En Ethereum pueden ser implementados en varios lenguajes, y son compilados en bytecode para la Máquina Virtual de Ethereum (EVM) antes de desplegar sus efectos en la cadena de bloques.

Cada ***smart contract (contract)*** consta de ***estructuras (struct)***, ***funciones (func)*** y ***estados (state)***, y es ejecutado en [cada nodo](http://ethernodes.org/network/1) de Ethereum simultáneamente, los cuales consensuan su resultado de forma distribuida. El [Ethereum Development Tutorial](https://github.com/ethereum/wiki/wiki/Ethereum-Development-Tutorial) hace notar que el coste de hacer uso de un poder de computación de una EVM tan confiable como ésta es tan alto, que, a efectos prácticos, en términos de carga y optimización se afirma que no debería pensar en programarse algo "que no pudieras ejecutar en un teléfono inteligente del año 1999".

### Ether y gas
La unidad empleada en Ethereum es el éter (ether), una unidad de cuenta con [18 decimales](http://ether.fund/tool/converter), que es usada para pagar por la capacidad de procesamiento de la red. Para su desarrollo financiero inicial Ethereum realizó la venta de micromecenazgo (crowdfunding sale) de 60.102.216 éters que estuvo abierta del 7/23/2014 al 9/2/2014, llamada ***[the Genesis Presale](https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf)***, obteniendo 31.591 BTC, que correspondieron a [18.439.086 dólares estadounidenses](http://ether.fund/market) en aquel momento.
http://ether.fund/tool/calculator gas fee y gas price
http://ether.fund/tool/gas-price gas price graph

Cada operación es cargada con una cierta suma de gas, cuyo propósito es limitar la cantidad de trabajo que es necesitada para ejecutar la transacción y pagar por su ejecución. Con ello se procura evitar el spam y mantener la estabilidad de la red. Mientras la EVM ejecuta la transacción, el gas es gradualmente consumido de acuerdo con reglas específicas.

El precio del gas o `gas price` es un valor determinado por el creador de la transacción que es quien paga el mismo por ejecutar dicha llamada a un contrato o realizar una transacción. Si algo de gas sobra tras la ejecución, le es devuelto. Si el gas se termina antes de alcanzarse el requerido, se desencadena una excepción `out of gas`, la cual revierte todas las modificaciones hechas al estado por el actual llamada (`call frame`).
      
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

Es posible almacenar datos en una estructura de datos especialmente indexada que mapee todos ellos hasta bien entrado el nivel del bloque. Esta propiedad de ir recopilando **Registros de llamadas** (`called logs`) es usada por Solidity a fin de implementar un histórico de eventos. Los contratos no pueden acceder llamadas a los logs después de que hayan sido creados, pero pueden eficientemente acceder desde fuera de la blockchain. Mientras que los datos de registro de llamadas esté almacenado en filtros bloom es posible buscar estos datos de una forma eficiente y criptográficamente segura, de tal forma que los pares de la red que no han descargado toda la blockchain ([`light clients`](https://doublethink.co/ethereum-light-client/)) pueden aún así encontrar dichos registros. Los [filtros de Bloom](https://en.wikipedia.org/wiki/Bloom_filter) sirven para preguntar si un elemento está en un conjunto, y la respuesta puede ser "no, el elemento no está en el conjunto", de forma rotunda, siempre fiable, o bien "puede ser que el elemento esté en el conjunto", con un grado de certidumbre aproximado. De esta manera, Ethereum usa filtros bloom para verificar que se ha realizado una operación sin tener que consultar la información en toda la red.


####Llamadas de creación de contratos
Los contratos pueden incluso crear otros contratos usando un operador (`opcode`) especial, y no únicamente llamar a direcciones. La única diferencia entre estas **Llamadas de creación de contratos** (`create calls`) y las Llamadas de mensaje (`mensage call`) corrientes es que el `payload data` es ejecutado y el resultado almacenado como código y el contrato que realiza la llamada de creación recibe la dirección del nuevo contrato en la Pila de llamadas.
.
####Llamadas de autodestrucción 
La única posibilidad en la que un código puede ser retirado de la blockchain es cuando un contrato llama (`selfdestruct call`) a la dirección que realiza la operación de autodestrucción (`SELFDESTRUCT`). Los ethers sobrantes almacenados en la dirección son enviados a una dirección objetivo determinada y entonces el cógigo y el Almacenamiento son retirados. Fíjate que incluso si el código del contrato no contiene el operador SELFDESTRUCT, todavía puede llevar a cabo dicha operación usando `delegatecall` o `callcode`.

###Comunicación entre nodos: Descubrimiento, Transporte Encriptado, Enmarcado y Control del Flujo
Las comunicaciones peer-to-peer entre los nodos usan el (Protocolo Wire)(https://github.com/ethereum/wiki/wiki/%C3%90%CE%9EVp2p-Wire-Protocol) de (Ethereum)(https://github.com/ethereum/wiki/wiki/Ethereum-Wire-Protocol), un set de operadores y mensajes y su traducción correspondiente en hexadecimal, constituyendo 'per se' un sistema de mensajería privada de bajo nivel (*Whisper*). El Protocolo Wire fue basado en el [Protocolo RLP https://github.com/ethereum/wiki/wiki/RLP], siguiendo la [Especificación de Comunicación y Descubrimiento de Nodos RLPx https://github.com/ethereum/devp2p/blob/master/rlpx.md]. Otra opción de modelo para este propósito podría ser *Swarm*.

###Árboles de Patricia Merkle y Clientes ligeros
En Ethereum los datos son almacenados en una estructura de datos denominado (Árbol de Patricia Merkle)(https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-Patricia-Tree), una estructura de árbol donde (cada nodo en el árbol es el hash del siguiente)(https://easythereentropy.wordpress.com/2014/06/04/understanding-the-ethereum-trie/). Cada set de parejas de llaves o valores mapea a un único hash raíz, y sólo un pequeño subset de nodos es necesitado para probar que una combinación de llaves/valores corresponde a un hash raíz particular del árbol. El tamaño de la complejidad de una prueba de Merkle escala linearmente con la altura del árbol; porque cada nodo del árbol tiene un número particular de nodos hijos (en nuestro caso, hasta 17), esto significa que el tamaño de la complejidad de una prueba Merkle es logarítima (es decir, O~log(n)) respecto a la cantidad de datos almacenados. Esto significa que, incluso si el árbol de estados completo tiene unos pocos gigabytes de tamaño, si un nodo recibe el estado raíz desde una fuente de confianza, dicho nodo tiene la habilidad de saber con total certeza la validez de cualquier información con árbol apenas descargando unos pocos kilobytes de datos como prueba (es decir, el hash es capaz de representar exactamente al bloque).

Una prueba SPV (Prueba Simple de Verificación) de un nodo en un árbol de Patricia consiste simplemente en un subset completo de tres nodos que fueron procesados a fin de acceder (o, más específicamente, los nodos árboles que necesitaban ser buscados en una base de datos que tuviera la capacidad de hacer búsquedas inversas de hashes). En una simple implementación de un ábol de Patricia, tomadno el valor asociado con una llave particular, se requiere desceder el ábrol hash, constamente buscando nodos en la base de datos por sus hashes, hasta que finalmente se alcanza el nodo final de la última rama; un simple algoritmo que produjera una prueba SPV lo que haría sería usar este sencillo algoritmo y grabar todas las búsquedas que fuesen hechas en la base de datos. La verificación SPV consistiría entonces en correr este sencillo algoritmo de búsqueda pero apuntando éste a la base de datos provista únicamente por los nodos en la prueba SPV; si hay un error y el nodo se encuentra, entonces la prueba es inválida.

El propósito de un cliente ligero es permitir a los usuarios en entornos de baja capacidad (sistemas embebidos de propiedad inteligente, teléfonos inteligentes y no tan inteligentes, extensiones de exploradores, equipos de escritorio ligeros, etcétera) a mantener una seguridad alta sobre el estado actual de una parte concreta del estado de Ethereum, o verificar la ejecución de una transacción. Aunque la seguridad ocmpleta es sólo posible para un 'full node', el protocolo de nodo ligero permite procesar alrededor de 1KB de datos por cada dos minutos, para recivir datos de la red sobre las partes del estado que les concierne, y estar seguros de que dichos datos son correctos, provistos de forma que la mayoría de los mineros estan siguiendo correctamente el protocolo, y quizás incluso aunque apenas mientras que un sólo 'full node' exista.

En Ethereum, un cliente ligero puede ser entendido como un cliente que descarga por defecto los 'headers' de los bloques, y verifica únicamente una pequeña porción de lo que precisa ser verificado, usando una tabla de hash distribuida en lugar de una base de datos con el árbol de nodos almacenado en su disco duro local.  Para un "cliente parcialmente ligero", que procesa todo, pero se limita a la hora de utilizar el espacio de disco duro y almacena prácticamente nada, sustituyendo una lectura de la base de datos con un 'get request' de una tabla de hashes distribuida (DHT) que resulta suficiente para cumplir los requisitos. De hecho, de acuerdo con la técnica de (Poda de Árboles de Estado)(https://blog.ethereum.org/2015/06/26/state-tree-pruning/) todos los 'full clients', excepto los nodos de archivo (que serían mantenidos por propósitos relacionados con negocios, exploradores de bloques, etcétera) finalmente serían configurados como clientes parcialmente ligeros respecto al registro histórico más antiguo de unos cuantos miles de bloques. Formalmente, podemos decir que esto permitiría mantener la complejidad a razón de O(log(n)), aunque un mecanismo particular funcionaría con apenas O(sqrt(n)).

Otra opción para reducir el tiempo de descarga de la blockchain ha sido la implementación de los opcodes que permiten (Descargas de Bloques en Paralelo)(https://github.com/ethereum/wiki/wiki/Parallel-Block-Downloads).

###Documentación
<ul>
<li><a href="https://www.ethereum.org/pdfs/IntendedUseOfRevenue.pdf">Intended use of revenue</a></li>
<li><a href="https://www.ethereum.org/pdfs/%C4%90%CE%9EVPLAN.pdf">ĐΞV plan</a></li>
<li><a href="https://www.ethereum.org/pdfs/EthereumWhitePaper.pdf">White paper</a></li>
<li><a href="https://www.ethereum.org/pdfs/EthereumYellowPaper.pdf">Yellow paper</a></li>
<li><a href="https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf">Terms and conditions</a></li>
<li><a href="https://www.ethereum.org/pdfs/EtherProductPurchaseAgreement.pdf">Ether Product Purchase Agreement</a></li>

###Antecedentes
Bitcoin, Hashcash, (Criptografía asimétrica)(https://www.comparitech.com/blog/information-security/cryptography-guide/), (zSNARKS)(https://jeremykun.com/2016/07/05/zero-knowledge-proofs-a-primer/), Protocolos de Estado, Tokenización

##Clients
Go https://github.com/ethereum/go-ethereum/wiki/geth

C++ https://github.com/ethereum/cpp-ethereum

Python https://github.com/ConsenSys/pyethereum

Haskell https://github.com/jamshidh/ethereum-client-haskell

Java https://github.com/ethereum/ethereumj

Rust https://github.com/ethcore/parity

JS https://github.com/ethereumjs/node-blockchain-server

###Browsers

Mist https://github.com/ethereum/mist

###Ghost Protocol Uncle Blocks

https://github.com/ethereum/wiki/wiki/White-Paper#modified-ghost-implementation

https://blog.ethereum.org/2014/10/03/slasher-ghost-developments-proof-stake/


### POS
https://blog.ethereum.org/2014/11/25/proof-stake-learned-love-weak-subjectivity/

https://blog.ethereum.org/2014/10/03/slasher-ghost-developments-proof-stake/

###Markets

http://coinmarketcap.com/currencies/ethereum/#markets

https://tradeblock.com/markets/krkn/eth-xbt/1h/

### Pools
https://etherscan.io/stats/miner?range=7&blocktype=blocks
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

MyEtherWallet Javascript Client-Side Key Pair Generator https://www.myetherwallet.com/  (old etheraddress.org) https://github.com/kvhnuke/etherwallet Bulk Raw Txs (also in https://etherscan.io/pushTx)

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

How to deploy a DAO https://github.com/slockit/DAO/wiki/How-To-Deploy-A-DAO-%5Bnon-devs%5D (4 docs about The DAO experience https://blog.slock.it/the-dao-creation-is-now-live-2270fd23affc https://blog.slock.it/announcing-dao-link-the-bridge-between-blockchain-and-brick-and-mortar-companies-9510ba04d236#.9z29ymo8v https://docs.google.com/document/d/10kTyCmGPhvZy94F7VWyS-dQ4lsBacR2dUgGTtV98C40/mobilebasic https://medium.com/@abueesp/explain-me-the-dao-hack-like-im-5-to-whom-may-concern-in-the-ethereum-community-2acf1ee35f7f )

##ERC

https://github.com/ethereum/EIPs/issues/20

https://etherscan.io/token-search

##Identity

https://uport.me/#home

https://github.com/pipermerriam/devcon2-token

https://etherscan.io/verifiedSignatures 


##Games
FirstBlood https://firstblood.io/
Ether Crawler https://github.com/ConsenSys/ether-crawler

Etheria https://github.com/fivedogit/etheria

https://github.com/ConsenSys/dao-wars

##Algos
https://github.com/ethereum/wiki/blob/master/Dagger-Hashimoto.md http://vitalik.ca/ethereum/dagger.html

##Environment

    Ethereum EIP https://github.com/ethereum/EIPs/issues
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
    
    Codex Pax https://medium.com/@PaxDirectory/codex-a-legal-scripting-language-e3723cc76662
    CommonAccord www.commonaccord.org http://hardjono.mit.edu/sites/default/files/documents/CommonAccord_Provenance_11182015.pdf


#Opcodes

##0s: Stop and Arithmetic Operations

0x00 STOP Halts execution.

0x01 ADD Addition operation.

0x02 MUL Multiplication operation.

0x03 SUB Subtraction operation.

0x04 DIV Integer division operation.

0x05 SDIV Signed integer

0x06 MOD Modulo

0x07 SMOD Signed modulo

0x08 ADDMOD Modulo

0x09 MULMOD Modulo

0x0a EXP Exponential operation.

0x0b SIGNEXTEND Extend length of two’s ( complement signed integer.

##10s: Comparison & Bitwise Logic Operations

0x10 LT Lesser-than comparison

0x11 GT Greater-than comparison

0x12 SLT Signed less-than comparison

0x13 SGT Signed greater-than comparison

0x14 EQ Equality comparison

0x15 ISZERO Simple not operator

0x16 AND Bitwise AND operation.

0x17 OR Bitwise OR operation.

0x18 XOR Bitwise XOR operation.

0x19 NOT Bitwise NOT operation.

0x1a BYTE Retrieve single byte from word

##20s: SHA3

0x20 SHA3 Compute Keccak-256 hash.

##30s: Environmental Information

0x30 ADDRESS Get address of currently executing account.

0x31 BALANCE Get balance of the given account.

0x32 ORIGIN Get execution origination address.

0x33 CALLER Get caller address.This is the address of the account that is directly responsible for this execution.

0x34 CALLVALUE Get deposited value by the instruction/transaction responsible for this execution.

0x35 CALLDATALOAD Get input data of current environment.

0x36 CALLDATASIZE Get size of input data in current environment.

0x37 CALLDATACOPY Copy input data in current environment to memory. This pertains to the input data passed with the message call instruction or transaction.


0x38 CODESIZE Get size of code running in current environment.

0x39 CODECOPY Copy code running in current environment to memory.

0x3a GASPRICE Get price of gas in current environment.

0x3b EXTCODESIZE Get size of an account’s code.

0x3c EXTCODECOPY Copy an account’s code to memory.

##40s: Block Information

0x40 BLOCKHASH Get the hash of one of the 256 most recent complete blocks.

0x41 COINBASE Get the block’s beneficiary address.

0x42 TIMESTAMP Get the block’s timestamp.

0x43 NUMBER Get the block’s number.

0x44 DIFFICULTY Get the block’s difficulty.

0x45 GASLIMIT Get the block’s gas limit.

## 50s Stack, Memory, Storage and Flow Operatiions

0x50 POP Remove item from stack.

0x51 MLOAD Load word from memory.

0x52 MSTORE Save word to memory.

0x53 MSTORE8 Save byte to memory.

0x54 SLOAD Load word from storage.

0x55 SSTORE Save word to storage.

0x56 JUMP Alter the program counter.

0x57 JUMPI Conditionally alter the program counter.

0x58 PC Get the value of the program counter prior to the increment

0x59 MSIZE Get the size of active memory in bytes.

0x5a GAS Get the amount of available gas, including the corresponding reduction

0x5b JUMPDEST Mark a valid destination for jumps.

## 60s & 70s: Push Operations

0x60 PUSH1 Place 1 byte item on stack.

0x61 PUSH2 Place 2-byte item on stack.

…

0x7f PUSH32 Place 32-byte (full word) item on stack.

## 80s: Duplication Operations

0x80 DUP1 Duplicate 1st stack item.

0x81 DUP2 Duplicate 2nd stack item.

…

0x8f DUP16 Duplicate 16th stack item.

## 90s: Exchange Operations

0x90 SWAP1 Exchange 1st and 2nd stack items.

0x91 SWAP2 Exchange 1st and 3rd stack items.
… …

0x9f SWAP16 Exchange 1st and 17th stack items.

## a0s: Logging Operations

0xa0 LOG0 Append log record with no topics.

0xa1 LOG1 Append log record with one topic.

… …

0xa4 LOG4 Append log record with four topics.

## f0s: System operations

0xf0 CREATE Create a new account with associated code.

0xf1 CALL Message-call into an account.

0xf2 CALLCODE Message-call into this account with alternative account’s code.

0xf3 RETURN Halt execution returning output data.

0xf4 DELEGATECALL Message-call into this account with an alternative account’s code, but persisting the current values for sender and value.

Halt Execution, Mark for deletion.

0xff SUICIDE Halt execution and register account for later deletion.


#Difficulty adjustment algorithm
PRIOR EIP2 block_diff = parent_diff + parent_diff // 2048 *    (1 if block_timestamp - parent_timestamp < 13 else -1) + int(2**((block.number // 100000) - 2)) (where the + int(2**((block.number // 100000) - 2))
POST EIP 2 block_diff = parent_diff + parent_diff // 2048 * max(1 - (block_timestamp - parent_timestamp) // 10, -99) + int(2**((block.number // 100000) - 2)) 

Donde // es el operador dividor entero, por ejemplo 6 // 2 = 3, 7 // 2 = 3, 8 // 2 = 4. La `minDifficulty` todavia define la la dificultad minima permitida, sin que ningun otro adjuste sea necesario. El anterior algorimo de tiempo de bloque, pretendia una media de 13 segundos. La nueva formula propuesta esta basada tambien en obtener la media, pero de tal forma que queda probado en la formula que resulta matematicamente imposible que el tiempo medio sea mayor de 24 segundos. El uso de  block_timestamp - parent_timestamp) // 10 como la principal variable de entrada, en lugar del tiempo de diferencia, directamente sirve para mantener la naturaleza granular del algoritmo, preveyendo cualquier incentivo excesivo para establecer la diferencia del timestamp a exactamente 1 a fin de crear un bloque que tiene ligeramente mayor dificultad. El -99 simplemente sirve para asegurar que la dicultad no llega extradamente lejossi dos bloques terminan estando muy apartados en el tiempo debido a un bug de seguridad en el cliente o cualquier otra cuestion cisne negra.
