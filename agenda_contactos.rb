#Un programa que cree una agenda de contactos, que permita al usuario agregar, editar, eliminar y buscar contactos, y guardarlos en un archivo.
  
require 'colorize'
require 'colorized_string'
  
module Agenda

  class Main
    # clase main se pregunta al usuario que desea realizar
    puts
    puts "Agenda Contactos".center(50, "-").green.bold.on_black
    puts
    
    def self.pregunta
      #funcion con manejo de excepciones
      begin
        puts
        puts "Quieres:".blue.bold.on_black
        lista = [
        'salir(0)',
        'agregar(1)',
        'editar(2)',
        'eliminar(3)',
        'buscar(4)',
        'mostrar datos(5)'
        ]
        lista.each do |list|
          sleep 0.2
          puts
          print list.center(50, " ").yellow.on_black
          sleep 0.2
          puts
        end
        puts
        print ' => '.red.on_black
        respuesta = gets.strip.downcase
        Respuesta.validar(respuesta)
      rescue StandardError => e # capturar cualquier error estándar
        puts "Lo siento, ocurrió un error: #{e.message}" # imprimir el mensaje de error
      end
    end
  end

  class Respuesta
    # clase respuesta se valida con un case la respuesta del usuario
    # si no es valida se muestra nuevamente las opciones
    def self.validar(respuesta)
      
      case respuesta
      when '0'
        Contactos.salir
      when '1'
        Contactos.agregar
      when '2'
        Contactos.editar
      when '3'
        Contactos.eliminar
      when '4'
        Contactos.buscar
      when '5'
        Contactos.mostrar_datos
      else
        puts
        puts "No es valida la respuesta".center(50, "-").red.bold
        puts
        Main.pregunta
      end
    end
  end

  class Contactos
    # clase contactos contiene una funcion generador de id verificando si exite
    # el archivo y si se encuentra vacio, valida el numero mas alto de contactos
    # y le agrega uno para crear el id
    def self.generar_id_unico

      id = 1
      if File.exist?('agenda.txt') && !File.empty?('agenda.txt')
        File.foreach('agenda.txt') do |linea|
          id += 1
        end
      end
      id
    end
    
    def self.salir
      exit
    end
    
    def self.agregar
      #le pide al usuario que ingrese el contacto para agregarlo
      puts
      puts "Escribe el contacto que quieres agregar:".blue.bold.on_black
      puts
      print ' => '.red.on_black
      data = gets.strip.downcase
      #organiza el id y luego el contacto y lo escribe en el archivo
      # uno debajo del otro
      id = Contactos.generar_id_unico
      contacto = "#{id}: #{data}"
      
      File.open('agenda.txt', 'a') do |file|
        file.puts(contacto)
        file.close
      end
      
      puts
      sleep 0.5
      puts 'Agregado'
      sleep 0.5
      puts
      
      Main.pregunta
    end

    def self.editar
      #se pide al usuario indicar cual ID quiere modificar
      puts
      puts "Escribe el ID que quieres modificar:".blue.bold.on_black
      puts
      print ' => '.red.on_black
      id = gets.strip.downcase
      File.open('agenda.txt', 'w') do |file|

      end
    end
    def self.eliminar
      puts 'eliminar'
    end
    def self.buscar
      puts 'buscar'
    end
    def self.mostrar_datos
      puts 'Mostrando... '
      File.open('agenda.txt', 'r') do |file|
        contenido = file.read
        puts contenido
      end
      Main.pregunta
    end
  end
end

Agenda::Main.pregunta
