package TEC

class Image {
    
    String imageUri
    String description

    static constraints = {
        imageUri (blank:false, nullable:false)
	description (blank:true, nullable:true)
    }
}
