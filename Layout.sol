//IMPORTING SOURCE FILES: import context:prefix=target as alias from context:prefix=target

import "filename";
import * as symbolName from "filename";
import "filename" as symbolName; //OR import * as symbolName from "filename";
import {symbol1 as alias, symbol2} from "filename";
import * as symbolName from "filename";

//In the above, filename is always treated as a path (PREFIX) with / as directory separator, . as the current and .. as the parent directory.
//Thus, to import a file x from the same directory as the current file, use 
import "./x" as x
//If you use import "x" as x; instead, a different file could be referenced (in a global “include directory”).

// The the TARGET of the imported source prefix can also be remapped. So, for example: 
// if you clone github.com/ethereum/dapp-bin/ locally to /usr/local/dapp-bin, you can use the following in your source file:
import "github.com/ethereum/dapp-bin/library/iterable_mapping.sol" as symbolName;
// you can then run the compiler as
solc github.com/ethereum/dapp-bin/=/usr/local/dapp-bin/ file.sol

// You can even imports in module2 CONTEXT to the old target but imports in module1 CONTEXT to get the new target.
solc module1:github.com/ethereum/dapp-bin/=/usr/local/dapp-bin/ \
     module2:github.com/ethereum/dapp-bin/=/usr/local/dapp-bin_old/ \
     source.sol
     
//The browser-based compiler provides an automatic remapping for github
//https://ethereum.github.io/browser-solidity/
import "github.com/ethereum/dapp-bin/library/iterable_mapping.sol" as it_mapping;.


//COMMENTS // /* */
// This is a single-line comment.

/*
This is a
multi-line comment.
*/
// Additionally, there is another type of comment called a natspec comment, for which the documentation is not yet written. They are written with a triple slash (///) or a double asterisk block(/** ... */) and they should be used directly above function declarations or statements. 



