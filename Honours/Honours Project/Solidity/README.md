This repository is compromised of solidity files used as a back-end solution to store highly sensitive personal information. 

Different versions of my project are available, as I came to conclusions at different stages of designing this solution.
I am self-taught in creating a blockchain solution. My project aims to create a secure protocol that can store and 
present personal information/documents. The idea is that there will be a transaction between a source and destination. 
This transaction contains a payload used to store information. The sender and destination are used to authenticate the 
validity of the transaction and the information linked to it.

If a solution was created where the information of a person was split up in multiple transactions on the blockchain 
(memory efficient way to store information using classes and functions in solidity); the search algorithm to retrieve this
person's split up information would take far too long when the blockchain grows. 

The final design was based on storing all of a person's information using an inherited chain of classes where I split up 
the functions used to store/retrieve a person's information. All of a person's latest information would be stored in their 
latest transaction on the blockchain, where the sender is the identifier of the current person and the destination is the 
government department used to verify the information. The payload of the transaction is a person object with all their 
current information. The main problem that denied the feasibility of the project, was due to solidity being in too much 
of an infantile state to deal with the memory load of functions and inherited classes as they grew in size. Basically it 
does not have an efficient memory management scheme to deal with storing and retrieving a great amount of 
information pertaining to a single object.

Hopefully in the future, a better memory management scheme would be available for developing solidity solutions. I 
even tried memory compression techniques, such as converting strings to bytes32, but to no avail. 
