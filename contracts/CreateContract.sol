//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Contract{

    //Percent Label, Percent Artist,Total Fee, Schedule, 
    //Creation Date,Client id, Label id, Artist id, Owner id

    uint public percent_label;
    uint public percent_artist;
    uint public total_fee;
    uint public schedule;
    uint public creation_date;

    uint public client_id;
    uint public label_id;
    uint public artist_id;

    string public contract_type;

    address public owner; 

    constructor(uint _percent_label, 
                uint _percent_artist,
                uint _total_fee,
                uint _schedule,
                uint _creation_date,
                uint _client_id,
                uint _label_id,
                uint _artist_id,
                string memory _contract_type,
                address _owner) public{

        percent_label = _percent_label;
        percent_artist = _percent_artist;
        total_fee = _total_fee;
        schedule = _schedule;
        creation_date = _creation_date;

        client_id = _client_id;
        label_id =_label_id;
        artist_id = _artist_id;

        contract_type = _contract_type;

        owner = _owner;
    }

}

contract CreateContract{ // contract factory
    Contract[] public arr_contracts;

    function createContract(uint _percent_label, 
                            uint _percent_artist,
                            uint _total_fee,
                            uint _schedule,
                            uint _creation_date,
                            uint _client_id,
                            uint _label_id,
                            uint _artist_id,
                            string memory _contract_type) public {

        Contract contracts = new Contract(  _percent_label, 
                                            _percent_artist,
                                            _total_fee,
                                            _schedule,
                                            _creation_date,
                                            _client_id,
                                            _label_id,
                                            _artist_id,
                                            _contract_type,
                                            address(this));
        arr_contracts.push(contracts);
    }

    // struct
    /* 

    contract CreateContract{ // factory

    mapping(uint => MusicContract) public mcontracts;

    struct MusicContract { 
        string testname;
        string testname2;
        address owner; 
    }

    function createContract(uint _id, string memory _testname, string memory _testname2) public {
        mcontracts[_id] = MusicContract(_testname, _testname2, address(this));
    }

}

    */

    //function sendContract(){}

    //function deleteContract(){}

}