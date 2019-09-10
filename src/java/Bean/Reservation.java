/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.io.Serializable;

/**
 *
 * @author prk
 */
public class Reservation implements Serializable
{
    String reservationId, movieid;

    public Reservation()
    {
        
    }
    
    public Reservation(String reservationId, char row, int seat, String movieid) {
        this.reservationId = reservationId;
        this.row = row;
        this.seat = seat;
        this.movieid = movieid;
    }

    public String getMovieid() {
        return movieid;
    }

    public void setMovieid(String movieId) {
        this.movieid = movieId;
    }
    
    char row;
    int seat;

    public char getRow() {
        return row;
    }

    public void setRow(char row) {
        this.row = row;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }
    public String getReservationId() {
        return reservationId;
    }

    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }
}
