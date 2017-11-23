
¡Bienvenid@ a la **Academia de Smart Contracts de Ethereum** en español! Este espacio tiene el propósito de presentar una guía introductoria, útil y sencilla, para todos aquellos que deseen empezar a comprender esta tecnología. 


<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

**Índice de contenidos**  

  - [¿Qué es Ethereum?](#qué-es-ethereum)
  - [Smart contracts](#smart-contracts)
  - [Ether y gas](#ether-y-gas)
  - [Cuentas](#cuentas)
  - [Almacenamiento, memoria y pila](#almacenamiento-memoria-y-pila)
  - [Set de instrucciones](#set-de-instrucciones)
  - [Llamadas](#llamadas)
    - [Llamadas de mensaje](#llamadas-de-mensaje)
    - [Llamadas delegadas / Librerías y código de llamadas](#llamadas-delegadas--librer%C3%ADas-y-c%C3%B3digo-de-llamadas)
    - [Llamadas de creación de contratos](#llamadas-de-creaci%C3%B3n-de-contratos)
  - [Comunicación entre nodos: Descubrimiento, Transporte Encriptado, Enmarcado y Control del Flujo](#comunicaci%C3%B3n-entre-nodos-descubrimiento-transporte-encriptado-enmarcado-y-control-del-flujo)
  - [Árboles de Patricia Merkle y Clientes ligeros](#Árboles-de-patricia-merkle-y-clientes-ligeros)
  - [Documentación](#documentaci%C3%B3n)
  - [Antecedentes](#antecedentes)
- [Clients](#clients)
  - [Browsers](#browsers)
  - [POS](#pos)
  - [Markets](#markets)
  - [Pools](#pools)
  - [Programando](#programando)
- [Lenguajes](#lenguajes)
  - [Tesnets](#tesnets)
- [Framework](#framework)
- [Scripters and terminals](#scripters-and-terminals)
- [APIs](#apis)
- [Wallet](#wallet)
- [JS](#js)
- [ERC](#erc)
- [Games](#games)
- [Environment](#environment)
- [0s: Stop and Arithmetic Operations](#0s-stop-and-arithmetic-operations)
- [10s: Comparison & Bitwise Logic Operations](#10s-comparison--bitwise-logic-operations)
- [20s: SHA3](#20s-sha3)
- [30s: Environmental Information](#30s-environmental-information)
- [40s: Block Information](#40s-block-information)
- [50s Stack, Memory, Storage and Flow Operations](#50s-stack-memory-storage-and-flow-operations)
- [60s & 70s: Push Operations](#60s--70s-push-operations)
- [80s: Duplication Operations](#80s-duplication-operations)
- [90s: Exchange Operations](#90s-exchange-operations)
- [a0s: Logging Operations](#a0s-logging-operations)
- [f0s: System operations](#f0s-system-operations)
- [Full Instruction Set](#Full Instruction Set)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### ¿Qué es Ethereum?

Podemos definir Ethereum de una forma aséptica y algo simplista como un *software bajo licencia libre que permite una interconexión P2P [distribuida](http://www.nils-diewald.de/images/dsn/thumb/dsn-cent-decent-distr-federated.png) de tal forma que una red de nodos que comparten una base de datos y un protocolo de estado, que pueden contener tanto objetos o variables como piezas enteras de código ("contratos")* a modo de arquitectura de Von Neumann. [https://github.com/ethereum/go-ethereum/wiki/Ethereum-Specification Éstas] son sus especificaciones actualmente.

Ethereum fue ideadada por Vitalik Buterin a finales de 2013 en [Ethereum: A Next-Generation Cryptocurrency and Decentralized Application Platform](https://bitcoinmagazine.com/articles/ethereum-next-generation-cryptocurrency-decentralized-application-platform-1390528211), formalmente descrita por Gavin Wood a principios de 2014 en su [Yellow Paper](http://gavwood.com/Paper.pdf), y finalmente lanzada el 30 de julio de 2015.

Según Taylor Gerring el propósito del Proyecto Ethereum es construir una mejor World Wide Web, entre otras características, más privada y descentralizada. Para ello, entre otras herramientas y aplicaciones, cuenta con un sistema de publicación de contenido estático (*IPFS*), un sistema de mensajería privada de bajo nivel (*Whisper*), un sistema de transacciones que no precisa necesariamente de terceros de confianza (*Ethereum blockchain and EVM system*) y una interfaz de usuario integrada (*Mist*).

### Smart contracts

Smart contracts son piezas de código que se valen de un elemento de estado y de una red distribuida a fin de facilitar protocolos de estado y programas destinados a **facilitar la ejecución automatizada de un contrato de forma distribuida**. Su principal desarrollo conceptual fue llevado a cabo por Nick Szasbo durante la década de 1990. En 1996 escribe Smart Contracts: Building Blocks for Digital Markets y en 1997 Formalizing and Securing Relationships on Public Networks. En Ethereum estos contratos pueden ser implementados en varios lenguajes, y posteriormente son compilados en un set de instrucciones escritos en bytecode, que serán ejecutado en stack en la Máquina Virtual de Ethereum (EVM -no confundir con EMV-); y en el caso de dicho set sea válido, desplegará sus efectos en la cadena de bloques.

Cada ***smart contract (contract)*** consta de ***estructuras (struct)***, ***funciones (func)*** y ***estados (state)***, y es ejecutado en [cada nodo](http://ethernodes.org/network/1) de Ethereum simultáneamente, los cuales consensuan su resultado de forma distribuida. El [Ethereum Development Tutorial](https://github.com/ethereum/wiki/wiki/Ethereum-Development-Tutorial) hace notar que el coste de hacer uso de un poder de computación de una EVM tan confiable como ésta es tan alto, que, a efectos prácticos, en términos de carga y optimización se afirma que no debería pensar en programarse algo "que no pudieras ejecutar en un teléfono inteligente del año 1999".

### Ether y gas
La unidad empleada en Ethereum es el éter (ether), una unidad de cuenta con [18 decimales](http://ether.fund/tool/converter), que es usada para pagar por la capacidad de procesamiento de la red. Para su desarrollo financiero inicial Ethereum realizó la venta de micromecenazgo (crowdfunding sale) de 60.102.216 éters que estuvo abierta del 7/23/2014 al 9/2/2014, llamada ***[the Genesis Presale](https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf)***, obteniendo 31.591 BTC, que correspondieron a [18.439.086 dólares estadounidenses](http://ether.fund/market) en aquel momento.

* [Calculadora de gas fee al precio actual](http://ether.fund/tool/calculator)
* [Gráfica de variaciones del precio del gas](http://ether.fund/tool/gas-price)
* [Guía sobre gas y fees](https://media.consensys.net/2016/06/23/ethereum-gas-fuel-and-fees/)
Cada operación es cargada con una cierta suma de gas, cuyo propósito es limitar la cantidad de trabajo que es necesitada para ejecutar la transacción y pagar por su ejecución. Con ello se procura evitar el spam y mantener la estabilidad de la red. Mientras la EVM ejecuta la transacción, el gas es gradualmente consumido de acuerdo con reglas específicas.

El precio del gas o `gas price` es un valor determinado por el creador de la transacción que es quien paga el mismo por ejecutar dicha llamada a un contrato o realizar una transacción. Si algo de gas sobra tras la ejecución, le es devuelto. Si el gas se termina antes de alcanzarse el requerido, se desencadena una excepción `out of gas`, la cual revierte todas las modificaciones hechas al estado por el actual llamada (`call frame`). 
      
### Cuentas
Hay **dos tipos de cuentas** en Ethereum que comparten el mismo espacio de direcciones: **Cuentas de Usuario** que son controladas por _pares de llaves pública y privada_ custodiadas directa o indirectamente por uno o varios sujetos, y **Cuentas de Contratos** que son controladas por el propio _código almacenado_ junto con la cuenta. A octubre de 2016 las cuentas de contratos representan un 10% de las cuentas totales.

Las **Cuentas de Usuario** están determinadas por las llaves públicas y éstas por las llaves privadas. Primero generas la **Llave Privada** de 64hex: Un número entero positivo aleatoriamente seleccionado (representado por una tabla de bytes con una longitud de 32 en formato big-endian) en el rango [1, secp256k1n − 1]. Entonces creas la **Llave Pública** de 64 bytes desde la llave privada usando el _Algoritmo de Curva Elíptica de Firma Digital (ECDSA)_. La llave privada es creada aleatoriamente, pero la llave pública y el hash que se utiliza como dirección no es aleatorio. Las **Direcciones** de Ethereum son hashes de la llave pública. Para generar uno tienes que generar la llave privada primero. Entonces creas la dirección usando la llave pública de 64 bytes. Calcula el hash _Keccak-256_ de la llave pública. Deberías ahora tener una cadena de 32 bytes (nota: SHA3-256 se terminó convirtiendo en standard tras ser apoyada por el _NIST_ pero Ethereum usa Keccack). Toma los últimos 20 bytes de esta llave pública  (Keccak-256). O, en otras palabras, elimina los primeros 12 bytes. Estos 20 bytes son la dirección, 40 carácteres. Cuando se le añade el prefijo 0x pasa a tener los 42 carácteres de largo.

Convierte llaves públicas en direcciones [modificar main.c y genKATShortMsg.cpp de KeccakTools con los cambios mencionados dará la posibilidad de calcular las direcciones](https://github.com/gvanas/KeccakTools)
###Versiones
[Ethereum Launch Process Milestone](https://blog.ethereum.org/2015/03/03/ethereum-launch-process/):

0. Frontier: La primera versión, el "salvaje Oeste".

1. Homestead: Una red más estable.

2. Metropolis: Un ecosistema diverso de software sencillo de usar, incluyendo Mist -el explorador de Dapps- y herramientas como el Mix -IDE-. A partir de este punto ya no se considera beta.

3. Serenity: La transación al nuevo protocolo y actualizaciones de escalabilidad para ser implantable a nivel industrial.

### Almacenamiento, memoria y pila

Cada cuenta tiene una primera área de memoria persistente la cual es llamada **Almacenamiento** (`storage`). El Almacenamiento es un valor-llave almacenado que mapea Palabras (`words`) de 256 bits/32bytes. No es posible enumerar el Almacenamiento desde dentro del contrato y es comparativamente costoso de leer y, incluso más, modificar lo almacenado. Un contrato no puede ni leer ni escribir ningún almacenamiento aparte del suyo.

La segunda área de memoria es llamada **Memoria** (`memory`), de la cual un contrato obtiene un ejemplo nuevo en blanco para cada llamada de mensaje (`message call`). La Memoria puede ser direccionada at byte level, pero ha de ser leída y escrita en Trozos (`chunks`) de 32 bytes (256 bits). La Memoria es más costosa cuanto más crece, escalando cuadráticamente. 

La EVM no es una máquina de registro de entradas de bases de datos, sino una [Pila de llamadas](https://es.wikipedia.org/wiki/Pila_de_llamadas) [LIFO](https://es.wikipedia.org/wiki/LIFO) (`stack` o `call stack`), de tal forma que todas las operaciones computacionales se llevan a cabo en su área. Ésta tiene un tamaño máximo de 1024 elementos conteniendo Palabras de 256 bits. La estructura de la **Pila**, de arriba a abajo, es la siguiente: Es posible copiar uno de los primeros 16 elementos a la parte superior de la pila, es decir, intercambiar el elemento superior con cualquiera de los 16 elementos por debajo del mismo. Todas las operaciones toman dos elementos, uno a uno o los dos a la vez dependiendo de la operación, y ponen los resultados en la parte superior de la pila. Es posible mover elementos de la pila para almacenarnos en la memoria, pero no es posible acceder a elementos arbitrarios que se encuentren más abajo de la pila sin primero remover los que se encuentran primero. 

### Set de instrucciones

El Set de Instrucciones de la EVM es guardado en su mínima expresión para evitar incorrectas implementaciones las cuales podrían causar problemas. Todas las instrucciones operan en el más básico tipo de dato, Palabras de 256 bits. La aritmética habitual presenta operaciones compartivas con lógica binaria. Así, saltos condicionales o incondicionales son posibles. Además, los contratos pueden acceder propiedades relevates del bloque actual, como son su número y timestamp.

### Llamadas

#### Llamadas de mensaje
Los contratos pueden llamar otras Cuentas de Contratos o enviar ethers a Cuentas de Usuario. Los Contratos pueden llamar otros contratos o enviar ethers a Cuentas de usuario mediante **Llamadas de mensaje** (`mesaje calls`). Las Llamadas de mensaje son similares a las transaciciones, en las que **tienen una dirección fuente, una dirección objetivo, un payload de datos, ethers, gas y `return data`**. De hecho, cada transacción consiste en una Llamada de mensaje de nivel superior la cual a su vez puede crear otras llamadas de mensaje.

Un contrato que realize una llamada (`caller`) puede decidir cuánto de su gas remanente debería ser enviado con la Llamada de mensaje interna y cuánto querría retener. Si una `out-of-gas exception` o cualquier otra excepción ocurre en la llamada interna, esto será señalado por un valor erróneo puesto en la pila. En Solidity, la llamada del contrato causa una excepción manual por defecto en tales situaciones, de tal forma que las excepciones son anuladas haciendo rebosar la Pila de llamadas. Es decir, en este caso, sólo el gas enviado junto con la llamada es utilizado y la operación realizada se considera nula revirtiéndose sus efectos.

Será de la Memoria de donde el contrato obtendrá un ejemplo nuevo en blanco para cada llamada de mensaje (`message call`) y obtiene acceso a la Llamada payload -la cual será provista en una área separada llamada `calldata`. Después de haber finalizado su ejecución, puede retornar datos lo cuales serán almacenados en la Memoria de llamada previamente determinada por el contrato que realiza la llamada. Las llamadas son limitadas a la profundidad de 1024, lo cual significa que durante operaciones más complejas, los `loops` deberían ser preferidos sobre las llamadas recursivas (`recursive calls`) -optimización-.

#### Llamadas delegadas / Librerías y código de llamadas

Ahí existe una especial variante de la llamada de mensaje, denominada **Llamadas delegadas** (`delegatecall`) que es idéntica a las llamadas de mensaje excepto por el hecho de que el código es ejecutado en el contexto del contrato llamador (su dirección objetivo siempre le pertenece) por lo que el msg.sender y el msg.value no cambian sus valores. Esto significa que el contrato puede dinamicamente cargar código de diferentes direcciones sobre la marcha. Almacenamiento, la dirección actual y el balance todavía se refieren al contrato que llama, sólo **tienen `payload de datos` y el `return data`**. Esto hace posible implementar la propiedad "librería" en Solidity: Librerías de código reutilizable que puede se raplicado a un contrato almacenado a fin de, por ejemplo, implementar estructuras más complejas. 

#### Llamadas al registro de llamadas

Es posible almacenar datos en una estructura de datos especialmente indexada que mapee todos ellos hasta bien entrado el nivel del bloque. Esta propiedad de ir recopilando **Registros de llamadas** (`called logs`) es usada por Solidity a fin de implementar un histórico de eventos. Los contratos no pueden acceder llamadas a los logs después de que hayan sido creados, pero pueden eficientemente acceder desde fuera de la blockchain. Mientras que los datos de registro de llamadas esté almacenado en filtros bloom es posible buscar estos datos de una forma eficiente y criptográficamente segura, de tal forma que los pares de la red que no han descargado toda la blockchain ([`light clients`](https://doublethink.co/ethereum-light-client/)) pueden aún así encontrar dichos registros. Los [filtros de Bloom](https://en.wikipedia.org/wiki/Bloom_filter) sirven para preguntar si un elemento está en un conjunto, y la respuesta puede ser "no, el elemento no está en el conjunto", de forma rotunda, siempre fiable, o bien "puede ser que el elemento esté en el conjunto", con un grado de certidumbre aproximado. De esta manera, Ethereum usa filtros bloom para verificar que se ha realizado una operación sin tener que consultar la información en toda la red.


#### Llamadas de creación de contratos
Los contratos pueden incluso crear otros contratos usando un operador (`opcode`) especial, y no únicamente llamar a direcciones. La única diferencia entre estas **Llamadas de creación de contratos** (`create calls`) y las Llamadas de mensaje (`mensage call`) corrientes es que el `payload data` es ejecutado y el resultado almacenado como código y el contrato que realiza la llamada de creación recibe la dirección del nuevo contrato en la Pila de llamadas.
.
####Llamadas de autodestrucción 
La única posibilidad en la que un código puede ser retirado de la blockchain es cuando un contrato llama (`selfdestruct call`) a la dirección que realiza la operación de autodestrucción (`SELFDESTRUCT`). Los ethers sobrantes almacenados en la dirección son enviados a una dirección objetivo determinada y entonces el cógigo y el Almacenamiento son retirados. Fíjate que incluso si el código del contrato no contiene el operador SELFDESTRUCT, todavía puede llevar a cabo dicha operación usando `delegatecall` o `callcode`.

### Comunicación entre nodos: Descubrimiento, Transporte Encriptado, Enmarcado y Control del Flujo
Las comunicaciones peer-to-peer entre los nodos usan el [Protocolo Wire](https://github.com/ethereum/wiki/wiki/%C3%90%CE%9EVp2p-Wire-Protocol) de [Ethereum](https://github.com/ethereum/wiki/wiki/Ethereum-Wire-Protocol), un set de operadores y mensajes y su traducción correspondiente en hexadecimal, constituyendo 'per se' un sistema de mensajería privada de bajo nivel (*Whisper*). El Protocolo Wire fue basado en el [Protocolo RLP https://github.com/ethereum/wiki/wiki/RLP], siguiendo la [Especificación de Comunicación y Descubrimiento de Nodos RLPx https://github.com/ethereum/devp2p/blob/master/rlpx.md]. Otra opción de modelo para este propósito podría ser *Swarm*.

### Árboles de Patricia Merkle y Clientes ligeros
En Ethereum los datos son almacenados en una estructura de datos denominado [Árbol de Patricia Merkle](https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-Patricia-Tree), una estructura de árbol donde [cada nodo en el árbol es el hash del siguiente](https://easythereentropy.wordpress.com/2014/06/04/understanding-the-ethereum-trie/). Cada set de parejas de llaves o valores mapea a un único hash raíz, y sólo un pequeño subset de nodos es necesitado para probar que una combinación de llaves/valores corresponde a un hash raíz particular del árbol. El tamaño de la complejidad de una prueba de Merkle escala linearmente con la altura del árbol; porque cada nodo del árbol tiene un número particular de nodos hijos (en nuestro caso, hasta 17), esto significa que el tamaño de la complejidad de una prueba Merkle es logarítima (es decir, O~log(n)) respecto a la cantidad de datos almacenados. Esto significa que, incluso si el árbol de estados completo tiene unos pocos gigabytes de tamaño, si un nodo recibe el estado raíz desde una fuente de confianza, dicho nodo tiene la habilidad de saber con total certeza la validez de cualquier información con árbol apenas descargando unos pocos kilobytes de datos como prueba (es decir, el hash es capaz de representar exactamente al bloque).

Una prueba SPV (Prueba Simple de Verificación) de un nodo en un árbol de Patricia consiste simplemente en un subset completo de tres nodos que fueron procesados a fin de acceder (o, más específicamente, los nodos árboles que necesitaban ser buscados en una base de datos que tuviera la capacidad de hacer búsquedas inversas de hashes). En una simple implementación de un ábol de Patricia, tomadno el valor asociado con una llave particular, se requiere desceder el ábrol hash, constamente buscando nodos en la base de datos por sus hashes, hasta que finalmente se alcanza el nodo final de la última rama; un simple algoritmo que produjera una prueba SPV lo que haría sería usar este sencillo algoritmo y grabar todas las búsquedas que fuesen hechas en la base de datos. La verificación SPV consistiría entonces en correr este sencillo algoritmo de búsqueda pero apuntando éste a la base de datos provista únicamente por los nodos en la prueba SPV; si hay un error y el nodo se encuentra, entonces la prueba es inválida.

El propósito de un cliente ligero es permitir a los usuarios en entornos de baja capacidad (sistemas embebidos de propiedad inteligente, teléfonos inteligentes y no tan inteligentes, extensiones de exploradores, equipos de escritorio ligeros, etcétera) a mantener una seguridad alta sobre el estado actual de una parte concreta del estado de Ethereum, o verificar la ejecución de una transacción. Aunque la seguridad ocmpleta es sólo posible para un 'full node', el protocolo de nodo ligero permite procesar alrededor de 1KB de datos por cada dos minutos, para recivir datos de la red sobre las partes del estado que les concierne, y estar seguros de que dichos datos son correctos, provistos de forma que la mayoría de los mineros estan siguiendo correctamente el protocolo, y quizás incluso aunque apenas mientras que un sólo 'full node' exista.

En Ethereum, un cliente ligero puede ser entendido como un cliente que descarga por defecto los 'headers' de los bloques, y verifica únicamente una pequeña porción de lo que precisa ser verificado, usando una tabla de hash distribuida en lugar de una base de datos con el árbol de nodos almacenado en su disco duro local.  Para un "cliente parcialmente ligero", que procesa todo, pero se limita a la hora de utilizar el espacio de disco duro y almacena prácticamente nada, sustituyendo una lectura de la base de datos con un 'get request' de una tabla de hashes distribuida (DHT) que resulta suficiente para cumplir los requisitos. De hecho, de acuerdo con la técnica de [Poda de Árboles de Estado](https://blog.ethereum.org/2015/06/26/state-tree-pruning/) todos los 'full clients', excepto los nodos de archivo (que serían mantenidos por propósitos relacionados con negocios, exploradores de bloques, etcétera) finalmente serían configurados como clientes parcialmente ligeros respecto al registro histórico más antiguo de unos cuantos miles de bloques. Formalmente, podemos decir que esto permitiría mantener la complejidad a razón de O(log(n)), aunque un mecanismo particular funcionaría con apenas O(sqrt(n)).

Otra opción para reducir el tiempo de descarga de la blockchain ha sido la implementación de los opcodes que permiten [Descargas de Bloques en Paralelo](https://github.com/ethereum/wiki/wiki/Parallel-Block-Downloads).

### Documentación
<ul>
<li><a href="https://www.ethereum.org/pdfs/IntendedUseOfRevenue.pdf">Intended use of revenue</a></li>
<li><a href="https://www.ethereum.org/pdfs/%C4%90%CE%9EVPLAN.pdf">ĐΞV plan</a></li>
<li><a href="https://www.ethereum.org/pdfs/EthereumWhitePaper.pdf">White paper</a></li>
<li><a href="https://www.ethereum.org/pdfs/EthereumYellowPaper.pdf">Yellow paper</a></li>
<li><a href="https://github.com/ethereum/wiki/wiki/FAQ">FAQ</a></li>
<li><a href="https://www.ethereum.org/pdfs/TermsAndConditionsOfTheEthereumGenesisSale.pdf">Terms and conditions</a></li>
<li><a href="https://www.ethereum.org/pdfs/EtherProductPurchaseAgreement.pdf">Ether Product Purchase Agreement</a></li>

### Antecedentes
Bitcoin, Hashcash, (Criptografía asimétrica)(https://www.comparitech.com/blog/information-security/cryptography-guide/), (zSNARKS)(https://jeremykun.com/2016/07/05/zero-knowledge-proofs-a-primer/), Protocolos de Estado, Tokenización

## Clients
Go https://github.com/ethereum/go-ethereum/wiki/geth

C++ https://github.com/ethereum/cpp-ethereum

Python https://github.com/ConsenSys/pyethereum

Haskell https://github.com/jamshidh/ethereum-client-haskell

Java https://github.com/ethereum/ethereumj

Rust https://github.com/ethcore/parity

JS https://github.com/ethereumjs/node-blockchain-server

### Browsers

Mist https://github.com/ethereum/mist

###Ghost Protocol Uncle Blocks

https://github.com/ethereum/wiki/wiki/White-Paper#modified-ghost-implementation

https://blog.ethereum.org/2014/10/03/slasher-ghost-developments-proof-stake/


### POS
https://blog.ethereum.org/2014/11/25/proof-stake-learned-love-weak-subjectivity/

https://blog.ethereum.org/2014/10/03/slasher-ghost-developments-proof-stake/

### Markets

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

### Programando

## Lenguajes
Solidity (based on js/c++) http://ethereum.github.io/solidity/

Serpent (based on Python) https://github.com/ethereum/wiki/wiki/Serpent

LLL (based on Lisp)

Mutan (based on Go) https://github.com/ethereum/go-ethereum/wiki/Mutan

### Tesnets
Morden https://github.com/ethereum/wiki/wiki/Morden

## Framework
Framework Truffle https://github.com/ConsenSys/truffle https://www.youtube.com/watch?v=Evpdt6wFphU

Framework Embark https://github.com/iurimatias/embark-framework https://www.youtube.com/watch?v=DKB_rCVVpWA https://github.com/iurimatias/embark-framework/wiki/Install-on-Linux

Framework Populus https://github.com/pipermerriam/populus

Framework Meteor Dapp Boilerplate https://github.com/SilentCicero/meteor-dapp-boilerplate

Framework Dapple https://github.com/nexusdev/dapple

## Scripters and terminals
Etherscripter Solidity http://chriseth.github.io/browser-solidity/

Etherscripter Block Serpent LLL XML http://etherscripter.com/0-5-1/ 

Etherscripter Solidity Serpent LLL Mutan http://ether.fund/tool/contract

Etherscripter Serpent http://ether.fund/contract/74e25/etherface

Terminal http://ether.fund/tool/terminal

Ethereum TestRPC https://github.com/ConsenSys/eth-testrpc

Ethereum Tester on Dedicated Network https://github.com/ethereum/system-testing

## APIs
Web3 JS Dapp API https://github.com/ethereum/wiki/wiki/JavaScript-API 

Etherscan http://etherscan.io/apis

Ether.fund http://api.ether.fund/

Monitoring Ethereum Transactions in RT https://github.com/ConsenSys/reflux-tx

Ethereum Alarm Governance https://github.com/pipermerriam/ethereum-alarm-governance

ethjsonrpc https://github.com/ConsenSys/ethjsonrpc

## Wallet

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

## JS
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

### Otras herramientas
Package Solidity and Serpent for Atom https://atom.io/packages/language-ethereum

Solidity Contract Viewer https://github.com/ConsenSys/contract-viewer

Ethereum Wiki Information Source https://github.com/ethereum/wiki

Ethereum Wiki Dev Best Practices https://github.com/ConsenSys/Ethereum-Development-Best-Practices/wiki

Solidity lingint https://github.com/protofire/solhint

Current EIPs https://github.com/ethereum/EIPs More info about EIPs [1](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-1.mediawiki) [4](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-4.mediawiki])

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

## ERC

https://github.com/ethereum/EIPs/issues/20

https://etherscan.io/token-search

## Identidad

https://uport.me/#home

https://github.com/pipermerriam/devcon2-token

https://etherscan.io/verifiedSignatures 


## Juegos
FirstBlood https://firstblood.io/
Ether Crawler https://github.com/ConsenSys/ether-crawler
Etheria https://github.com/fivedogit/etheria
https://github.com/ConsenSys/dao-wars

##Algos
https://github.com/ethereum/wiki/blob/master/Dagger-Hashimoto.md http://vitalik.ca/ethereum/dagger.html

### Consenso y metaconsenso
Consensus http://www.csd.uoc.gr/~hy586/material/lectures/cs586-Section6.pdf
The Quest for Scalable Blockchain Fabric: Proof-of-Work vs. BFT Replication http://vukolic.com/iNetSec_2015.pdf
Impossibility of Distributed Consensus with One Faulty Process https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf
Practical Byzantine Fault Tolerance http://pmg.csail.mit.edu/papers/osdi99.pdf
Consensus in the Presence of Partial Synchrony https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf 
Ethereum Sharding https://github.com/ethereum/EIPs/issues/53
Cosmos: https://github.com/cosmos/cosmos/blob/master/WHITEPAPER.md
Sidechains: https://blockstream.com/sidechains.pdf
Interledger: https://interledger.org/rfcs/0001-interledger-architecture/
Lightning Network: https://lightning.network/lightning-network-paper-DRAFT-0.5.pdf
Segregated Witness: https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki
ZeroCash: http://zerocash-project.org/paper
Bitcoin: https://bitcoin.org/bitcoin.pdf
TheDAO: https://download.slock.it/public/DAO/WhitePaper.pdf


## Environment
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
[Lista actualizada](https://docs.google.com/spreadsheets/d/15wghZr-Z6sRSMdmRmhls9dVXTOpxKy8Y64oy9MvDZEQ/edit#gid=0). La lista v.1.0 original puede consultarse [aqui](https://docs.google.com/spreadsheets/d/1m89CVujrQe5LAFJ8-YAUCcNK950dUzMQPMJBxRtGCqs/edit#gid=0).

## 0s: Stop and Arithmetic Operations

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

## 10s: Comparison & Bitwise Logic Operations

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

## 20s: SHA3

0x20 SHA3 Compute Keccak-256 hash.

## 30s: Environmental Information

0x30 ADDRESS Get address of currently executing account.

0x31 BALANCE Get balance of the given account.

0x32 ORIGIN Get execution origination address.

0x33 CALLER Get caller address.This is the address of the account that is directly responsible for this execution. The caller (1) does not need to know the size of the output in advance (ver MSIZE) and (2) can determine the size of the output after the call. A caller can choose to provide a gigantic area of memory at the end of their memory area. The callee can "write" to it by returning and the caller is only charged for the memory area that is actually written. 

0x34 CALLVALUE Get deposited value by the instruction/transaction responsible for this execution.

0x35 CALLDATALOAD Get input data of current environment.

0x36 CALLDATASIZE Get size of input data in current environment.

0x37 CALLDATACOPY Copy input data in current environment to memory. This pertains to the input data passed with the message call instruction or transaction.

??? CALLDEPTH Fue un opcode [no implementado](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-3.mediawiki). Deberíaa retornar la profundidad restante de la pila de llamadas. Un valor de 0 significa que el la pila de llamadas esta llena, y no pueden realizarse mas llamadas. Esto evita que la [pila de llamadas](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-3.mediawiki) pueda ser llamada cuando no hay espacio suficiente. Hay un límite especificando la profundidad que puede alcanzarse cuando unos contratos llaman a otros contratos. El límite es actualmente `256`. Si un contrato invoca otro contrato (ya sea a traves de `CALL` o `CALLCODE`), la operación fracasará si la profundidad de la pila de llamadas ha sido alcanzada. Éste comportamiento hace posible al sujeto del contrato realizar un ataque de pila de llamadas o "call stack attack". En este ataque, el atacante primero crea una determinada profundidad de pila, por ejemplo, mediante llamadas recursivas. Después de esto, el atacante invoca el contrato objetivo del ataque. Si este llama otro contrato hijo, esta llamada fallará. Si el valor no es comprobado adecuadamente para ver si la llamada fue exitosa, las consecuencias podrían ser desastrosas. [Call stack attack checker](https://github.com/pipermerriam/ethereum-stack-depth-lib) 

0x38 CODESIZE Get size of code running in current environment.

0x39 CODECOPY Copy code running in current environment to memory.

0x3a GASPRICE Get price of gas in current environment.

0x3b EXTCODESIZE Get size of an account’s code.

0x3c EXTCODECOPY Copy an account’s code to memory.

## 40s: Block Information

0x40 BLOCKHASH Get the hash of one of the 256 most recent complete blocks.

0x41 COINBASE Get the block’s beneficiary address.

0x42 TIMESTAMP Get the block’s timestamp.

0x43 NUMBER Get the block’s number.

0x44 DIFFICULTY Get the block’s difficulty.

0x45 GASLIMIT Get the block’s gas limit.

## 50s Stack, Memory, Storage and Flow Operations

0x50 POP Remove item from stack.

0x51 MLOAD Load word from memory.

0x52 MSTORE Save word to memory.

0x53 MSTORE8 Save byte to memory.

0x54 SLOAD Load word from storage.

0x55 SSTORE Save word to storage.

0x56 JUMP Alter the program counter.

0x57 JUMPI Conditionally alter the program counter.

0x58 PC Get the value of the program counter prior to the increment

0x59 MSIZE Obtiene el tamano de la memoria activa en bytes. Vease CALL, CALLCODE and DELEGATECALL al final, asi como CALLER. Asi, es incluso posible determinar el tamano de los datos devueltos: Si el CALLER usa output_start = MSIZE y output_size = 2**256-1, esa sera el area de la memoria que es escrita finalmente para esto  (output_start, MSIZE) (como vemos, MSIZE es evaluada despues de CALLER). Esto hace posible devolver datos de tamano dinamico, tales como tablas, de manera muy flexible. En un estado anterior, fue propuesto tambien anadir el tamano del tamano devuelto a la stack, pero el mecanismo MSIZE descrito deberia ser suficiente y es mucho mejor compatible hacia atras. El opcode MSIZE opcode tipicamente es usado para localizar la memoria previamente no utilizada. El cambio en la semantica afecta al contrato de dos formas:

Sobreescribe la memoria asignada. Usando CALLER, un contrato deberia pretender asignar cierto fragmento de la memoria, incluso si no esta escrito por el contrato que fue llamado. Usos subsecuentes de MSIZE para utilizar la memoria deberia cubrir con este fragmento que ahora es mas pequeno que antes del cambio, aunque es improbable que tal contrato exista. 

EL cambio de las direcciones de memoria. En general, si la memoria es asignada usando el opcode MSIZE, las direciones de objetos en memoria seran diferentes despues del cambio. El contrato deberia ser escrito completamente de esa manera, tal que los objetos en memoria sean reasignables, y asi, por ejemplo, su posicion absoluta en memoria y su posicion relativa a otros objetos no importe. Esto, claramente, no es el caso de las tablas, sino que estas son asignadas en una sola asignacion y no con el intermediario CALL.
    
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

0xf4 DELEGATECALL Llamada-mensaje en esta cuenta con un codigo de cuenta alternativo, pero persistiendo los mismos valores de emisor de la transaccion y valor de la misma. Es similar a la idea de CALLCODE, excepto que se propagan el emisor de la transaccion ('CALLER'/'SENDER') y el valor ('VALUE) de la llamada padre a la hija, por ejemplo, porque la llamada creada tenga el mismo transmitente y valor que la llamada original. Propragando el emisor de la transaccion y el valor del codigo padre al hijo hace mucho mas facil para un contrato almacenar otra direccion como fuente mutable y "pasarle" llamadas, asi como el codigo hijo se ejecutaria esencialmente en el mismo en marco de variables que el codigo padre (excepto por el gas reducido y la aumentada profundidad de la pila de llamadas o 'callstack'). Vea los siguientes [dos casos](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-7.md). El limite de profundidad de llamada de 1024 es preservado. Asimismo, CALLER y VALUE se comportan exactamente igual en el entorno del llamado como en el entorno del llamador. Es posible replicar esta funcionalidad pegando apenas el SENDER en los primeros 20 bytes de los datos de la llamada. Sin embargo, esto significaria que el codigo necesitaria ser especialmente compilado para contratos delegados, y no seria usable en contextos delegados y no delegados al mismo tiempo. De esta forma, DELEGATECALL 0xf4 toma 6 operandos: 

gas: la suma de gas que el codigo deberia usar a fin de ejecutarse (la suma que el llamado recibe). Como CALCODE, la creacion de cuenta nunca sucede, de tal forma que el coste en gas es siempre schedule.callGas + gas. El gas no utilizado se devuelve, como de costumbre.

to: la direccion destino cuyo codigo sera ejecutado;

in_offset: el offset en la memoria del input;

in_size: el tamano del input en bytes;

out_offset: el offset en la memoria del output;

out_size: el tamaño del scratch pad del output;

0xff SUICIDE. Halt execution and register account for later deletion. SELFDESTRUCT was proposed as an alias of SUICIDE opcode (rather than replacing it) on the [EIP 6](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-6.md).

The gas and memory semantics for CALL and CALLCODE and DELEGATE_CALL [are still in process of being changed](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-5.md) in the following way (CREATE does not write to memory and is thus unaffected). Suppose the arguments to CALL / CALLCODE are gas, address, value, input_start, input_size, output_start, output_size), then, at the beginning of the opcode, gas for growing memory is only charged for input_start + input_size, but not for output_start + output_size. If the called contract returns data of size n, the memory of the calling contract is grown to output_start + min(output_size, n) (and the calling contract is charged gas for that) and the output is written to the area [output_start, output_start + min(n, output_size)). The calling contract can run out of gas both at the beginning of the opcode and at the end of the opcode. After the call, the MSIZE opcode should return the size the memory was actually grown to.

# Algoritmo de ajuste de la dificultad
**PRIOR EIP2** block_diff = parent_diff + parent_diff // 2048 *    (1 if block_timestamp - parent_timestamp < 13 else -1) + int(2 ** ((block.number // 100000) - 2)) (where the + int(2 ** ((block.number // 100000) - 2))

**POST EIP 2** block_diff = parent_diff + parent_diff // 2048 * max(1 - (block_timestamp - parent_timestamp) // 10, -99) + int(2 ** ((block.number // 100000) - 2)) 

Donde *//* es el operador divisor entero, por ejemplo *6 // 2 = 3, 7 // 2 = 3, 8 // 2 = 4*. La `minDifficulty` todavia define la la dificultad minima permitida, sin que ningun otro adjuste sea necesario. El anterior algorimo de tiempo de bloque, pretendia una media de 13 segundos. La nueva formula propuesta esta basada tambien en obtener la media, pero de tal forma que queda probado en la formula que resulta matematicamente imposible que el tiempo medio sea mayor de 24 segundos. El uso de  block_timestamp - parent_timestamp) `// 10` como la principal variable de entrada, en lugar del tiempo de diferencia, directamente sirve para mantener la naturaleza granular del algoritmo, preveyendo cualquier incentivo excesivo para establecer la diferencia del timestamp a exactamente `1` a fin de crear un bloque que tiene ligeramente mayor dificultad. El `-99` simplemente sirve para asegurar que la dicultad no llega extradamente lejossi dos bloques terminan estando muy apartados en el tiempo debido a un bug de seguridad en el cliente o cualquier otra cuestion cisne negra. Esta modificación es se introdujo a partir del bloque 1.150.000 on livenet, 494.000 en Morden y 0 de futura testnets.


# Full Instruction Set
0x00      0 STOP
0x01      3 ADD
0x02      5 MUL
0x03      3 SUB
0x04      5 DIV
0x05      5 SDIV
0x06      5 MOD
0x07      5 SMOD
0x08      8 ADDMOD
0x09      8 MULMOD
0x0a varies EXP
0x0b      5 SIGNEXTEND
0x10      3 LT
0x11      3 GT
0x12      3 SLT
0x13      3 SGT
0x14      3 EQ
0x15      3 ISZERO
0x16      3 AND
0x17      3 OR
0x18      3 XOR
0x19      3 NOT
0x1a      3 BYTE
0x20 varies SHA3
0x30      2 ADDRESS
0x31 varies BALANCE
0x32      2 ORIGIN
0x33      2 CALLER
0x34      2 CALLVALUE
0x35      3 CALLDATALOAD
0x36      2 CALLDATASIZE
0x37 varies CALLDATACOPY
0x38      2 CODESIZE
0x39 varies CODECOPY
0x3a      2 GASPRICE
0x3b varies EXTCODESIZE
0x3c varies EXTCODECOPY
0x40     20 BLOCKHASH
0x41      2 COINBASE
0x42      2 TIMESTAMP
0x43      2 NUMBER
0x44      2 DIFFICULTY
0x45      2 GASLIMIT
0x50      2 POP
0x51      3 MLOAD
0x52      3 MSTORE
0x53      3 MSTORE8
0x54 varies SLOAD
0x55 varies SSTORE
0x56      8 JUMP
0x57     10 JUMPI
0x58      2 PC
0x59      2 MSIZE
0x5a      2 GAS
0x5b      1 JUMPDEST
0x60      3 PUSH1
0x61      3 PUSH2
0x62      3 PUSH3
0x63      3 PUSH4
0x64      3 PUSH5
0x65      3 PUSH6
0x66      3 PUSH7
0x67      3 PUSH8
0x68      3 PUSH9
0x69      3 PUSH10
0x6a      3 PUSH11
0x6b      3 PUSH12
0x6c      3 PUSH13
0x6d      3 PUSH14
0x6e      3 PUSH15
0x6f      3 PUSH16
0x70      3 PUSH17
0x71      3 PUSH18
0x72      3 PUSH19
0x73      3 PUSH20
0x74      3 PUSH21
0x75      3 PUSH22
0x76      3 PUSH23
0x77      3 PUSH24
0x78      3 PUSH25
0x79      3 PUSH26
0x7a      3 PUSH27
0x7b      3 PUSH28
0x7c      3 PUSH29
0x7d      3 PUSH30
0x7e      3 PUSH31
0x7f      3 PUSH32
0x80      3 DUP1
0x81      3 DUP2
0x82      3 DUP3
0x83      3 DUP4
0x84      3 DUP5
0x85      3 DUP6
0x86      3 DUP7
0x87      3 DUP8
0x88      3 DUP9
0x89      3 DUP10
0x8a      3 DUP11
0x8b      3 DUP12
0x8c      3 DUP13
0x8d      3 DUP14
0x8e      3 DUP15
0x8f      3 DUP16
0x90      3 SWAP1
0x91      3 SWAP2
0x92      3 SWAP3
0x93      3 SWAP4
0x94      3 SWAP5
0x95      3 SWAP6
0x96      3 SWAP7
0x97      3 SWAP8
0x98      3 SWAP9
0x99      3 SWAP10
0x9a      3 SWAP11
0x9b      3 SWAP12
0x9c      3 SWAP13
0x9d      3 SWAP14
0x9e      3 SWAP15
0x9f      3 SWAP16
0xa0 varies LOG0
0xa1 varies LOG1
0xa2 varies LOG2
0xa3 varies LOG3
0xa4 varies LOG4
0xb0 varies PUSH
0xb1 varies DUP
0xb2 varies SWAP
0xf0  32000 CREATE
0xf1 varies CALL
0xf2 varies CALLCODE
0xf3      0 RETURN
0xf4 varies DELEGATECALL
0xff varies SELFDESTRUCT
