# Transaction

## Transaction Control Language (TCL):
**Transactions** group a set of tasks into a single execution unit. Each transaction begins with a specific task and ends when all the tasks in the group are successfully completed. If any of the tasks fail, the transaction fails. Therefore, a transaction has only two results: success or failure.
Example:
```
1. read(A)
2. A := A – 150
3. write(A)
4. read(B)
5. B := B + 150
6. write(B)
7. commit
```
**Note**:
> - If any of the above steps fail before step 7. Then all the transaction will be rolled back to step 1 and again the transaction can be performed from step 1.
> - If it executes till step 7, transaction will be succes and all the changes will be reflected in database as transaction never fails after commited.

## Properties of Transaction (ACID):
- **Atomicity**: The outcome of a transaction can either be completely successful or completely unsuccessful. The whole transaction must be rolled back if one part of it fails. Either all success or fails. 
- **Consistency**: The database must be consistent before and after the transactions.
- **Isolation**: Multiple transactions should be isolated from one another, assuring the accuracy of the data. Concurrent transaction should not interfere one another.
- **Durability**: Once a transaction is committed, even a system restart should preserve the transaction. It should be durable.
