//1. IMPORTING SOURCE FILES: import context:prefix=target as alias from context:prefix=target

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


//2. COMMENTS // /* */
// This is a single-line comment.

/*
This is a
multi-line comment.
*/
// Additionally, there is another type of comment called a natspec comment, for which the documentation is not yet written. They are written with a triple slash (///) or a double asterisk block(/** ... */) and they should be used directly above function declarations or statements. 


//3. STRUCTURE OF A CONTRACT contract NameoftheContract {..}
//  Each contract can contain declarations of // State Variables, Functions, Function Modifiers, Events, Structs Types and Enum Types. 
//  Furthermore, contracts can inherit from other contracts.


//3.1. STATE VARIABLES
//  Solidity is a statically typed language, which means that the type of each variable (state and local) needs to be specified or at least specifiable (Type Deduction) at compile-time. Solidity provides several elementary types which can be combined to form complex types.

// Value types: 

// 1 bool
/// 1.1. logical operators: !, &&, || -Warn: || means OR, and in the expression f(x) || g(y), if f(x) evaluates to true, g(y) will not be evaluated even if it may have side-effects-, ==, =!

// 2 int/uint: u in unit means unsigned interger, both are have size equal to uint256 and int256, but they could also be uint8 and int8 f.i. WHAT IS BITWISE, WHAT IS UNARY AND WHAT MEANS Division always truncates (it just maps to the DIV opcode of the EVM), but it does not truncate if both operators are literals (or literal expressions, see points 7 and 8).
/// 2.1. comparative operators: <=, <, ==, !=, >=, >
/// 2.2. bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation)
/// 2.3. arithmetic operators: +, -, unary -, unary +, *, /, % (remainder), ** (exponentiation)

contract SimpleStorage {
    uint storedData; // State variable
    // ...
}

// 3 address: Holds a 20 byte value (size of an Ethereum address). Base for contracts.
/// 3.1. comparative operators:<=, <, ==, !=, >= and >
address x = 0x123;
address myAddress = this;

/// 3.2. Members of Addresses:
//// 3.2.1. balance: It is possible to query the balance of an address using the property balance. All contracts inherit the members of address, so it is possible to query the balance of the current contract using this.balance.

if (x.balance < 10 && myAddress.balance >= 10)

//// 3.2.2 send: Members of Addresses: It is possible to send Ether (in units of wei) to an address using the send function. If x is a contract address, its code (more specifically: its fallback function, if present) will be executed together with the send call (this is a limitation of the EVM and cannot be prevented). If that execution runs out of gas or fails in any way, the Ether transfer will be reverted. In this case, send returns false. WHAT IS FALLBACK FUNCTION?. There are other dangers in using send: The transfer fails if the call stack depth is at 1024 (this can always be forced by the caller HOW CAN THIS BE FORCED THE CALLER) and it also fails if the recipient runs out of gas. So in order to make safe Ether transfers, always check the return value of send or even better: Use a pattern where the recipient withdraws the money.

x.send(10);

//// 3.2.3 call: Members of Addresses: To interface with contracts that do not adhere to the ABI, the function call is provided which takes an arbitrary number of arguments of any type. These arguments are modified to 32 bytes (if less, it adds 0s) and concatenated (256 bits). One exception is the case where the first argument is encoded to exactly four bytes. In this case, if minor of four bytes no 0s are added, in order to allow the use of function signatures here. call returns a boolean indicating whether the invoked function terminated (true) or caused an EVM exception (false). It is not possible to access the actual data returned (for this we would need to know the encoding and size in advance).

address nameReg = 0x72ba7d8e73fe8eb666ea66babc8116a41bfb10e2;
nameReg.call("register", "MyName");
nameReg.call(bytes4(sha3("fun(uint256)")), a);


//// 3.2.4 delegatecall and callcode: Member of Addresses: In a similar way, the function delegatecall can be used: The difference is that only the code of the given address is used, all other aspects (storage, balance, ...) are taken from the current contract. The purpose of delegatecall is to use library code which is stored in another contract. The user has to ensure that the layout of storage in both contracts is suitable for delegatecall to be used. Prior to homestead, only a limited variant called callcode was available that did not provide access to the original msg.sender and msg.value values. All three functions call, delegatecall and callcode are very low-level functions and should only be used as a last resort as they break the type-safety of Solidity.

// 5 Fixed-size byte arrays: bytes1, bytes2, bytes3, ..., bytes32. byte is an alias for bytes1. 
//Complex types, i.e. types which do not always fit into 256 bits have to be handled more carefully than the value-types we have already seen. 
//Since copying them can be quite expensive, we have to think about whether we want them to be stored in memory (which is not persisting) 
//or storage (where the state variables are held). Normally, Reference types are: Data location, arrays or structs.

//5.1. Data location: arrays and structs, has an additional annotation, the “data location”, about whether it is stored in memory or in storage.
// Data locations are important because they change how assignments behave: 
///Assignments between storage and memory and also to a local or state variable (even other state variable) always create an independent copy assigning a reference and this reference always points to the state variable even if the latter is changed in the meantime. 
///Assignments from a memory stored reference type to another memory-stored reference type does not create a copy.

