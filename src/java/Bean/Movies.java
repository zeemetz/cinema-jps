package Bean;

import java.util.UUID;

public class Movies 
{
    String movieid, moviename, genre, sutradara, company, category, synopsis, image, Note, dataStart, dateEnd;
    int rating, duration;
    UUID uid;

    public Movies(){
        
    }
    public Movies(String moviename, String genre, String sutradara, String company, String category, String synopsis, String image, String Note, String dataStart, String dateEnd, int rating, int duration) {
        this.movieid = getUUID();
        this.moviename = moviename;
        this.genre = genre;
        this.sutradara = sutradara;
        this.company = company;
        this.category = category;
        this.synopsis = synopsis;
        this.image = image;
        this.Note = Note;
        this.dataStart = dataStart;
        this.dateEnd = dateEnd;
        this.rating = rating;
        this.duration = duration;
    }

    public String getUUID(){
        uid = UUID.fromString("38400000-8cf0-11bd-b23e-10b96e4ef00d");
        return uid.randomUUID().toString();
    }
    
    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDataStart() {
        return dataStart;
    }

    public void setDataStart(String dataStart) {
        this.dataStart = dataStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMovieid() {
        return movieid;
    }

    public void setMovieid(String movieid) {
        this.movieid = movieid;
    }

    public String getMoviename() {
        return moviename;
    }

    public void setMoviename(String moviename) {
        this.moviename = moviename;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getSutradara() {
        return sutradara;
    }

    public void setSutradara(String sutradara) {
        this.sutradara = sutradara;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }
    
}
