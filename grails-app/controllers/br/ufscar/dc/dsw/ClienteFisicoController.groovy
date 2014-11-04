package br.ufscar.dc.dsw


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClienteFisicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClienteFisico.list(params), model: [clienteFisicoInstanceCount: ClienteFisico.count()]
    }

    def show(ClienteFisico clienteFisicoInstance) {
        respond clienteFisicoInstance
    }

    def create() {
        respond new ClienteFisico(params)
    }

    @Transactional
    def save(ClienteFisico clienteFisicoInstance) {
        if (clienteFisicoInstance == null) {
            notFound()
            return
        }

        if (clienteFisicoInstance.hasErrors()) {
            respond clienteFisicoInstance.errors, view: 'create'
            return
        }

        clienteFisicoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clienteFisico.label', default: 'ClienteFisico'), clienteFisicoInstance.id])
                redirect clienteFisicoInstance
            }
            '*' { respond clienteFisicoInstance, [status: CREATED] }
        }
    }

    def edit(ClienteFisico clienteFisicoInstance) {
        respond clienteFisicoInstance
    }

    @Transactional
    def update(ClienteFisico clienteFisicoInstance) {
        if (clienteFisicoInstance == null) {
            notFound()
            return
        }

        if (clienteFisicoInstance.hasErrors()) {
            respond clienteFisicoInstance.errors, view: 'edit'
            return
        }

        clienteFisicoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClienteFisico.label', default: 'ClienteFisico'), clienteFisicoInstance.id])
                redirect clienteFisicoInstance
            }
            '*' { respond clienteFisicoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClienteFisico clienteFisicoInstance) {

        if (clienteFisicoInstance == null) {
            notFound()
            return
        }

        clienteFisicoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClienteFisico.label', default: 'ClienteFisico'), clienteFisicoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clienteFisico.label', default: 'ClienteFisico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
