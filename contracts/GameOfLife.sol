pragma solidity >=0.4.21 <0.6.0;

contract rando {
    uint nonce;
    uint scale = 10;
    bool [10][10] the_game;
    //uint8 scale;
    address public owner;

    constructor() public {
        owner = msg.sender;
    //uint8 pseud_rand;
        for (uint i=0; i< scale; i++) {
            for (uint b=0; b < scale; b++) {
                bool pseud_rand = rand();
                the_game[i][b] = pseud_rand;
            }
        }
    }



    function rand() public returns (bool) {
        uint random = uint(keccak256(abi.encodePacked(now, msg.sender, nonce))) % 2;   ///100
        nonce++;
        if(random > 0){
            return true;
        }
        else{
            return false;
        }
    }


    function check(uint j , uint k)public view returns (bool){
        if (j < scale && j >= 0 && k < scale && k >= 0){
            return the_game[j][k];
        }else{
            return false;         /// the gameborder are empty cells
        }
    }

    function check_neighboors(uint j, uint k) public view returns (uint8){
        uint8 counter = 0;
        if (check(j-1,k)){
            counter++;
        }
        if(check(j-1,k-1)){
            counter++;
        }
        if(check(j,k-1)){
            counter++;
        }
        if(check(j+1,k-1)){
            counter++;
        }
        if(check(j-1,k+ 1)){
            counter++;
        }
        if(check(j+1,k)){
            counter++;
        }
        if(check(j+1,k+1)){
            counter++;
        }
        if(check(j+1,k+1)){
            counter++;
        }

        return counter;

    }

    function move() public {
        bool [10][10] memory cache;
        for (uint i=0; i< scale; i++) {
            for (uint b=0; b < scale; b++) {
                uint8 living_cells = check_neighboors(i, b);
                if(the_game[i][b] == false && living_cells >= 3){
                    cache[i][b] = true;
                }else{
                    cache[i][b] = false;
                }

            }
        }
        the_game = cache;

    }


    function get_state() public view returns (bool[10][10] memory) {
       //return uint8(uint256(keccak256(block.timestamp, block.difficulty))%251);
       return  the_game;
   }

}
