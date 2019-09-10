/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean;

/**
 *
 * @author Kelvin
 */
public class Location {
    String locationId, locationName, locationAddress;

    public Location() {
    }

    public Location(String locationId, String locationName, String locationAddress) {
        this.locationId = locationId;
        this.locationName = locationName;
        this.locationAddress = locationAddress;
    }
    
    public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getLocationAddress() {
        return locationAddress;
    }

    public void setLocationAddress(String locationAddress) {
        this.locationAddress = locationAddress;
    }
}
