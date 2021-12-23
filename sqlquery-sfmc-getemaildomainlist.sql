-- Get domains of a data extension
Select
    Substring(Main.Email, Charindex('@', Main.Email) +1, Len(Main.Email)) As Dominio
From [BR_Bauducco_MainDE_Contacts] Main
Where Main.Origem = 'Marketing2' -- here you will set your data extensions
Group By (Substring(Main.Email, Charindex('@', Main.Email) +1, Len(Main.Email)))

-- Get domains and count the number of email registered by each domain
Select
    Substring(Main.Email, Charindex('@', Main.Email) +1, Len(Main.Email)) As Dominio,
    Count(Main.Email) As Email_Count
From [BR_Bauducco_MainDE_Contacts] Main -- here you will set your data extensions
Where Main.Origem = 'Marketing2' 
Group By (Substring(Main.Email, Charindex('@', Main.Email) +1, Len(Main.Email)))