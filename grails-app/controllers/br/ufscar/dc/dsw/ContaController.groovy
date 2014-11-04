package br.ufscar.dc.dsw


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Conta.list(params), model: [contaInstanceCount: Conta.count()]
    }

    def show(Conta contaInstance) {
        respond contaInstance
    }

    def create() {
        respond new Conta(params)
    }

    @Transactional
    def save(Conta contaInstance) {
        if (contaInstance == null) {
            notFound()
            return
        }

        if (contaInstance.hasErrors()) {
            respond contaInstance.errors, view: 'create'
            return
        }

        contaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conta.label', default: 'Conta'), contaInstance.id])
                redirect contaInstance
            }
            '*' { respond contaInstance, [status: CREATED] }
        }
    }

    def edit(Conta contaInstance) {
        respond contaInstance
    }

    @Transactional
    def update(Conta contaInstance) {
        if (contaInstance == null) {
            notFound()
            return
        }

        if (contaInstance.hasErrors()) {
            respond contaInstance.errors, view: 'edit'
            return
        }

        contaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Conta.label', default: 'Conta'), contaInstance.id])
                redirect contaInstance
            }
            '*' { respond contaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Conta contaInstance) {

        if (contaInstance == null) {
            notFound()
            return
        }

        contaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Conta.label', default: 'Conta'), contaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conta.label', default: 'Conta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def listarContasComSaldoPositivo(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        def consulta = Conta.where {
            ge('saldo', 200)
        }
        respond consulta.list(params), view: 'index', model: [contaInstanceCount: consulta.size()]

    }

    def listarContasComSaldoSuperiorA(double valorSaldo, Integer max) {
        valorSaldo = valorSaldo?(valorSaldo>0?valorSaldo:0):0
        params.max = Math.min(max ?: 10, 100)
        def consulta = Conta.where {
            ge('saldo', valorSaldo)
        }
        respond consulta.list(params), view: 'index', model: [contaInstanceCount: consulta.size(), valorSaldo: valorSaldo]
    }
}
