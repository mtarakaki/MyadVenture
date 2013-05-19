package TEC

import org.springframework.dao.DataIntegrityViolationException

class ProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    def list() {
        
        def profileInstance = Profile.get(session?.user?.id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile')])
            redirect(action: "allprojects")
            return
        }
        
        def projectCriteria = Project.createCriteria()
        def projectList = projectCriteria.list(){
            projections {
                property('id')
                property('name')
                property('description')
                property('ratings')
                property('funding')
                property('videourl')
                property('images')
                property('credits')
                property('comments')
                /*
                property('ratings')
                property('videourl')
                property('images')
                property('credits')
                property('comments')
                property('funding')
                */
            }
            order("name", "asc")
            eq("admin", profileInstance)
        }
        
        def projectCount = projectList.size()		
	
        [projectInstanceList: projectList, projectInstanceTotal: projectCount]
        
    }

    def allprojects(){
        
        def projectCriteria = Project.createCriteria()
        def projectList = projectCriteria.list(){
            projections {
                property('id')
                property('name')
                property('description')
                property('ratings')
                property('funding')
                property('videourl')
                property('images')
                property('credits')
                property('comments')
                /*
                property('ratings')
                property('videourl')
                property('images')
                property('credits')
                property('comments')
                property('funding')
                */
            }
            order("name", "asc")
        }
        
        def projectCount = projectList.size()		
	
        [projectInstanceList: projectList, projectInstanceTotal: projectCount]
        
    }
    
    def create() {
        [projectInstance: new Project(params)]
    }
    
    def save() {
        
        def projectInstance = new Project(params)
        projectInstance.admin = session?.user
            
        if (!projectInstance.save(flush: true)) {
            println("IN HERE!")
            println(params)
            redirect(action: "list")
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
        redirect(action: "list")
        
    }

    def show(Long id) {
        
        def projectInstance = Project.get(id)

        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "create", params: params)
            return
        }

        def blogCriteria = Blog.createCriteria()
        def blogList = blogCriteria.list(max: 10, offset: params.offset){
            or{
                eq("type", "Project")
                eq("type", "Idea")
            }
            eq("creator", projectInstance)
            order("lastUpdated", "desc")
        }
        def blogCount = blogList.getTotalCount()
        
        //find all the available roles in the Project
        //by looking through all the Projects, finding availableRoles
        def roleCriteria = Project.createCriteria()
        def roleList = roleCriteria.list{
            availableRoles {
            }
        }
        
        

        println "Available Roles: "
        println roleList
        def roleCount = roleList.size()
        println roleCount
        
        session.projectInstance = projectInstance


        [blogs: blogList, blogCount: blogCount, projectInstance: projectInstance]
        
    } 

        
    def edit(Long id) {
        
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        [projectInstance: projectInstance]
        
    }

    def update(Long id, Long version) {
        
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectInstance.version > version) {
                projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'project.label', default: 'Project')] as Object[],
                          "Another user has updated this Project while you were editing")
                render(view: "edit", model: [projectInstance: projectInstance])
                return
            }
        }

        projectInstance.properties = params

        if (!projectInstance.save(flush: true)) {
            render(view: "edit", model: [projectInstance: projectInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
        redirect(action: "show", id: projectInstance.id)
        
    }

    def delete(Long id) {
        def projectInstance = Project.get(id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
            return
        }

        try {
            projectInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
            redirect(action: "show", id: id)
        }
    }
}
