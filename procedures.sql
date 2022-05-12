create or replace procedure AddNewDirector(SURNAMEDIR IN DIRECTORS.SURNAME%TYPE,NAME IN DIRECTORS.NAME%TYPE,COUNTRY_CODE_ country.id_country%TYPE)
is 
    varible int := 0;
begin
    select count(*) INTO VARIBLE from country where COUNTRY_CODE_ = COUNTRY.ID_COUNTRY;
    IF VARIBLE = 0
        THEN DBMS_OUTPUT.put_line('COUNTRY_CODE_ err : there is no such country_CODE');
        ELSE 
        insert into DIRECTORS(SURNAME, NAME, COUNTRY_CODE) 
        VALUES(SURNAMEDIR, NAME, COUNTRY_CODE_);
        DBMS_OUTPUT.put_line('INSERT SUCCESS');
    END IF;        
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure DeleteDirector(P_ID DIRECTORS.ID_DIR%TYPE)
is
    vari1 int :=0;
    vari2 int :=0;
    vari3 FILMS.film_code%TYPE;
    vari4 int :=0;    
begin
    select count(*) into vari1 from directors where DIRECTORS.ID_DIR = P_ID;
    if vari1 =0
        then    DBMS_OUTPUT.put_line('P_ID erro: there is no suck director');
        return;
   else
        select DIRECTOR_CODE into vari2 from directors where DIRECTORS.ID_DIR = P_ID;
        select film_code into vari3 from films where films.DIRECTOR_CODE = vari2; 
        DELETE FROM DIRECTORS WHERE DIRECTORS.ID_DIR=P_ID;
        DELETE FROM SESSIONF WHERE SESSIONF.film_code=vari3;
        DBMS_OUTPUT.put_line('DELETE SUCCESS');
    end if;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure UpdateDirector(P_ID DIRECTORS.ID_DIR%TYPE,P_SURNAME DIRECTORS.SURNAME%TYPE,P_NAME IN DIRECTORS.NAME%TYPE,P_COUNTRY_CODE IN DIRECTORS.COUNTRY_CODE%TYPE)
is
    varible int := 0;
begin
    select count(*) INTO VARIBLE from country where P_COUNTRY_CODE = COUNTRY.ID_COUNTRY;
    IF VARIBLE = 0
        THEN DBMS_OUTPUT.put_line('P_COUNTRY_CODE erro : there is no such country_CODE');
        ELSE 
            UPDATE DIRECTORS SET ID_DIR = P_ID,
                SURNAME = P_SURNAME,
                    NAME = P_NAME, 
                        COUNTRY_CODE = P_COUNTRY_CODE  
                            WHERE DIRECTORS.ID_DIR = P_ID;
         DBMS_OUTPUT.put_line('UPDATE SUCCESS');                    
         END IF;                    
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure AddNewCOUNTRY( 
  NAME_ IN COUNTRY.NAME%TYPE, 
  COUNTRY_CODE_ IN COUNTRY.COUNTRY_CODE%TYPE)
is
    vari1 int :=0;
    vari2 int :=0;
begin
    select count(*) INTO vari1 from COUNTRY where COUNTRY_CODE_ = COUNTRY.COUNTRY_CODE;
    select count(*) INTO vari2 from COUNTRY where NAME_ = COUNTRY.NAME;
    if vari1 !=0
        then DBMS_OUTPUT.put_line('COUNTRY_CODE ERRO: THERE IS ALREADY SUCH COUNTRY CODE');
    elsif vari2 !=0
        then DBMS_OUTPUT.put_line('NAME_ THERE IS ALREADY SUCH COUNTRY');
    else     
        insert into COUNTRY(ID_COUNTRY,NAME, COUNTRY_CODE) 
        VALUES(DEFAULT,NAME_,COUNTRY_CODE_);
        DBMS_OUTPUT.put_line(sqlerrm);
    end if;    
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure DeleteCOUNTRY( 
  P_ID_COUNTRY IN COUNTRY.ID_COUNTRY%TYPE)
is
    varible int := 0;
begin
    select count(*) INTO VARIBLE from country where P_ID_COUNTRY = COUNTRY.ID_COUNTRY;
    IF VARIBLE = 0
        THEN DBMS_OUTPUT.put_line('P_ID_COUNTRY erro : there is no such country_ID');
    ELSE    
        DELETE COUNTRY WHERE COUNTRY.id_country=P_ID_COUNTRY;
        DBMS_OUTPUT.put_line(sqlerrm);
    END IF; 
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure UpdateCountry( 
  P_ID_COUNTRY IN COUNTRY.ID_COUNTRY%TYPE,COUNTRY_ IN COUNTRY.NAME%TYPE,COUNTRY_CODE_ IN COUNTRY.COUNTRY_CODE%TYPE)
