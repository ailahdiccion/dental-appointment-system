package CsdHome;

import java.io.Serializable;
import java.time.LocalDate;

public class Appointment implements Serializable {
    private String userId;
    private String treatment;
    private LocalDate date;
    private String timeSlot;

    public Appointment() {}

    public String getTreatment() { return treatment; }
    public LocalDate getDate() { return date; }
    public String getTimeSlot() { return timeSlot; }
    public String getUserId() { return userId; }

    public void setUserId(String userId) { this.userId = userId; }
    public void setTreatment(String treatment) { this.treatment = treatment; }
    public void setDate(LocalDate date) { this.date = date; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }
}
