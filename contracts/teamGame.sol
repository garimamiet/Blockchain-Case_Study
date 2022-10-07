// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
 
contract teamGame is ERC721 {
   
    constructor() ERC721("teamGame", "GME"){
 
    }
    struct item {
        uint id;
        uint health;
        string name;
    }
 
    uint public scoreA;
    uint public scoreB;
 
    bool isWinnerAvailable;
 
    item[] public items;
 
   
    // returns 0 for teamA and 1 for teamB
    mapping(uint => uint) idToTeam;
 
    
 
    function startUpdate() external {
        isWinnerAvailable = false;
    }
 
    function endUpdate() external {
        isWinnerAvailable = true;
    }
 
    function mintItemA(string memory _name) public {
        uint id = items.length;
        _mint(address(this), id);
       
        items.push(item(id, 0, _name));
       
        idToTeam[id] = 0;
    }
 
    function mintItemB(string memory _name) public {
        uint id = items.length;
        _mint(address(this), id);
       
        items.push(item(id, 0, _name));
   
        idToTeam[id]=1;
    }
 
    function updateHealth(uint[] calldata _ids, uint[] calldata _healths) external {
        for(uint i=0; i<_ids.length; i++){
 
        uint _id = _ids[i];
        items[_id].health = _healths[i];
        if(idToTeam[_id]==0){
            scoreA += _healths[i];
        }
        else{
            scoreB += _healths[i];
        }
    }
    }
 
    function checkWinner() external view returns (string memory){
        require(isWinnerAvailable, "winner not yet declared");
        if (scoreA > scoreB){
            return "Team A";
        }
        if(scoreB > scoreA){
            return "team B";
        }
        else{
            return "It's TIE";
        }
    }