is
    varible int := 0;
    varible1 int := 0;
    varible2 int := 0; 
    varible3 int := 0;    

begin
    select count(*) INTO VARIBLE from country where P_ID_COUNTRY = COUNTRY.ID_COUNTRY;
    select count(*) INTO VARIBLE1 from country where COUNTRY_CODE_ = COUNTRY.COUNTRY_CODE;
    select count(*) INTO VARIBLE2 from country where COUNTRY_ = COUNTRY.NAME;
    select count(*) INTO VARIBLE2 from country where COUNTRY_ = COUNTRY.NAME;

    IF VARIBLE = 0
        THEN DBMS_OUTPUT.put_line('P_ID_COUNTRY erro : there is no such country_ID');
    ELSIF varible1 !=0
        THEN  DBMS_OUTPUT.put_line('COUNTRY_CODE_ erro : there is ALREADY THE SAME COUNTRY CODE');
    ELSIF varible2 !=0
        THEN  DBMS_OUTPUT.put_line('COUNTRY_ erro : there is ALREADY THE SAME COUNTRY_');    
    ELSE 
            UPDATE COUNTRY SET COUNTRY.ID_COUNTRY = P_ID_COUNTRY,
                COUNTRY.NAME = COUNTRY_,
                    COUNTRY_CODE = COUNTRY_CODE_ 
                        WHERE COUNTRY.ID_COUNTRY = P_ID_COUNTRY;
            DBMS_OUTPUT.put_line(sqlerrm);            
         END IF;                    
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure AddNewFILM(FILM_CODE_ IN FILMS.FILM_CODE%TYPE,FILM_ IN FILMS.FILM%TYPE,GENRE_CODE_ FILMS.GENRE_CODE%TYPE,DIR_CODE_ FILMS.DIRECTOR_CODE%TYPE,YEAROFRELEAS_ FILMS.YEAROFRELEAS%TYPE)
is
    varible int := 0;
    varible1 int := 0;
    varible2 int := 0;
    varible3 int := 0;
    dat date := TO_DATE('12/12/1941', 'DD/MM/YYYY');
    dat1 date := TO_DATE('12/12/3000', 'DD/MM/YYYY');
begin
    select count(*) INTO VARIBLE from FILMS where FILM_CODE_ = FILMS.FILM_CODE;
    select count(*) INTO VARIBLE1 from FILMS where FILM_ = FILMS.FILM;
    select count(*) INTO VARIBLE2 from DIRECTORS where DIR_CODE_ = DIRECTORS.DIRECTOR_CODE;
    select count(*) INTO varible3 from GENRE where GENRE_CODE_ = GENRE.GENRE_CODE;
    IF varible != 0
        THEN DBMS_OUTPUT.put_line('FILM_CODE_ erro : there is ALREADY THE SAME FILM_CODE');
    ELSIF VARIBLE1 !=0 
        THEN DBMS_OUTPUT.put_line('FILM_ erro : there is ALREADY THE SAME FILM');
    ELSIF varible2 =0
        THEN DBMS_OUTPUT.put_line('DIR_CODE_ ERR : there IS NO SUCH DIRECTOR_CODE');
    ELSIF varible3 =0
        THEN DBMS_OUTPUT.put_line('GENRE_CODE_ ERR : there IS NO SUCH GENRE_CODE_');
    ELSIF DAT >  YEAROFRELEAS_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS LESS THEN 1941');
    ELSIF DAT1 <  YEAROFRELEAS_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS TO HIGH(MORE THEN 3000)');    
        ELSE    
        insert into FILMS(FILM_CODE,FILM, GENRE_CODE,DIRECTOR_CODE,YEAROFRELEAS) 
        VALUES(FILM_CODE_,FILM_,GENRE_CODE_,DIR_CODE_,YEAROFRELEAS_);
        DBMS_OUTPUT.put_line(sqlerrm);
    END IF;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure UpdateFILM(ID_FILM_ FILMS.ID_FILM%TYPE,FILM_ IN FILMS.FILM%TYPE,GENRE_CODE_ FILMS.GENRE_CODE%TYPE,DIR_CODE_ FILMS.DIRECTOR_CODE%TYPE,YEAROFRELEAS_ FILMS.YEAROFRELEAS%TYPE)
