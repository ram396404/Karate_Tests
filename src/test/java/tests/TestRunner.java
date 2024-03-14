package tests;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate runSequential() {
        return Karate.run(

                )
                .tags("@Full")
                .relativeTo(getClass());
    }
}