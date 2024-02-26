#Un programa que cree una agenda de contactos, que permita al usuario agregar, editar, eliminar y buscar contactos, y guardarlos en un archivo.
  
require 'colorize'
require 'colorized_string'
  
module Agenda
  
  class Main
    def self.pregunta
      puts
      puts "Agenda Contactos".center(50, "-").green.bold.on_black
      puts
      puts "Quieres:".blue.bold.underline.on_black
      lista = [
      'agregar(ag)', 
      'editar(ed)', 
      'eliminar(el)',
      'buscar(bu)'
      ]
      lista.each do |list|
        sleep 1
        puts
        print list.center(50, " ").yellow.on_black
        sleep 1
        puts
      end
      puts
      print ' => '.red.on_black
      respuesta = gets.strip.downcase
      Respuesta.validar(respuesta)
    end
  end
  
  class Respuesta
    
    def self.validar(respuesta)
      
      case respuesta
      when 'ag'
        Contactos.agregar
      when 'ed'
        Contactos.editar
      when 'el'
        Contactos.eliminar
      when 'bu'
        Contactos.buscar
      else
        puts "No es valida la respuesta"
      end
    end
  end
  
  class Contactos
    
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