is
    varible int := 0;
    varible2 int := 0;
    varible3 int := 0;
    varible4 int := 0; 
begin
    select count(*) INTO VARIBLE2 from DIRECTORS where DIR_CODE_ = DIRECTORS.DIRECTOR_CODE;
    IF varible2 =0
        THEN DBMS_OUTPUT.put_line('DIR_CODE_ ERR : there IS NO SUCH DIRECTOR_CODE');
    ELSIF varible3 !=0
        THEN DBMS_OUTPUT.put_line('GENRE_CODE_ ERR : there IS NO SUCH GENRE_CODE_');
    ELSIF TO_DATE('12/12/1941', 'DD/MM/YYYY') >  YEAROFRELEAS_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS LESS THEN 1941');
    ELSIF TO_DATE('12/12/3000', 'DD/MM/YYYY') <  YEAROFRELEAS_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS TO HIGH(MORE THEN 3000)');    
        ELSE     
        UPDATE FILMS SET
            FILMS.ID_FILM = ID_FILM_,
                    FILMS.FILM = FILM_,
                        FILMS.GENRE_CODE = GENRE_CODE_,
                          FILMS.DIRECTOR_CODE = DIR_CODE_,
                            FILMS.YEAROFRELEAS = YEAROFRELEAS_
                    WHERE   FILMS.ID_FILM = ID_FILM_;           
        DBMS_OUTPUT.put_line('films update successful');
    END IF;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure DeleteFILM(ID_FILM_ FILMS.ID_FILM%TYPE)
is
    varible int := 0;
begin   
    select count(*) INTO varible from FILMS where FILMS.ID_FILM = ID_FILM_;
    if varible =0
        then DBMS_OUTPUT.put_line('THERE IS NO SUCH ID FILM');
    ELSE    
        DELETE FILMS WHERE  FILMS.ID_FILM = ID_FILM_;
        DBMS_OUTPUT.put_line('delete success');
    end if;    
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/                                                                                                                                                                      
create or replace procedure AddNewSession(
    FILM_CODE_ IN SESSIONF.FILM_CODE%TYPE,
    NAMEOFGENRE_ SESSIONF.NAMEOFGENRE%TYPE,
    HALL_CODE_ SESSIONF.HALL_CODE%TYPE,
    ALL_PLACES_ SESSIONF.ALL_PLACES%TYPE,
    NUMBEROFFREEPLACES_ SESSIONF.NUMBEROFFREEPLACES%TYPE,
    COST_ SESSIONF.COST%TYPE,
    DATAOFSESSION_ SESSIONF.DATA_OF_SESSION%TYPE)
is
    varible int := 0;
    varible1 int := 0;
    varible2 int := 0;
    varible3 int := 0;
    varible4 int := 0;
    varible5 int := 0;
    varible6 int := 0;
begin
    select NUMBEROFPLACES INTO varible5 from HALL where HALL_CODE_ = HALL.HALL_CODE;
    select count(*) INTO VARIBLE from FILMS where FILM_CODE_ = FILMS.FILM_CODE;
    select count(*) INTO VARIBLE1 from GENRE where NAMEOFGENRE_ = GENRE.NAMEOFGENRE;
    select count(*) INTO VARIBLE2 from HALL where HALL_CODE_ = HALL.HALL_CODE;
    select count(*) INTO VARIBLE3 from HALL where NUMBEROFFREEPLACES_ > HALL.NUMBEROFPLACES AND HALL_CODE_ = HALL.HALL_CODE OR NUMBEROFFREEPLACES_ = 0 OR NUMBEROFFREEPLACES_ < 0;
    select count(*) INTO VARIBLE4 from SESSIONF where DATAOFSESSION_ = SESSIONF.DATA_OF_SESSION;
    IF VARIBLE = 0
        THEN DBMS_OUTPUT.put_line('FILM_CODE_ erro : there is NO SUCH FILM WITH THIS FILM_CODE_');
    ELSIF VARIBLE1 = 0   
        THEN DBMS_OUTPUT.put_line('NAMEOFGENRE_ erro : there is NO SUCH GENRE WITH THIS NAMEOFGENRE_');
    ELSIF varible5 < ALL_PLACES_   OR ALL_PLACES_ =0
        THEN DBMS_OUTPUT.put_line('ALL_PLACES_ erro : INVALID ALL_PLACES_ INPUT');    
    ELSIF VARIBLE2 = 0   
        THEN DBMS_OUTPUT.put_line('HALL_CODE_ erro : there is NO SUCH HALL WITH THIS HALL_CODE_');
    ELSIF VARIBLE3 != 0   
        THEN DBMS_OUTPUT.put_line('NUMBEROFFREEPLACES_ erro : iINVALID NUMBEROFFREEPLACES_ INPUT(TO HIGH OR TO LOW OR 0');      
    ELSIF COST_ = 0 OR COST_ > 50 OR COST_ < 0   
        THEN DBMS_OUTPUT.put_line('COST_ erro : iINVALID COST_ INPUT(TO HIGH OR TO LOW OR 0');      
    ELSIF TO_DATE('12/12/1941', 'DD/MM/YYYY') >  DATAOFSESSION_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS LESS THEN 1941');
    ELSIF TO_DATE('12/12/3000', 'DD/MM/YYYY') <  DATAOFSESSION_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS TO HIGH(MORE THEN 3000)');           
    ELSE    
        insert into SESSIONF(FILM_CODE,NAMEOFGENRE,HALL_CODE,ALL_PLACES,NUMBEROFFREEPLACES,COST,DATA_OF_SESSION) 
        VALUES(FILM_CODE_,NAMEOFGENRE_,HALL_CODE_,ALL_PLACES_,NUMBEROFFREEPLACES_,COST_,DATAOFSESSION_);
        DBMS_OUTPUT.put_line('aadition success');
    END IF;
    exception
        when others 
        then DBMS_OUTPUT.put_line(sqlerrm);
