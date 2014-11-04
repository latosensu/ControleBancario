package br.ufscar.dc.dsw



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContaClienteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ContaCliente.list(params), model:[contaClienteInstanceCount: ContaCliente.count()]
    }

    def show(ContaCliente contaClienteInstance) {
        respond contaClienteInstance
    }

    def create() {
        respond new ContaCliente(params)
    }

    @Transactional
    def save(ContaCliente contaClienteInstance) {
        if (contaClienteInstance == null) {
            notFound()
            return
        }

        if (contaClienteInstance.hasErrors()) {
            respond contaClienteInstance.errors, view:'create'
            return
        }

        contaClienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contaCliente.label', default: 'ContaCliente'), contaClienteInstance.id])
                redirect contaClienteInstance
            }
            '*' { respond contaClienteInstance, [status: CREATED] }
        }
    }

    def edit(ContaCliente contaClienteInstance) {
        respond contaClienteInstance
    }

    @Transactional
    def update(ContaCliente contaClienteInstance) {
        if (contaClienteInstance == null) {
            notFound()
            return
        }

        if (contaClienteInstance.hasErrors()) {
            respond contaClienteInstance.errors, view:'edit'
            return
        }

        contaClienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ContaCliente.label', default: 'ContaCliente'), contaClienteInstance.id])
                redirect contaClienteInstance
            }
            '*'{ respond contaClienteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ContaCliente contaClienteInstance) {

        if (contaClienteInstance == null) {
            notFound()
            return
        }

        contaClienteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ContaCliente.label', default: 'ContaCliente'), contaClienteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contaCliente.label', default: 'ContaCliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
