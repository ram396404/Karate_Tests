package org.example.javautils;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;

public class JavaUtils {

    private static Random random = new Random();

    public static String getCurrentTime() {
        return LocalTime.now().toString();
    }

    public static String getCurrentDate() {
        return LocalDate.now().toString();
    }

    public static String getRandomDigit() { return String.valueOf(random.nextInt(10));
    }
}