end;
/                                                                                                                                                 
create or replace procedure UpdateSession(
    ID_SESSION_ SESSIONF.ID_SESSION%TYPE,
    NAMEOFGENRE_ SESSIONF.NAMEOFGENRE%TYPE,
    HALL_CODE_ SESSIONF.HALL_CODE%TYPE,
    ALL_PLACES_ SESSIONF.ALL_PLACES%TYPE,
    NUMBEROFFREEPLACES_ SESSIONF.NUMBEROFFREEPLACES%TYPE,
    COST_ SESSIONF.COST%TYPE,
    DATAOFSESSION_ SESSIONF.DATA_OF_SESSION%TYPE)
is
    varible1 int := 0;
    varible2 int := 0;
    varible3 int := 0;
    varible4 int := 0;
    varible5 int := 0; 
    varible6 int := 0;
begin
    select count(*) INTO varible5 from SESSIONF where SESSIONF.ID_SESSION = ID_SESSION_;
    if varible5 = 0 
        then DBMS_OUTPUT.put_line('ID_SESSION_ erro : INVALID ID_SESSION_ INPUT');
        return;
    end if;    
    select ALL_PLACES INTO varible6 from SESSIONF where SESSIONF.ID_SESSION = ID_SESSION_;
    select count(*) INTO VARIBLE1 from GENRE where NAMEOFGENRE_ = GENRE.NAMEOFGENRE;
    select count(*) INTO VARIBLE2 from HALL where HALL_CODE_ = HALL.HALL_CODE;
    select count(*) INTO VARIBLE3 from HALL where NUMBEROFFREEPLACES_ > HALL.NUMBEROFPLACES AND HALL_CODE_ = HALL.HALL_CODE OR NUMBEROFFREEPLACES_ = 0 OR NUMBEROFFREEPLACES_ < 0;
    select count(*) INTO VARIBLE4 from SESSIONF where DATAOFSESSION_ = SESSIONF.DATA_OF_SESSION;
    IF varible5 = 0
        THEN DBMS_OUTPUT.put_line('ID_SESSION_ erro : there is NO SUCH ESSION WITH THIS ID_SESSION_');
    ELSIF VARIBLE1 = 0   
        THEN DBMS_OUTPUT.put_line('NAMEOFGENRE_ erro : there is NO SUCH GENRE WITH THIS NAMEOFGENRE_');
    ELSIF VARIBLE6 < ALL_PLACES_ OR ALL_PLACES_ = 0
        THEN DBMS_OUTPUT.put_line('ALL_PLACES_ erro : INVALID ALL_PLACES INPUT');
    ELSIF VARIBLE2 = 0   
        THEN DBMS_OUTPUT.put_line('HALL_CODE_ erro : there is NO SUCH HALL WITH THIS HALL_CODE_');
    ELSIF VARIBLE3 != 0   
        THEN DBMS_OUTPUT.put_line('NUMBEROFFREEPLACES_ erro : iINVALID NUMBEROFFREEPLACES_ INPUT(TO HIGH OR TO LOW OR 0');      
    ELSIF COST_ = 0 OR COST_ > 50 OR COST_ < 0   
        THEN DBMS_OUTPUT.put_line('COST_ erro : iINVALID COST_ INPUT(TO HIGH OR TO LOW OR 0');      
    ELSIF TO_DATE('12/12/1941', 'DD/MM/YYYY') >  DATAOFSESSION_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS LESS THEN 1941');
    ELSIF TO_DATE('12/12/3000', 'DD/MM/YYYY') <  DATAOFSESSION_
        THEN DBMS_OUTPUT.put_line('YEAROFRELEAS_ erro : DATE IS TO HIGH(MORE THEN 3000)');            
    ELSE    
        UPDATE SESSIONF SET
            SESSIONF.ID_SESSION = ID_SESSION_,
                    SESSIONF.NAMEOFGENRE = NAMEOFGENRE_,
                        SESSIONF.HALL_CODE = HALL_CODE_,
                          SESSIONF.NUMBEROFFREEPLACES = NUMBEROFFREEPLACES_,
                            SESSIONF.ALL_PLACES = ALL_PLACES_,
                                SESSIONF.COST = COST_,
                                    SESSIONF.DATA_OF_SESSION = DATAOFSESSION_
                    WHERE   SESSIONF.ID_SESSION = ID_SESSION_;
        DBMS_OUTPUT.put_line('update success');
    END IF;
    exception
        when others 
        then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure DeleteSESSION(ID_SESSION_ SESSIONF.ID_SESSION%TYPE)
