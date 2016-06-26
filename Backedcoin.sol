##Minted eth backed currency

contract Coin {

    // The line address public minter; declares a state variable of type address that is publicly accessible. 
    // The address type is a 160 bit value that does not allow any arithmetic operations. 
    // It is suitable for storing addresses of contracts or keypairs belonging to external persons.
    // The keyword public automatically generates a function that allows you to access the current value of the state variable. 
    // Without this keyword, other contracts have no way to access the variable and only the code of this contract can write 
    // to it. The function will look something like this (please note that the function and the state variable have not the same name): 
    //function theminter() returns (address) { return minter; }
    
    address public minter;
    
    //The next creates a public state variable, but it is a more complex datatype. The type maps addresses to unsigned integers. 
    // Mappings can be seen as hashtables which are virtually initialized such that every possible key exists and is mapped to 
    // a value whose byte-representation is all zeros. This analogy does not go too far, though, as it is neither possible 
    //to obtain a list of all keys of a mapping, nor a list of all values. So either keep in mind (or better, keep a list 
    //or use a more advanced data type) what you added to the mapping or use it in a context where this is not needed, 
    //like this one. The accessor function created by the public keyword is a bit more complex in this case. 
    //It roughly looks like the following (you can use this function to easily query the balance of a single account):
    //function balances(address _account) returns (uint balance) {
    //return balances[_account];
    //}

    mapping (address => uint) public balances;

    // Events allow light clients to react on changes efficiently. The so-called “event” is fired in the last line of the function send.
    //  User interfaces (as well as server appliances) can listen for those events being fired on the blockchain 
    // without much cost. As soon as it is fired, the listener will also receive the arguments from, to and value, 
    // which makes it easy to track transactions. In order to listen for this event, you would use
    // Coin.Sent().watch({}, '', function(error, result) {
    //  if (!error) {
    //    console.log("Coin transfer: " + result.args.amount + " coins were sent from " + result.args.from + " to " + result.args.to + ".");
    //    console.log("Balances now:\n" + "Sender: " + Coin.balances.call(result.args.from) + "Receiver: " + Coin.balances.call(result.args.to));
    //  }
    //}
    
    event Sent(address from, address to, uint amount);

    // This is the constructor whose code is run only when the contract is created and cannot be called afterwards.
    // It permanently stores the address of the person creating the contract: msg (together with tx and block) is a
    // magic global variable that contains some properties which allow access to the blockchain. 
    // msg.sender is always the address where the current (external) function call came from.
    
    function Coin() {
        minter = msg.sender;
    }
    
    // Finally, the functions that will actually end up with the contract and can be called by users and contracts alike are mint and send. 
    // Función mint: Mintear (msg) la suma enviada del minter que es le mismo que el sender al receiver.
    // If mint is called by anyone except the account that created the contract, nothing will happen. 
    
    function mint(address receiver, uint amount) {
        if (msg.sender != minter) 
          return;
        balances[receiver] += amount;
    }
    
    // Función send: Enviar suma del sender al receiver
    // On the other hand, send can be used by anyone (who already has some of these coins) to send coins to anyone else. 
    // Note that if you use this contract to send coins to an address, you will not see anything when you look at that address
    // on a blockchain explorer, because the fact that you sent coins and the changed balances are only stored in the data 
    // storage of this particular coin contract. By the use of events it is relatively easy to create a “blockchain explorer” 
    // that tracks transactions and balances of your new coin.
    
    function send(address receiver, uint amount) {
        if (balances[msg.sender] < amount) 
            return; 
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Sent(msg.sender, receiver, amount);
    }
}
