package TEC

class Project {
    String name
    String description
    Profile admin
    
    String logoUri
    Date dateOfIncorporation
    Date dateCreated
    /*
    String videourl
    String images
    String credits
    String comments
    Float ratings
    Float funding
    */
    
    static hasMany = [filledRoles:Role, availableRoles:Role, blogs:Blog]

    static constraints = {
	name (blank:false, nullable:false)
	description (blank:false, nullable:false)
        logoUri (url:true,nullable:true)
        dateOfIncorporation()
        
        /*
        funding(nullable:false)
        ratings(nullable:false)
        videourl(url:true,nullable:true)
        images(nullable:true)
        credits(nullable:true)
        comments(nullable:true)
        */
        
    }

    static mapping = {

availableRoles cascade: "all-delete-orphan"
        blogs cascade: "all-delete-orphan"
    }
}
