package TEC

class Image {
    
    String imageUri
    String description

    static constraints = {
        imageUri (nullable:true)
	description (nullable:true)
    }
}
