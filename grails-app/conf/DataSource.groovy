dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.postgresql.Driver"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/sigiDevDB"
            username = "sigi_admin_user"
            password = "SebasJuandaAna12345"
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            dialect = org.hibernate.dialect.PostgreSQLDialect
    
            uri = new URI(System.env.DATABASE_URL?:"postgres://sigi_admin_user:SebasJuandaAna12345@localhost/sigiDevDB")
    
            url = "jdbc:postgresql://"+uri.host+uri.path
            username = uri.userInfo.split(":")[0]
            password = uri.userInfo.split(":")[1]
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            dialect = org.hibernate.dialect.PostgreSQLDialect
    
            uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")
    
            url = "jdbc:postgresql://"+uri.host+uri.path
            username = uri.userInfo.split(":")[0]
            password = uri.userInfo.split(":")[1]
        }
    }
}
