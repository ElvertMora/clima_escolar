<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>titulo</title>

    </head>
    <body>
        <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="page-body" role="main">

                        <!--<ul>
                                <li class="controller"><g:link controller="login">Abrir sesión</g:link></li>
                        </ul>-->
            <div  class="content">
                <form action='/Clima/j_spring_security_check' method='POST' id='loginForm' class="unal-form" autocomplete='off'>
                <div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'dane', 'error')} required">
                    <label for='username'>Username:</label>
                    <input type='text' class='text_' name='j_username' id='username'/>
                </div>
                <div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'dane', 'error')} required">
                    <label for='password'>Password:</label>
                    <input type='password' class='text_' name='j_password' id='password'/>
                </div>
                <div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'dane', 'error')} required">
                    <label for='remember_me'>Remember me</label>
                    <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me' />
                </div>
                <div class="buttons">
                    <input type='submit' id="submit" value='Login'/>
                </div>
            </form>
            </div>
            
        </div>
    </body>
</html>
