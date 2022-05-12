BEGIN 
AddNewDirector('dda','KIRSSSASILL',2);
END; 
/
BEGIN 
DeleteDirector(999);
END;
/
BEGIN 
UpdateDirector(6,'dasdad','TESTING',3);
END;
/
BEGIN 
AddNewCOUNTRY('TEST1',331);
END;
/
BEGIN 
DeleteCOUNTRY(9);
END;
/
BEGIN
UPDATECOUNTRY(1,'TEST',24);
END;
/
BEGIN
AddNewFILM(7207,'FIGHING CLUBd',3,3,TO_DATE('13/02/2000', 'DD/MM/YYYY'));
END;
/
BEGIN
UpdateFILM(13,'FIGHING CLUB 3',2,3,TO_DATE('13/02/2022', 'DD/MM/YYYY'));
END;
/
BEGIN
DeleteFilm(3);
END;
/
BEGIN
AddNewSession(2,'CAMEDY',131,30,30,50,TO_DATE('12/03/2022', 'DD/MM/YYYY'));
END;
/
BEGIN
UpdateSession(6,'TRILLER',131,150,150,25,TO_DATE('12/03/2022', 'DD/MM/YYYY'));
END;
/
SELECT *FROM SESSIONF;
/
BEGIN
DeleteSESSION(6);
END;
/
BEGIN 
SearchFilmbyId(5);
END;
/
BEGIN 
SearchFilmByDirector(2);
END;
/
BEGIN
bookingTicket(1029786947,'VASYA POCHTA',1,5);
END;
/
BEGIN
CancelBooking(3);
END;
/
BEGIN
ReportOnMovieRental(99);
END;
/
BEGIN 
ReportOnMoviesAttendance(2);
END;
/
BEGIN
AddNewHall(2231221,'GREY',20,250);
END;
/
BEGIN
DeleteNewHall(3);
END;
/
begin
DeleteOrder(4);
end;
/
begin
DeleteClientl(6);
end;
/
SELECT *FROM COUNTRY;
SELECT *FROM DIRECTORS;
SELECT *FROM films;
SELECT *FROM SESSIONF;
SELECT *FROM HALL;
SELECT *FROM CLIENTS;
SELECT *FROM ORDERS;
commit;
rollback;