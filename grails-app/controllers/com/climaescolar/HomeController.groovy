package com.climaescolar
import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['permitAll'])
class HomeController {

  def springSecurityService
  
  def index = {
    session.getId()
    def view = 'index'
    if(SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')){
      view = 'indexAdmin'
    } else if(SpringSecurityUtils.ifAllGranted('ROLE_ANALISTA')){
      view = 'indexAnalista'
    } else if(SpringSecurityUtils.ifAllGranted('ROLE_CORDINADOR')) {
      view = 'indexCordinador'
    } else if(SpringSecurityUtils.ifAllGranted('ROLE_OPERARIO')) {
      view = 'indexOperario'
    }
    render(view: view)
  }
}
