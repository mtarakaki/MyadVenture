package TEC

class Venture {
    String name
    String description
    Profile admin
    String logoUri
    Date dateOfIncorporation
    Date dateCreated

    static hasMany = [filledRoles:Role, availableRoles:Role, blogs:Blog]

    static constraints = {
	name (blank:false, nullable:false, unique: true)
	description (blank:false, nullable:false)
        logoUri (url:true,nullable:true)
        dateOfIncorporation()
    }

    static mapping = {

availableRoles cascade: "all-delete-orphan"
        blogs cascade: "all-delete-orphan"
    }
}
