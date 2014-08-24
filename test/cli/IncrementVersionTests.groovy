import grails.test.AbstractCliTestCase
import org.codehaus.groovy.grails.commons.*

class IncrementVersionTests extends AbstractCliTestCase {

    String versionActual
    def grailsApplication = new DefaultGrailsApplication()

    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testIncrementVersion() {

        System.out.println("Version antes de: ${grailsApplication.metadata.'app.version'}")
        execute(["increment-version"])

        System.out.println("Version despues de: ${grailsApplication.metadata.'app.version'}")

        def exitCode = waitForProcess()
        System.out.println("Exit code: ${exitCode}")

        assertEquals 0, exitCode
        verifyHeader()

        // Make sure that the script was found.
        assertFalse "IncrementVersion script not found.", output.contains("Script not found:")

        // Revisar que imprima la version
        assertTrue "Se imprime nueva version", output.contains("Nueva version: ")
    }
}
