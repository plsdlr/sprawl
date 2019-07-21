pragma solidity >=0.4.21 <0.6.0;

contract byte_test {


bytes fullseed;

//function setByte(bytes16 x, uint8 i) public returns (bytes1) {
    //bytes16 mask = bytes16(0xff) << i*8;
   // return bytes1(x >> i*8);
    //return (x & ~mask) | (bytes16(b) >> (15-i)*8);
//}
uint8 size = 9;
bytes1[9][9] playfield;


function returnseed(uint8)public returns (bytes memory){
    return fullseed;
    }


function setseed(bytes memory data)public{
    fullseed = data;
    }

/*function extractSelector (bytes16 data, uint8 i) public view returns (uint8) {
        uint8 sel = uint8(data[i]);
        return sel;
    }*/

function extractSelectorData(uint8 i)public view returns(uint8){
        uint8 sel = uint8(fullseed[i]);
        return sel;
    }

function extractFieldState(uint8 i, uint8 j)public view returns(uint8){
        uint8 sel = uint8(playfield[i][j]);
        return sel;
    }

function initPlayfield()public{
        uint8 counter = 0;
        for (uint i; i < size; i++) {
            for (uint b; b < size; b++) {
            playfield[i][b] = fullseed[counter];
            counter = counter + 1;
        }
    }
}


/// ["0x00","0xaa", "0xff","0x00","0xaa", "0xff","0x00","0xaa", "0xff","0x00","0xaa", "0xff","0x00","0xaa", "0xff", "0xff"]
////["0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00","0x00","0x00","0x01","0x01","0x00","0x01","0x00","0x01","0x00","0x01","0x00"]
//  ["0x00","0x01", "0xff","0x00","0xaa", "0xff","0x00","0xaa", "0xff","0x00","0xaa", "0xff","0x00","0xaa", "0xff", "0xff"],1

}