is
    VARI INT :=0;
begin   
    SELECT COUNT(*) INTO VARI FROM SESSIONF WHERE SESSIONF.ID_SESSION = ID_SESSION_;
    IF VARI =0
        THEN
            DBMS_OUTPUT.put_line('ID_SESSION_ ERRO: THER IS NO SUCH SESSION');
    ELSE
        DELETE SESSIONF WHERE  SESSIONF.ID_SESSION = ID_SESSION_;
     DBMS_OUTPUT.put_line(sqlerrm);
    END IF;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure SearchFilmByDirector(DIRECTOR_CODE_ FILMS.DIRECTOR_CODE%TYPE)
is
    VARIBLE1 FILMS%ROWTYPE; 
    VARIBLE2 DIRECTORS%ROWTYPE;
    VARIBLE6 int :=0;     
    cursor curs is select FILMS.FILM, FILMS.FILM_CODE,FILMS.GENRE_CODE,FILMS.DIRECTOR_CODE,FILMS.YEAROFRELEAS 
        from FILMS 
            where FILMS.DIRECTOR_CODE = DIRECTOR_CODE_;
begin   
    select count(*) INTO VARIBLE6 from FILMS where FILMS.DIRECTOR_CODE = DIRECTOR_CODE_;
    select SURNAME,NAME INTO VARIBLE2.SURNAME,VARIBLE2.NAME from DIRECTORS where DIRECTORS.DIRECTOR_CODE = DIRECTOR_CODE_;
    if VARIBLE6 =0 
        then  DBMS_OUTPUT.put_line('ther is no such DIRECTOR');
    else  
    DBMS_OUTPUT.put_line('DIRECTOR - ' || VARIBLE2.SURNAME  || ' ' || VARIBLE2.NAME || ' HAS SUCH FILMS: ');
        open curs;
    loop 
        fetch curs into VARIBLE1.FILM, VARIBLE1.FILM_CODE,VARIBLE1.GENRE_CODE,VARIBLE1.DIRECTOR_CODE,VARIBLE1.YEAROFRELEAS;
        exit when curs%notfound;
        DBMS_OUTPUT.put_line('film name - ' ||  VARIBLE1.FILM  || ' genre_code ' || VARIBLE1.GENRE_CODE || '  year of releas - ' || VARIBLE1.YEAROFRELEAS);
    end loop;
    close curs;
    end if;
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure SearchFilmById(ID_FILM_ FILMS.ID_FILM%TYPE)
is
    VARIBLE1 FILMS%ROWTYPE; 
    VARIBLE6 int :=0;     
    cursor curs is select FILMS.FILM, FILMS.FILM_CODE,FILMS.GENRE_CODE,FILMS.ID_FILM,FILMS.YEAROFRELEAS 
        from FILMS 
            where FILMS.ID_FILM = ID_FILM_;
