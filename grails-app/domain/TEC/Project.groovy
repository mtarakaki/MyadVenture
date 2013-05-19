package TEC

class Project {
    String name
    String description
    Profile admin
    
    //String logoUri
    //Date dateOfIncorporation
    //Date dateCreated
    
    String videourl
    String images
    String credits
    String comments
    
    BigDecimal ratings
    BigDecimal funding
    /*
    Float ratings
    Float funding
    */
    
    static hasMany = [filledRoles:Role, availableRoles:Role, blogs:Blog]

    static constraints = {
	name (blank:false, nullable:false)
	description (blank:false, nullable:false)
        ratings(scale: 1, min: 0.0, max: 4.0)
        funding(scale: 2, min: 0.00, max: 100000.00)
        //logoUri (url:true,nullable:true, blank:true)
        //dateOfIncorporation()
        
        /*
        funding(nullable:false)
        ratings(nullable:false)
        */
        videourl()
        images()
        credits()
        comments()
        
        
    }

    static mapping = {
        //ratings defaultValue: 0 as BigDecimal
        //funding defaultValue: 0 as BigDecimal
availableRoles cascade: "all-delete-orphan"
        blogs cascade: "all-delete-orphan"
    }
}
