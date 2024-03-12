package Karate_test;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class karateRunner {
    @Karate.Test
    Karate runSequential() {
        return Karate.run(
                        "Create.feature",
                        "Get.feature",
                        "Delete.feature"
                )
                .tags("@Karate_test")
                .relativeTo(getClass());
    }
}



