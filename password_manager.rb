#User needs a program that can store and return their passwords. Will store the service + passwords as key-value pairs in a hash.
#Like this :service => password
#Will need to access this hash to add + return values from/to the user.

class PasswordManager
    #We need to automatically create an empty array when an instance of PasswordManager is created.
    def initialize
        @accounts = {}
    end

    #User needs the ability to add a new entry to the PWManager, with 2 strings as input. 1 for the service, 1 for the password.
    #The password must be validated (>7 chars + include special char) to be added.
    def add(service, password)
        if password.length >= 8 && password.count("!@$%&") > 0 then @accounts[service] = password
        puts 'Password added for: ' + service
        end
    end

    #User needs the ability to retrieve passwords for a given service on demand. 1 string as input, name of the service.
    def password_for(service)
        retrieve = @accounts[service]
        puts 'Password for ' + service + ' is: ' + retrieve.to_s
        return retrieve
    end

    #User needs visibility of all currently stored services/passwords.
    def services
        puts 'Passwords are currently stored for: ' + @accounts.keys.to_s
        return @accounts.keys
    end
end

#Examples
#We need to create an instance of the PWManager to actually use it.
pw_manager = PasswordManager.new

#This will add a service/password to the PWManager
pw_manager.add('test', '1234hello!')

#This password will be rejected
pw_manager.add('test2', '1234')

#This will return a list of all services with passwords stored.
pw_manager.services

#This will return the password for only the given service.
pw_manager.password_for('test')
