package tests;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate runSequential() {
        return Karate.run(

                )
                .tags("@CreateAll", "@GetAll", "@DeleteAll", "@E2E")
                .relativeTo(getClass());
    }
}