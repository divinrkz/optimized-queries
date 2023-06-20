### AVAILABILITY SEARCH
This are queries used mainly in AirBnBs, Hotels and other accomodations lodgings. The idea is to optimize search queries for room availability and restrictions in Hotel PMS and Channel managers for PMS.

So the algorithm should work in steps like this:
1. Select all bookings within a certain window (e.g. next two weeks), and skip over / ignore all bookings that have already checked in during this time, and ignore all bookings that extend beyond the window.
2. Looping through each of these bookings, treat it as if it is a new booking request, take the check in, check out and room type, and do an availability search.
3. Looping through all potential availability options in those search results, compute the total number of unrented days on either side of the booking in the new configuration
4. Also compute the total number of unrented days on either side of the booking in its current configuration