begin   
    select count(*) INTO VARIBLE6 from FILMS where FILMS.ID_FILM = ID_FILM_;
    if VARIBLE6 =0 
        then  DBMS_OUTPUT.put_line('ther is no such id_film');
    else  
        open curs;
    loop 
        fetch curs into VARIBLE1.FILM, VARIBLE1.FILM_CODE,VARIBLE1.GENRE_CODE,VARIBLE1.DIRECTOR_CODE,VARIBLE1.YEAROFRELEAS;
        exit when curs%notfound;
        DBMS_OUTPUT.put_line('film name - ' ||  VARIBLE1.FILM || '  film code -  ' || VARIBLE1.FILM_CODE || ' genre_code ' || VARIBLE1.GENRE_CODE  || ' director code - ' || VARIBLE1.DIRECTOR_CODE || ' year of releas - ' || VARIBLE1.YEAROFRELEAS);
    end loop;
    close curs;
    end if;
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure bookingTicket
(CNUMBER_ CLIENTS.CNUMBER%TYPE,NAME_ CLIENTS.NAME%TYPE,ID_SESSION_ SESSIONF.ID_SESSION%TYPE,COUNT_OF_TICKETS_ SESSIONF.NUMBEROFFREEPLACES%TYPE)
is
    vari1 CLIENTS.FILM%TYPE;
    vari2 int :=0;
    vari3 int :=0;
    vari4 int :=0;
begin
    select count(*) INTO VARI2 from SESSIONF WHERE SESSIONF.ID_SESSION = ID_SESSION_;
    IF VARI2 = 0 
        THEN
        DBMS_OUTPUT.put_line('ID_SESSION_ ERRO : THERE IS NO SUCH ID_SESSION');
        RETURN;
    END IF;    
    select FILM_CODE INTO vari4 from SESSIONF WHERE SESSIONF.ID_SESSION = ID_SESSION_;
    select FILMS.FILM INTO vari1 from SESSIONF INNER JOIN FILMS 
        ON SESSIONF.ID_SESSION = ID_SESSION_ AND vari4= FILMS.FILM_CODE;
    select NUMBEROFFREEPLACES INTO vari3 from SESSIONF WHERE SESSIONF.ID_SESSION = ID_SESSION_;
    IF COUNT_OF_TICKETS_ > 5 OR COUNT_OF_TICKETS_ =0 OR    COUNT_OF_TICKETS_ < 0  
        THEN    DBMS_OUTPUT.put_line('INVALID COUNT_OF_TICKETS_ INPUT');
    ELSIF vari3 < COUNT_OF_TICKETS_ 
        THEN    DBMS_OUTPUT.put_line('COUNT_OF_TICKETS_ ERRO : TICKETS ON THIS SESSION - ' || vari3);    
    ELSE    
        INSERT INTO CLIENTS(CNUMBER,NAME,FILM,BOUGHT_TICKETS) VALUES (CNUMBER_,NAME_,vari1,COUNT_OF_TICKETS_);
        UPDATE SESSIONF SET SESSIONF.NUMBEROFFREEPLACES =  SESSIONF.NUMBEROFFREEPLACES - COUNT_OF_TICKETS_ WHERE SESSIONF.ID_SESSION = ID_SESSION_;
        INSERT INTO ORDERS(SESSION_CODE,CLIENTNAME,COUNT_OF_TICKETS) VALUES(ID_SESSION_,NAME_,COUNT_OF_TICKETS_);
        DBMS_OUTPUT.put_line('booking successful');
    END IF;
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure CancelBooking(ID_ORDER_ ORDERS.ID_ORDER%TYPE)
is
    VARI1 INT :=0;
    VARI2 INT :=0;
    VARI3 INT :=0;
    VARI4 INT :=0;
begin
    select count(*) INTO VARI2 from ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
    IF VARI2 =0
        THEN    DBMS_OUTPUT.put_line('ID_ORDER_ ERRO : THERE IS NO SUCH ORDER');
    ELSE    
        SELECT CLIENT_CODE INTO VARI1 FROM ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
        SELECT ORDERS.COUNT_OF_TICKETS INTO VARI3 FROM ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
        SELECT ORDERS.SESSION_CODE INTO VARI4 FROM ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
        UPDATE SESSIONF SET SESSIONF.NUMBEROFFREEPLACES = SESSIONF.NUMBEROFFREEPLACES + VARI3 WHERE SESSIONF.ID_SESSION = VARI4;
        DELETE ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
        DELETE CLIENTS WHERE VARI1 = CLIENTS.ID_CLIENT;
        DBMS_OUTPUT.put_line('CANCEL BOOKING SUCCESSFUL');
        
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure ReportOnMovieRental(FILM_CODE_ SESSIONF.FILM_CODE%TYPE)
is
    VARI1 INT :=0;
    VARI2 FILMS.FILM%TYPE;
    VARI3 NUMBER;
    
