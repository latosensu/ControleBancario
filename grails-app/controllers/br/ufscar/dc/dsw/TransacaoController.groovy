package br.ufscar.dc.dsw


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TransacaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Transacao.list(params), model: [transacaoInstanceCount: Transacao.count()]
    }

    def show(Transacao transacaoInstance) {
        respond transacaoInstance
    }

    def create() {
        respond new Transacao(params)
    }

    @Transactional
    def save(Transacao transacaoInstance) {
        if (transacaoInstance == null) {
            notFound()
            return
        }

        if (transacaoInstance.hasErrors()) {
            respond transacaoInstance.errors, view: 'create'
            return
        }

        transacaoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transacao.label', default: 'Transacao'), transacaoInstance.id])
                redirect transacaoInstance
            }
            '*' { respond transacaoInstance, [status: CREATED] }
        }
    }

    def edit(Transacao transacaoInstance) {
        respond transacaoInstance
    }

    @Transactional
    def update(Transacao transacaoInstance) {
        if (transacaoInstance == null) {
            notFound()
            return
        }

        if (transacaoInstance.hasErrors()) {
            respond transacaoInstance.errors, view: 'edit'
            return
        }

        transacaoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Transacao.label', default: 'Transacao'), transacaoInstance.id])
                redirect transacaoInstance
            }
            '*' { respond transacaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Transacao transacaoInstance) {

        if (transacaoInstance == null) {
            notFound()
            return
        }

        transacaoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Transacao.label', default: 'Transacao'), transacaoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transacao.label', default: 'Transacao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