//5.1.1.Forced data location:
///parameters (not return) of ----external--- functions: calldata, which is a non-modifyable non-persistent area, and it behaves mostly like memory.
///state variables: storage
//5.1.2.Default data location:
///parameters (also return) of functions: memory
///all other local variables: storage                                                                                                                               Eres un Sol ;)

contract C {
    uint[] x; // the data location of x is storage

    // the data location of memoryArray is memory
    function f(uint[] memoryArray) {
        x = memoryArray; // works, copies the whole array to storage
        var y = x; // works, assigns a pointer, data location of y is storage
        y[7]; // fine, returns the 8th element
        y.length = 2; // fine, modifies x through y
        delete x; // fine, clears the array, also modifies y
        // The following does not work; it would need to create a new temporary /
        // unnamed array in storage, but storage is "statically" allocated:
        // y = memoryArray;
        // This does not work either, since it would "reset" the pointer, but there
        // is no sensible location it could point to.
        // delete y;
        g(x); // calls g, handing over a reference to x
        h(x); // calls h and creates an independent, temporary copy in memory
    }

    function g(uint[] storage storageArray) internal {}
    function h(uint[] memoryArray) {}
}

//5.2. Arrays: 
//Arrays can have a compile-time fixed size or they can be dynamic. An array of fixed size k and element type T is written as T[k], an array of dynamic size as T[].
//An array of 5 dynamic arrays of uint is uint[][5] (note that the notation is reversed when compared to some other languages). 
//To access the second uint in the third dynamic array, you use x[2][1] (indices are zero-based and access works in the opposite way of the declaration, i.e. x[2] shaves off one level in the type from the right).
///5.2.1.For storage arrays, the element type can be arbitrary (i.e. also other arrays, mappings or structs). 
///5.2.2.For memory arrays, it cannot be a mapping and has to be an ABI type if it is an argument of a publicly-visible function. As opposed to storage arrays, it is not possible to resize or allocate memory arrays by assigning to the .length member.
///5.2.3.Variables of type bytes and string are special arrays. 
////5.2.3.1. A bytes is similar to byte[], but it is packed tightly in calldata. So bytes should always be preferred over byte[] because it is cheaper
////5.2.3.2. String is equal to bytes but does not allow length or index access (for now). If you want to access the byte-representation of a string s, use bytes(s).length / bytes(s)[7] = 'x';. Keep in mind that you are accessing the low-level bytes of the utf-8 representation, and not the individual characters!

contract C {
    function f(uint len) {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        // Here we have a.length == 7 and b.length == len
        a[6] = 8;
    }
}
Array Literals / Inline Arrays
Array literals are arrays that are written as an expression and are not assigned to a variable right away.

contract C {
    function f() {
        g([uint(1), 2, 3]);
    }
    function g(uint[3] _data) {
        // ...
    }
}
The type of an array literal is a memory array of fixed size whose base type is the common type of the given elements. The type of [1, 2, 3] is uint8[3] memory, because the type of each of these constants is uint8. Because of that, it was necessary to convert the first element in the example above to uint. Note that currently, fixed size memory arrays cannot be assigned to dynamically-sized memory arrays, i.e. the following is not possible:

