package TEC

class Venture {
    String name
    String description
    Profile admin
    String logoUri
    Date dateOfIncorporation
    Date dateCreated

    static hasMany = [roles:Role, blogs:Blog]

    String toString(){
        return (this.name)
    }
    
    static constraints = {
	name (blank:false, nullable:false, unique: true)
	description (blank:false, nullable:false)
        logoUri (url:true,nullable:true)
        dateOfIncorporation()
    }

    static mapping = {
        roles cascade: "all-delete-orphan"
        blogs cascade: "all-delete-orphan"
    }
}
