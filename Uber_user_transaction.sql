WITH transactionhistory AS (
  SELECT  user_id ,
          spend,
          transaction_date,
          
        ROW_NUMBER() OVER(
          PARTITION BY user_id 
          ORDER BY transaction_date ASC
 ) as spend_rank 
 FROM transactions)
 
SELECT user_id,
      spend,
      transaction_date
FROM transactionhistory 
WHERE spend_rank=3;