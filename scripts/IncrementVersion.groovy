includeTargets << grailsScript("_GrailsInit")

target(incrementVersion: "Se incrementa la version de la app") {
    def versionActual = metadata.'app.version'
    def versiones = versionActual.tokenize(".")
    def verLength = versiones.size()

    def nuevaVersion = "${verLength >= 1 ? versiones[0] : 0}." + 
    				   "${verLength >= 2 ? versiones[1] : 0}." + 
    				   "${verLength >= 3 ? versiones[2].toInteger() + 1 : 1}"

    metadata.'app.version' = (String)nuevaVersion
    metadata.persist()
    System.out.println("Nueva version: ${nuevaVersion}")
}

setDefaultTarget(incrementVersion)
