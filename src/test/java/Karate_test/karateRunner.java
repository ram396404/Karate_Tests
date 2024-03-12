package Karate_test;

import com.intuit.karate.junit5.Karate;

public class karateRunner {
    @Karate.Test
    Karate runSequential() {
        return Karate.run(

                )
                .tags("@full")
                .relativeTo(getClass());
    }
}