contract C {
    function f() {
        // The next line creates a type error because uint[3] memory
        // cannot be converted to uint[] memory.
        uint[] x = [uint(1), 3, 4];
}
It is planned to remove this restriction in the future but currently creates some complications because of how arrays are passed in the ABI.

Members
length:
Arrays have a length member to hold their number of elements. Dynamic arrays can be resized in storage (not in memory) by changing the .length member. This does not happen automatically when attempting to access elements outside the current length. The size of memory arrays is fixed (but dynamic, i.e. it can depend on runtime parameters) once they are created.
push:
Dynamic storage arrays and bytes (not string) have a member function called push that can be used to append an element at the end of the array. The function returns the new length.
Warning

It is not yet possible to use arrays of arrays in external functions.
Warning

Due to limitations of the EVM, it is not possible to return dynamic content from external function calls. The function f in contract C { function f() returns (uint[]) { ... } } will return something if called from web3.js, but not if called from Solidity.

The only workaround for now is to use large statically-sized arrays.
contract ArrayContract {
    uint[2**20] m_aLotOfIntegers;
    // Note that the following is not a pair of arrays but an array of pairs.
    bool[2][] m_pairsOfFlags;
    // newPairs is stored in memory - the default for function arguments

    function setAllFlagPairs(bool[2][] newPairs) {
        // assignment to a storage array replaces the complete array
        m_pairsOfFlags = newPairs;
    }

    function setFlagPair(uint index, bool flagA, bool flagB) {
        // access to a non-existing index will throw an exception
        m_pairsOfFlags[index][0] = flagA;
        m_pairsOfFlags[index][1] = flagB;
    }

    function changeFlagArraySize(uint newSize) {
        // if the new size is smaller, removed array elements will be cleared
        m_pairsOfFlags.length = newSize;
    }

    function clear() {
        // these clear the arrays completely
        delete m_pairsOfFlags;
        delete m_aLotOfIntegers;
        // identical effect here
        m_pairsOfFlags.length = 0;
    }

    bytes m_byteData;

    function byteArrays(bytes data) {
        // byte arrays ("bytes") are different as they are stored without padding,
        // but can be treated identical to "uint8[]"
        m_byteData = data;
        m_byteData.length += 7;
        m_byteData[3] = 8;
        delete m_byteData[2];
    }

    function addFlag(bool[2] flag) returns (uint) {
        return m_pairsOfFlags.push(flag);
    }

    function createMemoryArray(uint size) returns (bytes) {
        // Dynamic memory arrays are created using `new`:
        uint[2][] memory arrayOfPairs = new uint[2][](size);
        // Create a dynamic byte array:
        bytes memory b = new bytes(200);
        for (uint i = 0; i < b.length; i++)
            b[i] = byte(i);
        return b;
    }
}

/// 5.1. comparative operators: <=, <, ==, !=, >=, >
/// 5.2. bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation)
/// 5.3. index access: If x is of type bytesI, then x[k] for 0 <= k < I returns the k th byte (read-only).

/// 5.4. Members of fixed-size byte arrays:
//// 5.4.1. .length: yields the fixed length of the byte array (read-only).

// 6 Dynamically-sized byte array: If you can limit the length to a certain number of bytes, always use one of bytes1 to bytes32 because they are much cheaper.
/// 6.1. bytes: Dynamically-sized byte array. Not a value-type! use bytes for arbitrary-length raw byte data 
/// 6.2. string: Dynamically-sized UTF8-encoded string. Not a value-type! use string for arbitrary-length string (utf-8) data.

// 7 Fixed Point Numbers
/// Coming soon

// 8 Rational and interger literals: All number literals retain arbitrary precision until they are converted to a non-literal type (i.e. by using them together with a non-literal type). Thus computations do not overflow (f.i.2**800 + 1 - 2**800 results in the constant 1 (of type uint8) although intermediate results would not even fit the machine word size) and also divisions do not truncate (.5 * 8 results in the integer 4 although non-integers were used in between). 

// WHAT MEANS FIXED? If the result is not an integer, an appropriate ufixed or fixed type is used whose number of fractional bits is as large as required (approximating the rational number in the worst case). In var x = 1/4; x will receive the type ufixed0x8 while in var x = 1/3 it will receive the type ufixed0x256 because 1/3 is not finitely representable in binary and will thus be approximated. Most finite decimal fractions like 5.3743 are not finitely representable in binary. The correct type for 5.3743 is ufixed8x248 because that allows to best approximate the number. If you want to use the number together with types like ufixed (i.e. ufixed128x128), you have to explicitly specify the desired precision: x + ufixed(5.3743). Division on integer literals used to truncate in earlier versions, but it will now convert into a rational number, i.e. 5 / 2 is not equal to 2, but to 2.5.

// Literal expressions are converted to a permanent type as soon as they are used with other expressions. Even though we know that the value of the expression assigned to b in the following example (evaluates to an integer, it still uses fixed point types (and not rational number literals) in between and so the code does not compile
uint128 a = 1;
uint128 b = 2.5 + a + 0.5;

/// 8.1. comparative operators: <=, <, ==, !=, >=, >
/// 8.2. bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation). If any of the rational and interger literals is fractional (x = 1/5) bit operations are disallowed.
/// 8.3. arithmetic operators: +, -, unary -, unary +, *, /, % (remainder), ** (exponentiation). The exponentiation is disallowed if the exponent is fractional (because that might result in a non-rational number).

// 9 String Literals: String Literals are written with double quotes ("abc"). As with integer literals, their type can vary, but they are implicitly convertible to bytes if they fit, to bytes and to string.

 
//3.2. FUNCTIONS

//3.3. FUNCTION MODIFIERS

//4.4. EVENTS

//4.5. STRUCTS TYPES: Structs are custom defined reference types that can group several variables.

contract Ballot {
    struct Voter { // Struct
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }
}

//4.6. ENUM TYPES: Enums can be used to create custom types with a finite set of values. Enums are one way to create a user-defined type in Solidity. They are explicitly convertible to and from all integer types but implicit conversion is not allowed.

contract Purchase {
    enum State { Created, Locked, Inactive } // Enum
}

contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() {
        choice = ActionChoices.GoStraight;
    }

    // Since enum types are not part of the ABI, the signature of "getChoice"
    // will automatically be changed to "getChoice() returns (uint8)"
    // for all matters external to Solidity. The integer type used is just
    // large enough to hold all enum values, i.e. if you have more values,
    // `uint16` will be used and so on.
    function getChoice() returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() returns (uint) {
        return uint(defaultChoice);
    }
}


