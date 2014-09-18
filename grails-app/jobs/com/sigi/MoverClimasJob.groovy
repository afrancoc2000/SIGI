package com.sigi



class MoverClimasJob {
    static triggers = {
        cron name: 'cronTrigger', startDelay: 0, cronExpression: '0/5 * * * * ?'
    }

    def execute() {

        def climas = Clima.findAll()

        for(clima in climas){
            double radio = 0.0005
            double angulo = 2 * Math.PI * Math.random()

            clima.latitud += radio * Math.sin(angulo)
            clima.longitud += radio * Math.cos(angulo)

            clima.save(flush: true)
        }
    }
}
