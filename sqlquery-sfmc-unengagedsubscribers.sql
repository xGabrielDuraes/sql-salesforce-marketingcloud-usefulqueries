-- Unengaged subscribers (no opens or clicks) in the last 7 days

SELECT DISTINCT
    S.SubscriberKey,
    J.EmailName
FROM _Sent S
LEFT JOIN _Job J
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
WHERE S.EventDate > DATEADD(D,-7,GETDATE())
AND (O.SubscriberID IS NULL AND C.SubscriberID IS NULL)