begin

    select count(*) INTO VARI1 from SESSIONF WHERE SESSIONF.FILM_CODE = FILM_CODE_;
    IF VARI1 = 0 
        THEN         DBMS_OUTPUT.put_line('FILM_CODE_ ERRO: INVALID FILM_CODE_ INPUT');
        RETURN;
    END IF;    
    select FILM INTO VARI2 FROM FILMS WHERE FILMS.FILM_CODE = FILM_CODE_;

    SELECT SUM((SESSIONF.ALL_PLACES - SESSIONF.NUMBEROFFREEPLACES) * SESSIONF.COST) INTO VARI3 FROM SESSIONF WHERE SESSIONF.FILM_CODE = FILM_CODE_;
    IF VARI1 =0
        THEN    DBMS_OUTPUT.put_line('THERE IS NO SUCH SESSIONS WITH THIS FILM');
    ELSE    
        DBMS_OUTPUT.put_line('FILM - ' || VARI2 || ' HAS ' || VARI1 || ' SESSIONS');
        DBMS_OUTPUT.put_line('ALL INCOME OF THIS FILM HAS - ' || VARI3);
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure ReportOnMoviesAttendance(FILM_CODE_ SESSIONF.FILM_CODE%TYPE)
is
    VARI1 INT :=0;
    VARI2 FILMS.FILM%TYPE;
    VARI3 NUMBER;
begin
    select count(*) INTO VARI1 from SESSIONF WHERE SESSIONF.FILM_CODE = FILM_CODE_;
     IF VARI1 = 0 
        THEN         DBMS_OUTPUT.put_line('FILM_CODE_ ERRO: INVALID FILM_CODE_ INPUT');
        RETURN;
    END IF;    
    select FILM INTO VARI2 FROM FILMS WHERE FILMS.FILM_CODE = FILM_CODE_;
    SELECT SUM((SESSIONF.ALL_PLACES - SESSIONF.NUMBEROFFREEPLACES)) INTO VARI3 FROM SESSIONF WHERE SESSIONF.FILM_CODE = FILM_CODE_;
    IF VARI1 =0
        THEN    DBMS_OUTPUT.put_line('THERE IS NO SUCH SESSIONS WITH THIS FILM');
    ELSE    
        DBMS_OUTPUT.put_line('FILM - ' || VARI2 || ' HAS ' || VARI1 || ' SESSIONS');
        DBMS_OUTPUT.put_line(VARI3 || ' -  TICKETS WERE BOUGHT FOR THIS FILM');
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);
end;
/
create or replace procedure AddNewHall(
    HALL_CODE_  HALL.HALL_CODE%TYPE,
    NAME_ HALL.NAME%TYPE,
    NUMBEROFLINES_ HALL.NUMBEROFLINES%TYPE,
    NUMBEROFPLACES_ HALL.NUMBEROFPLACES%TYPE
    )
is
    vari1 INT :=0;
    vari2 HALL.NAME%TYPE;
BEGIN
    select count(*) INTO vari1 from HALL WHERE HALL.HALL_CODE = HALL_CODE_; 
    select COUNT(*) INTO vari2 from HALL WHERE HALL.NAME = NAME_;
    IF  vari1  != 0 
        THEN DBMS_OUTPUT.put_line('NAME_ ERRO: THERE IS ALREADY THE SAME  NAME');    
        return;
    end if;    
    IF  vari2  != 0
                THEN DBMS_OUTPUT.put_line('HALL_CODE_ erro: there is already the same hall_code');
    ELSIF  NUMBEROFLINES_ > 30 OR NUMBEROFLINES_ = 0 
        THEN DBMS_OUTPUT.put_line('NUMBEROFLINES_ ERRO:INVALID  NUMBEROFLINES_ INPUT( MORE THEN 30 OR 0');    
    ELSIF  NUMBEROFPLACES_> 300 OR NUMBEROFPLACES_ = 0
        THEN DBMS_OUTPUT.put_line('NUMBEROFPLACES_ ERRO: INVALID NUMBEROFPLACES_ INPUT(MORE THEN 300 OR 0)');    
    ELSE
        INSERT INTO HALL(HALL_CODE,NAME,NUMBEROFLINES,NUMBEROFPLACES)
            VALUES (HALL_CODE_,NAME_,NUMBEROFLINES_,NUMBEROFPLACES_);
        DBMS_OUTPUT.put_line(sqlerrm);        
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);    
END;
/

create or replace procedure DeleteHall(
    ID_HALL_  HALL.ID_HALL%TYPE)
