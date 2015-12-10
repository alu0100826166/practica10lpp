require 'date'


module Bibliografia
    
    class Bibliografia
        include Comparable
        attr_accessor :autores, :titulo, :fecha

        def initialize(autor, titulo, fecha)
            raise ArgumentError, 'Tiene que haber al menos un autor' if autor.length == 0
            raise ArgumentError if ( (fecha.class != Date) ||
                                    !(Date.valid_date?(fecha.year,fecha.month, fecha.mday)))
            @titulo = titulo
            @fecha = fecha
        end #initialize

        def getAutores()
           p @autores
        end #getAutores
        
        
        def <=>(other)
            @titulo <=> other.titulo 
        end
        
    end #class Bibliografia
    
    
    
    
    class Clase_Nueva < Bibliografia
        attr_accessor :autor, :titulo, :fecha
        def initialize(autor, titulo, fecha)
            super(titulo, fecha)
            
            @autores = Array.new
            for i in 0..autor.size-1
              value=autor[i].split(" ")
              @autores.push("#{value[1]}, #{value[0][0]}.")
            end
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    class Libro < Clase_Nueva
        attr_accessor :isbn, :serie, :editorial, :n_edicion
        def initialize(autor, titulo, serie, ed, nEd, fecha, isbn)
            super(autor, titulo, fecha)
            raise ArgumentError if (isbn.class != Hash)
            @isbn=isbn
            @editorial = ed
            @n_edicion = nEd
            @serie = serie
        end
        
        def getISBN()
            p @isbn
        end #getISBN
        
        def getReferencia()
            #Imprimimos los nombres formateados
            @autores.each_with_index do |nombre, i|
                print(nombre)
                if (i == (@autores.length-1))
                    puts #Imprimimos el salto de linea
                else
                    print(", ") #Imprimimos la coma
                end #if
            end #do
            puts ("#{@titulo}") #Imprimimos el titulo
            puts ("#{@editorial}")
            puts ("#{@n_edicion}")
            puts @fecha.strftime("%d/%m/%Y")
            #Imprimimos los valores del Hash ISBN
            isbn.each { |i, valor|
            puts ("#{i} : #{valor}") } 
        
        end #getReferencia
    end#Clase Libro
    
    
    
    
    class Revista < Clase_Nueva
        attr_accessor :ISSN
        def initialize(autor, titulo, serie, ed, nEd, fecha, issn)
            super(autor, titulo, fecha)
            @issn=issn
            @editorial = ed
            @n_edicion = nEd
            @serie = serie
        end
        
        def getISSN()
            p @issn
        end #getISSN
        
        def getReferencia()
            #Imprimimos los nombres formateados
            @autores.each_with_index do |nombre, i|
                print(nombre)
                if (i == (@autores.length-1))
                    puts #Imprimimos el salto de linea
                else
                    print(", ") #Imprimimos la coma
                end #if
            end #do
            puts ("#{@titulo}") #Imprimimos el titulo
            puts ("#{@editorial}")
            puts ("#{@n_edicion}")
            puts @fecha.strftime("%d/%m/%Y")
            puts ("#{@issn}")
        end #getReferencia
    end#Clase Revista
    
    
    class DocumentoElectronico < Clase_Nueva
        attr_accessor :url
        def initialize(autor, titulo, fecha, url)
            super(autor, titulo, fecha)
            @url=url
        end
        
        def getURL()
            p @url
        end #getURL
        
        def getReferencia()
            #Imprimimos los nombres formateados
            @autores.each_with_index do |nombre, i|
                print(nombre)
                if (i == (@autores.length-1))
                    puts #Imprimimos el salto de linea
                else
                    print(", ") #Imprimimos la coma
                end #if
            end #do
            puts ("#{@titulo}") #Imprimimos el titulo
            puts @fecha.strftime("%d/%m/%Y")
            puts ("#{@url}")
        end #getReferencia
    end#Clase DocuemntoElectronico
    
    
    Node = Struct.new(:prev, :value, :sig)
    
    
    class ListaEnlazada
        include Enumerable
        attr_accessor :head, :tail
    
        def initialize(valor)
            @head = Node.new(nil, valor, nil)
            @tail = @head
        end
        
        
        def insertar_delante(valor)
            @aux = Node.new(nil, valor, @head)
            @head.prev = @aux
            @head = @aux
        end
        
        
        def insertar_detras(valor)
            @aux = Node.new(@tail, valor, nil)
            @tail.sig = @aux
            @tail = @aux
        end
        
        
        def sacar_delante()
            @head.value.getReferencia()
            @head = @head.sig
        end
        
        
        def sacar_detras()
            @tail.value.getReferencia()
            @tail = @tail.prev
        end
        
       
        def extraer_delante()
            @aux = @head
            while(@aux.sig != nil) do
                @head.value.getReferencia()
                @aux = @head
                @head = @aux.sig
            end
        end
        
        
        def extraer_detras()
            @aux=@tail
            while(@aux.prev != nil) do
                @tail.value.getReferencia()
                puts ""
                @aux = @tail
                @tail = @aux.prev
            end
        end
        
        
        def each
            @aux = @head
            while(@aux.sig != nil) do
                yield @head.value
                @aux = @head
                @head = @aux.sig
            end
        end
        
        
        
        
    end#clase Lista
    
end #module Bibliografia