# Case Study

1. NFTs for team A and team B can be minted by calling the mintItemA and mintItemB functions respectively by passing the name of NFT as argument.
2. By default, the health attribute of newly minted NFT is zero. 
3. Health of NFT can be updated by passing the respective NFT’s ID and new health attribute to updateHealth function. This function on contract can be triggered every 24 hrs using keepers (chain link keepers or openZeppelin defenders). Ideally the data should come from a decentralized oracle, but the data asked in the challenge may not be available with existing oracles available, hence an API call (rapid API )integrated in the keepers can be used to fetch the updated data from the internet.
4. Since the attribute updation requires iteration through all the NFts and for a large number of NFTs, this may lead to transaction running out of gas. Hence NFTs can be updated in batches of small numbers may be 4 or 5 by passing ids and healths in arrays. 
5. Scores for both the teams will be updated along with the health update so that we need not iterate again on the healths.
6. startUpdate and endUdate functions are used to make sure not to declare the wrong winner while update is in the process.
7. Choice of blockchain depends on :
	1. Speed at which transactions are included in the block. This is important as we are going to update a large number of NFTs daily.
	2. Transaction costs, as we will be sending a number of transactions every 24 hrs. 
