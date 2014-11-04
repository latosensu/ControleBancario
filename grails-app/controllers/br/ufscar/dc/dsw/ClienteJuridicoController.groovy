package br.ufscar.dc.dsw


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClienteJuridicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClienteJuridico.list(params), model: [clienteJuridicoInstanceCount: ClienteJuridico.count()]
    }

    def show(ClienteJuridico clienteJuridicoInstance) {
        respond clienteJuridicoInstance
    }

    def create() {
        respond new ClienteJuridico(params)
    }

    @Transactional
    def save(ClienteJuridico clienteJuridicoInstance) {
        if (clienteJuridicoInstance == null) {
            notFound()
            return
        }

        if (clienteJuridicoInstance.hasErrors()) {
            respond clienteJuridicoInstance.errors, view: 'create'
            return
        }

        clienteJuridicoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clienteJuridico.label', default: 'ClienteJuridico'), clienteJuridicoInstance.id])
                redirect clienteJuridicoInstance
            }
            '*' { respond clienteJuridicoInstance, [status: CREATED] }
        }
    }

    def edit(ClienteJuridico clienteJuridicoInstance) {
        respond clienteJuridicoInstance
    }

    @Transactional
    def update(ClienteJuridico clienteJuridicoInstance) {
        if (clienteJuridicoInstance == null) {
            notFound()
            return
        }

        if (clienteJuridicoInstance.hasErrors()) {
            respond clienteJuridicoInstance.errors, view: 'edit'
            return
        }

        clienteJuridicoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClienteJuridico.label', default: 'ClienteJuridico'), clienteJuridicoInstance.id])
                redirect clienteJuridicoInstance
            }
            '*' { respond clienteJuridicoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClienteJuridico clienteJuridicoInstance) {

        if (clienteJuridicoInstance == null) {
            notFound()
            return
        }

        clienteJuridicoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClienteJuridico.label', default: 'ClienteJuridico'), clienteJuridicoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clienteJuridico.label', default: 'ClienteJuridico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
