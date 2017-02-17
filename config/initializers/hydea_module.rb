module Hydea 

  module Haka
    SAML_NAME_IDENTIFIER_FORMAT         = ENV.fetch('SAML_NAME_IDENTIFIER_FORMAT')
    SAML_IDP_SSO_TARGET_URL             = ENV.fetch("SAML_IDP_SSO_TARGET_URL")
    SAML_IDP_ENTITY_ID                  = ENV.fetch("SAML_IDP_ENTITY_ID")
    SAML_IDP_CERT_FINGERPRINT           = ENV.fetch("SAML_IDP_CERT_FINGERPRINT")
    SAML_IDP_CERT                       = ENV.fetch("SAML_IDP_CERT")

    SAML_ASSERTION_CONSUMER_SERVICE_URL = ENV.fetch("SAML_ASSERTION_CONSUMER_SERVICE_URL")

     SAML_MY_ENTITY_ID                   = ENV.fetch("SAML_MY_ENTITY_ID")
     SAML_MY_CERT                        = ENV.fetch("SAML_MY_CERT")
     SAML_MY_PRIVATE_KEY                 = ENV.fetch("SAML_MY_PRIVATE_KEY")


     HAKA_PERSONALUNIQUECODE             = ENV.fetch("HAKA_PERSONALUNIQUECODE")
     HAKA_MAIL                           = ENV.fetch("HAKA_MAIL")
     HAKA_DISPLAYNAME                    = ENV.fetch("HAKA_DISPLAYNAME")
     HAKA_HOMEORGANIZATION               = ENV.fetch("HAKA_HOMEORGANIZATION")


     def create_user(user, response)
      user = User.new
      user.moderator = false
      user.admin = false
      user.name = response.attributes[Hydea::Haka::HAKA_DISPLAYNAME]
      user.email = response.attributes[Hydea::Haka::HAKA_MAIL]
      user.title = ''
      user.persistent_id = response.attributes[Hydea::Haka::HAKA_PERSONALUNIQUECODE]
      user.save

      
      return user.id

     end
     module_function :create_user
     
     def update_user(user, response)
        #Päivitetään tarvittaessa lokaalit tiedot Hakasta saaduilla tiedoilla
      if (user.email != response.attributes[Hydea::Haka::HAKA_MAIL] || 
          user.name != response.attributes[Hydea::Haka::HAKA_DISPLAYNAME])

        user.email = response.attributes[Hydea::Haka::HAKA_MAIL]
        user.name = response.attributes[Hydea::Haka::HAKA_DISPLAYNAME]
        user.save        

      end

     end
     module_function :update_user


     
  end  

end