//swap coin ico creation
pragma solidity ^0.4.0;

//create the contract
contract SwapCoin
{
    //Total number of coins that will be availaibe 
    uint public Total_swap = 5000000;
    
    //convert the swap coin to us dollars
    uint public Total_swap_in_USD = 10;
    
    //variable to store the invester coin
    uint public Total_SwapCoin_for_invester = 0;
    
    //mapping the investement 
    mapping(address =>uint) investement_SwapCoin;
    mapping(address =>uint) investement_SwapCoin_to_USD;

    //ensuring the coin invetory for buyer
    modifier SwapCoinInventory(uint Dollars_invest)
    {
        require (Dollars_invest * Total_swap_in_USD + Total_SwapCoin_for_invester <= Total_swap);
        _;
    }
    
    //buyer address in ico
    function BuyerInvestementSwapCoin(address Buyer) external constant returns(uint)
    {
        return investement_SwapCoin[Buyer];
        
    }
    
    //Buyer investement in Dollars_invest
        function BuyerInvestementUSD(address Buyer) external constant returns(uint)
    {
        return investement_SwapCoin_to_USD[Buyer];
        
    }
    
    //Buy the SwapCoin
    function BuySwapCoin(address Buyer, uint Dollars_invest) external 
    SwapCoinInventory(Dollars_invest)
    {
        uint NumICOBougth = Dollars_invest * Total_swap_in_USD;
        investement_SwapCoin[Buyer] += NumICOBougth;
        investement_SwapCoin_to_USD[Buyer] = investement_SwapCoin[Buyer] / 50;
        Total_SwapCoin_for_invester += NumICOBougth;
        
    }
    
    //Selling the ico
        function SellSwapCoin(address Buyer, uint ICOSold) external 
        {
            investement_SwapCoin[Buyer] -= ICOSold;
            investement_SwapCoin_to_USD[Buyer] = investement_SwapCoin[Buyer] / 50;
            Total_SwapCoin_for_invester -= ICOSold;
        }
        
}














