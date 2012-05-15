class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable, :trackable, :timeoutable
  before_save :ldap_update_user, :on => :create


  has_many :questions, :foreign_key => 'creator_id'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username
  # attr_accessible :title, :body
  

  def ldap_update_user
    if self.employee_number.nil?
      # ldap connect
      umsconn = LDAP::SSLConn.new('namea.its.maine.edu', LDAP::LDAPS_PORT)
      umsconn.bind("cn=UMA People Search, ou=Specials, dc=maine, dc=edu","0nt3ryok",LDAP::LDAP_AUTH_SIMPLE)
      begin
        umsconn.search2(
          'ou=People,dc=maine,dc=edu', LDAP::LDAP_SCOPE_SUBTREE,
            '(&
              (objectClass=person)
              (mainePersonType=primary)
              (uid=' + self.username + ')
            )',
            ['employeeNumber','mail']
          ) { |entry|
            # populate user attributes
            self.employee_number  = entry['employeeNumber'][0]
            self.email    = entry['mail'][0]

            #logger.debug "\n\n\n\n\n#{self.roles.count}\n\n\n\n\n\n\n"
          # fix employee_number anomalies
          case self.employee_number
            when Float    then self.employee_number = self.employee_number.to_int.to_s
            when Integer  then self.employee_number = self.employee_number.to_s
          end

          while self.employee_number.length < 7
            self.employee_number = '0' + self.employee_number
          end
        } # end |entry| block

        self.save
        User.reset_column_information

        rescue LDAP::ResultError
          umsconn.perror("search")
      end # begin umsconn.search2(...)
      umsconn.unbind
    end # if self.employee_number.nil?
  end


end
