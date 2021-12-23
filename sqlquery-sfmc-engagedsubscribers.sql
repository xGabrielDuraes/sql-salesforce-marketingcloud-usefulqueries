SELECT 
    S.SubscriberKey, 
    J.EmailName, 
    S.EventDate as SentDate, 
    O.EventDate as OpenDate, 
    C.EventDate as ClickDate, 
    B.EventDate as BounceDate, 
    B.BounceCategory, 
    U.EventDate as UnsubscribeDate
FROM _Sent S
LEFT JOIN _Job AS J
    ON S.JobID = J.JobID 
LEFT JOIN _Open O
    ON S.JobID = O.JobID
    AND S.ListID = O.ListID
    AND S.BatchID = O.BatchID
    AND S.SubscriberID = O.SubscriberID
    AND O.IsUnique = 1
LEFT JOIN _Click C
    ON S.JobID = C.JobID
    AND S.ListID = C.ListID
    AND S.BatchID = C.BatchID
    AND S.SubscriberID = C.SubscriberID
    AND C.IsUnique = 1
LEFT JOIN _Bounce B
    ON S.JobID = B.JobID
    AND S.ListID = B.ListID
    AND S.BatchID = B.BatchID
    AND S.SubscriberID = B.SubscriberID
    AND B.IsUnique = 1
LEFT JOIN _Unsubscribe U
    ON S.JobID = U.JobID
    AND S.ListID = U.ListID
    AND S.BatchID = U.BatchID
    AND S.SubscriberID = U.SubscriberID
    AND U.IsUnique = 1
-- ON WHERE CLAUSE IS WHERE YOU WILL SET YOUR EMAIL JOBID TO GET DATA OF WHO OPEN OR CLICK
WHERE O.JobID = 1661
OR O.JobID = 1660
OR O.JobID = 1659