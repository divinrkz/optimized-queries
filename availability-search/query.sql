-- SET @checkInDate = '';
-- SET @checkOutDate = '';
-- SET @rooomTypeId = '';


--Find available room given a checkInDate, checkOutDate, and roomTypeId.

SELECT 
        rooms."id", rooms."roomTypeId", rooms."roomNumber",
       
  /* compute how many unrented days are on either side of this new booking */
  /* so that we can sort by most optimal, and select first option */
  /* this query finds the booking that happened most recently before this booking in that room */
  /* and counts the number of days between it and our new booking check in date */
   least(
          coalesce(
            (
              select 
                DATE_PART(
                  'day', 
                  AGE(
                    @checkInDate, bookings."checkOutDate"
                  )
                ) 
              FROM 
                bookings 
                join room_bookings on bookings."id" = room_bookings."bookingId" 
              WHERE 
                bookings."checkOutDate" < @checkInDate
                and room_bookings."roomId" = rooms."id" 
              ORDER BY 
                bookings."checkOutDate" DESC 
              LIMIT 
                1
            ), 365
          ), 
          365
        ) 
        + 
          /* this query finds the booking that happens after this booking in that room */
  /* and counts the number of days between it and our new booking check out date */
        least(
          coalesce(
            (
              select 
                DATE_PART(
                  'day', 
                  AGE(
                    bookings."checkInDate", @checkOutDate
                  )
                ) 
              FROM 
                bookings 
                join room_bookings on bookings."id" = room_bookings."bookingId" 
              WHERE 
                bookings."checkInDate" > @checkOutDate
                and room_bookings."roomId" = rooms."id" 
              ORDER BY 
                bookings."checkInDate" ASC
            ), 
            365
          ), 
          365
        ) as "gap" 
      FROM 
        rooms 
        /* join rooms table with full detail (check in check out etc) */
        left join (
          select 
            "checkInDate", 
            "checkOutDate", 
            "roomId" 
          from 
            room_bookings 
            join bookings on room_bookings."bookingId" = bookings.id 
          where 
            room_bookings."isCurrent" = true 
            and room_bookings."isDeleted" = false 
            and bookings."isDeleted" = false
        ) bookings_detail 
        /* find all available rooms of this type which are not booked on these dates */
        ON (
          bookings_detail."roomId" = rooms.id 
          and (
            (
              bookings_detail."checkInDate" <= @checkOutDate
              AND bookings_detail."checkOutDate" >= @checkOutDate
            ) 
            OR (
              bookings_detail."checkInDate" <= @checkOutDate 
              AND bookings_detail."checkOutDate" >= @checkOutDate
            )
            OR 
            (
             bookings_detail."checkInDate"  >= @checkInDate
             AND bookings_detail."checkOutDate"  <= @checkOutDate
           )
           OR 
            (
             bookings_detail."checkInDate"  <= @checkInDate
             AND bookings_detail."checkOutDate"  >= @checkOutDate
           )
          )
        ) 
        /* exclude rooms with existing bookings, and fitler to only rooms of this type */
      where 
        rooms."roomTypeId" = @roomTypeId
        and bookings_detail."roomId" is null 
      order by 
        ("gap") asc