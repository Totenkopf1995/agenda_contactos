  #Un programa que cree una agenda de contactos, que permita al usuario agregar, editar, eliminar y buscar contactos, y guardarlos en un archivo.
  
require 'colorize'
require 'colorized_string'
  
module Agenda
  
  class Main
    def initialize(respuesta)
      @respuesta = respuesta
    end
    def self.pregunta
      puts
      puts "Agenda Contactos".center(50, "-").green.on_white.bold
      puts
      puts "Quieres:".blue.on_white.bold
      lista = [
      'agregar(ag)', 
      'editar(ed)', 
      'eliminar(el)',
      'buscar(bu)'
      ]
      lista.each do |list|
        sleep 2
        puts
        print list.center(50, " ").yellow.on_white
        sleep 2
        puts
      end
      puts
      print ' => '.red.on_white
      @respuesta = gets.strip.downcase
      
    end
  end
  
  class Respuesta < Main
    
    def self.validar
      
      case @respuesta
      when 'ag'
        send(:agregar)
      when 'ed'
        send(:editar)
      when 'el'
        send(:eliminar)
      when 'bu'
        send(:buscar)
      else
        puts "No es valida la respuesta"
      end
    end
  end
  
  class Contactos < Respuesta
    
    def self.agregar
      puts 'agregar'
    end
    def self.editar
      puts 'editar'
    end
    def self.eliminar
      puts 'eliminar'
    end
    def self.buscar
      puts 'buscar'
    end
  end
  
  class Archivo < Contactos
    
    def self.crear
      
    end
    def self.guardar
      
    end
    def self.muestra
      
    end
  end
end

Agenda::Main.pregunta