IS
VARI1 INT :=0;
BEGIN
    SELECT COUNT(*) INTO VARI1 FROM HALL WHERE HALL.ID_HALL = ID_HALL_;
    IF VARI1=0
        THEN DBMS_OUTPUT.put_line('THERE IS NO SUCH ID HALL');    
    ELSE
        DELETE HALL WHERE HALL.ID_HALL = ID_HALL_;
        DBMS_OUTPUT.put_line(sqlerrm);   
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);   
END;
/
create or replace procedure DeleteOrder(
    ID_ORDER_  ORDERS.ID_ORDER%TYPE)
IS
    VARI1 INT :=0;
BEGIN
    SELECT COUNT(*) INTO VARI1 FROM ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
    IF VARI1=0
        THEN DBMS_OUTPUT.put_line('THERE IS NO SUCH ID ORDER');    
    ELSE
        DELETE ORDERS WHERE ORDERS.ID_ORDER = ID_ORDER_;
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);   
END;
/
create or replace procedure DeleteClientl(
    ID_CLIENT_  CLIENTS.ID_CLIENT%TYPE)
IS
VARI1 INT :=0;
BEGIN
    SELECT COUNT(*) INTO VARI1 FROM CLIENTS WHERE CLIENTS.ID_CLIENT = ID_CLIENT_;
    IF VARI1=0
        THEN DBMS_OUTPUT.put_line('THERE IS NO SUCH ID CLIENT');    
    ELSE
        DELETE CLIENTS WHERE CLIENTS.ID_CLIENT = ID_CLIENT_;
        DBMS_OUTPUT.put_line(sqlerrm);   
    END IF;    
    exception
        when others 
            then DBMS_OUTPUT.put_line(sqlerrm);   
END;
/
GRANT all ON DIRECTORY EXPORTFILE TO Topuser;
/
CREATE DIRECTORY EXPORTFILE AS 'C:/exprotdir';
/
DECLARE
  v_clob CLOB;
  v_clob_length INTEGER;
  pos INTEGER := 1;
  buffer VARCHAR2(32767);
  amount BINARY_INTEGER := 32760;
  prodFeed_file utl_file.file_type;
BEGIN
  prodFeed_file := UTL_FILE.FOPEN ('EXPORTFILE', 'productFeedLargo2.xml', 'w', 32767);
SELECT XMLELEMENT(root,XMLAGG(XMLELEMENT(COUNTRYS,
      XMLATTRIBUTES(
          S.ID_COUNTRY,
          S.NAME,
          S.COUNTRY_CODE)
        ))).getCLOBVal() AS xmlsads
    into v_clob
from COUNTRY S;
  v_clob_length := length(v_clob);

  WHILE pos < v_clob_length LOOP
    dbms_lob.read(v_clob, amount, pos, buffer);
    DBMS_OUTPUT.PUT_LINE(buffer);
    utl_file.put(prodFeed_file , buffer);
    utl_file.fflush(prodFeed_file);
    pos := pos + amount;
  END LOOP;
  utl_file.fclose(prodFeed_file);
END;
/
declare
  file1 utl_file.file_type;
  xrow CLOB;
  v_clob_length INTEGER;
  pos INTEGER := 1;
  buffer VARCHAR2(32767);
  buffer2 VARCHAR2(32767);
  amount BINARY_INTEGER := 32760;
  prodFeed_file utl_file.file_type;
BEGIN
  prodFeed_file := UTL_FILE.FOPEN('EXPORTFILE','productFeedLargo2.XML','r', 32767);
  --utl_file.get_line(prodFeed_file,xrow);
   LOOP
    BEGIN
        utl_file.get_line(prodFeed_file,xrow, amount);
        xrow := xrow || buffer;
        EXCEPTION WHEN No_Data_Found THEN EXIT; END;
    END LOOP;

  merge INTO COUNTRY cur_t USING
  (Select Extractvalue(Value(T),'//@ID_COUNTRY') ID_COUNTRY,
    extractValue(value(t),'//@NAME') NAME,
    Extractvalue(Value(T),'//@COUNTRY_CODE') COUNTRY_CODE
  FROM TABLE(XMLSequence(XMLType(xrow).extract('//COUNTRYS'))) t
  ) imp_t ON (cur_t.ID_COUNTRY=imp_t.ID_COUNTRY)
WHEN NOT matched THEN
  INSERT
    (
          NAME,
          COUNTRY_CODE
          )
    VALUES
    (
       imp_t.NAME,
          imp_t.COUNTRY_CODE
          );  Utl_File.Fclose(File1);
End;