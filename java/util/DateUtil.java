/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class DateUtil {

    public static String validateUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            return "Username is required.";
        }
        if (username.length() < 5 || username.length() > 20) {
            return "Username must be between 5 and 20 characters.";
        }
        return null;
    }

    public static String validatePassword(String password) {
        if (password == null || password.trim().isEmpty()) {
            return "Password is required.";
        }
        if (password.length() < 6) {
            return "Password must be at least 6 characters.";
        }
        return null;
    }

    public static Date validateAndConvertDOB(String dob_raw) {
        if (dob_raw == null || dob_raw.trim().isEmpty()) {
            return null;
        }

        try {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate dob = LocalDate.parse(dob_raw, formatter);

            LocalDate today = LocalDate.now();
            LocalDate minDate = LocalDate.of(1990, 1, 1);

            if (dob.isBefore(minDate) || dob.isAfter(today)) {
                return null;
            }

            return Date.valueOf(dob);
        } catch (DateTimeParseException e) {
            return null;
        }
    }
}
