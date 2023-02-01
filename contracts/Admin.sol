pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2; 

//Test
contract Hello
{
   uint num = 4;
   function hello() pure public returns(string memory) 
   {
      return "Hello";
   }
}


// Validation of Artist, Label, Client Access
contract Admin {

    // mapping(uint => Artist) public artists;
    // mapping(uint => Label) public labels;
    mapping(uint => Client) public clients;
    event newMember(uint indexed _id); 
    // uint artistCount;
    // uint labelCount;
    uint clientCount;

    address admin; //idk what this does

     constructor() {
        admin = msg.sender; //set admin as the account that deploy the contract
        clientCount = 1;
        addClient('Client1', 1);
    }

     modifier onlyAdmin() { //only admin can add/view clinicians, patients and labs
        require(msg.sender == admin);
        _;
    }

    // struct Artist{
    //     bytes16 FirstName;
    //     bytes16 LastName;
    //     uint8 ArtistID;
    //     string[] SignedContracts;
    //     string[] UnsignedCcontracts;
    //     // string[] IPFSSongs; //need ba?
    // }

    // struct Label{
    //     bytes16 Name;
    //     uint8 LabelID;
    //     string[] SignedContracts; //mapping
    //     string[] UnsignedCcontracts; // mapping
    //     // string[] IPFSSongs; // need ba?
    // }

    struct Client{
        bytes16 Name;
        uint8 ClientID;
        // string[] SignedContracts;

    }

    // struct MusicContract{
    //     percent_label
    //     percent_artist
    //     total_fee
    //     schedule
    //     repeating
    //     creation_date
    //     //signing
    //     status
    //     contract_type
    // }

    //Functions


    //Add Client
    function addClient(bytes16 Name, uint8 ID) public onlyAdmin {
        if ((ID < clientCount) && (ID >= 0)) { 
            clients[ID] = Client(Name, ID);
        }
        else {
            revert("Invalid clientID");
        }
    }
    
    // function getClient(uint c_id) public view returns(Client client) {
    //     return clients[c_id];
    // }


    //Add Artist
    //Add Label


    

}
