/*-------------------------------------------------------------------------+
|                                                                          |
| Copyright (c) 2009-2018 CQSE GmbH                                        |
|                                                                          |
+-------------------------------------------------------------------------*/
package bachelor_thesis.main;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import bachelor_thesis.util.NumberFormatUtils;

/**
 * 
 */
public class WordlistGenerator {
	/**  */
	private static final double MAX_VALUE = 99999999999999999999.0;
	/**  */
	private static final String HOME_GA58LUM_WORDLIST_TXT = "/mnt/nextcloud/wordlist.txt";

	public static void main(String[] args) {
		try {
			long startTime = System.currentTimeMillis();

			new File(HOME_GA58LUM_WORDLIST_TXT).delete();
			new File(HOME_GA58LUM_WORDLIST_TXT).createNewFile();

			for (double i = 0; i < MAX_VALUE; i++) {
				Files.write(Paths.get(HOME_GA58LUM_WORDLIST_TXT), (String.format("%020d", (long) i) + "\n").getBytes(),
						StandardOpenOption.APPEND);

				if (i % 100000 == 0) {
					double ratio = MAX_VALUE / i;
					long timeElapsed = System.currentTimeMillis() - startTime;

					System.out.println("Finished: " + i);
					System.out.println("Elapsed time: " + NumberFormatUtils.time(timeElapsed));
					System.out.println(
							"Remaining time: " + NumberFormatUtils.time((long) (ratio * timeElapsed - timeElapsed)));
					System.out.println();

				}
			}

			System.out.println("Terminated successful");
		} catch (IOException e) {
			System.out.println("Terminated with failure");
		}
	}
}