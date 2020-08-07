#un BoardCase renseigne de l'état d'une case
class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :valeur, :num_case
    
    def initialize(valeur, num_case)
      # Regle sa valeur, ainsi que son numéro de case
      @valeur = valeur
      @num_case = num_case
    end
    
    def to_s
      # Renvoye la valeur au format string
      @valeur.to_s
    end
  
end

#----------------------------------------------------------------------------------------------------
#vérifie en fonction de la combinaison des BoardCases si un joueur enchaine trois symboles d'affichés.
#le plateau doit instancier 9 BoardCases
#Le plateau doit s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de empty à X ou O),
class Board
  attr_accessor :array_case
  
    def initialize
      #Quand la classe s'initialize, elle doit crée 9 instances BoardCases
      #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
        @case1 = BoardCase.new("1", 1)
        @case2 = BoardCase.new("2", 2)
        @case3 = BoardCase.new("3", 3)
        @case4 = BoardCase.new("4", 4)
        @case5 = BoardCase.new("5", 5)
        @case6 = BoardCase.new("6", 6)
        @case7 = BoardCase.new("7", 7)
        @case8 = BoardCase.new("8", 8)
        @case9 = BoardCase.new("9", 9)
  
        @tableau_case = [[@case1, @case2, @case3],[@case4, @case5, @case6],[@case7, @case8, @case9]]
    end
  
    def to_s
    #Pour afficher le plateau
        @tableau_case.each do |x|
            puts "--- --- ---"
            puts "| "+x[0].to_s+" | "+x[1].to_s+" | "+x[2].to_s+" |"
            end
            puts "--- --- ---"
      
    end
  
    #On définie une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    def play(valeur, case_num)
      #system('clear') or system('cls')
      case case_num #On switch le case_num qui est le numero de la case
      #On vérifi d'abord si les emplacements ne sont pas vides
      when 1
        if @tableau_case[0][0].to_s == "1".to_s 
          @tableau_case[0][0] = valeur
        else
          puts "Votre choix n est plus valide, la case est deja occuper, veuillez reessayer"
          return false
        end
      when 2
        if @tableau_case[0][1].to_s == "2".to_s
          @tableau_case[0][1] = valeur
        else
          puts "il faut bien regarder les cases vide avant de la choisir ( case sans x ou o ), veuillez reessayer"
          return false
        end
      when 3
        if @tableau_case[0][2].to_s == "3".to_s
          @tableau_case[0][2] = valeur
        else
          puts "Ouups , desoler la case n'est plus vide, veuillez reessayer"
          return false
        end
      when 4
        if @tableau_case[1][0].to_s == "4".to_s
          @tableau_case[1][0] = valeur
        else
          puts "Deja fatiguer, veuillez choisir une case vide ( sans x et o )" 
          return false
        end
      when 5
        if @tableau_case[1][1].to_s == "5".to_s
          @tableau_case[1][1] = valeur
        else
          puts "Deja fatiguer, veuillez choisir une case vide ( sans x et o )"
          return false
        end
      when 6
        if @tableau_case[1][2].to_s == "6".to_s
          @tableau_case[1][2] = valeur
        else
          puts "Ouups , desoler la case n'est plus vide, veuillez reessayer"
          return false
        end
      when 7
        if @tableau_case[2][0].to_s == "7".to_s
          @tableau_case[2][0] = valeur
        else
          puts "il faut bien regarder les cases vide avant de la choisir ( case sans x ou o ), veuillez reessayer"
          return false
        end
      when 8
        if @tableau_case[2][1].to_s == "8".to_s
          @tableau_case[2][1] = valeur
        else
          puts "Votre choix n est plus valide, la case est deja occuper, veuillez reessayer"
          return false
        end
      when 9
        if @tableau_case[2][2].to_s == "9".to_s
          @tableau_case[2][2] = valeur
        else
          puts "Ouups , desoler la case n'est plus vide, veuillez reessayer"
          return false
        end
      end
  
    end
  
    def victory?
      #Méthode qui check si quelqu'un a gagné
      if
      #Les cas possibles de victoire
        (@tableau_case[0][0] == @tableau_case[0][1]) && (@tableau_case[0][1] == @tableau_case[0][2]) ||
        (@tableau_case[1][0] == @tableau_case[1][1]) && (@tableau_case[1][1] == @tableau_case[1][2]) ||
        (@tableau_case[2][0] == @tableau_case[2][1]) && (@tableau_case[2][1] == @tableau_case[2][2]) ||
        (@tableau_case[0][0] == @tableau_case[1][0]) && (@tableau_case[1][0] == @tableau_case[2][0]) ||
        (@tableau_case[0][1] == @tableau_case[1][1]) && (@tableau_case[1][1] == @tableau_case[2][1]) ||
        (@tableau_case[0][2] == @tableau_case[1][2]) && (@tableau_case[1][2] == @tableau_case[2][2]) ||
        (@tableau_case[0][0] == @tableau_case[1][1]) && (@tableau_case[1][1] == @tableau_case[2][2]) ||
        (@tableau_case[0][2] == @tableau_case[1][1]) && (@tableau_case[1][1] == @tableau_case[2][0])
      #On retourne true s'il y a un victoire
        true
      else
      #On retourne false sinon
        false 
      end
    end
end


#----------------------------------------------------------------------------------------------------
#un joueur a un nom (habile), et un état (victoire s'il a gagné)
class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
      attr_accessor :nom, :valeur
    
    def initialize(nom= nil, valeur= nil)
      #Si on initialize sans un nom, on demande à l'utilisateur de taper son nom
      if nom == nil
        puts "Saisir votre nom ="
        nom = gets.chomp
      end
      @nom = nom
      #Si on initialize sans valeur, on demande à l'utilisateur de choisir un
      if valeur == nil
        puts "Veuillez choisir votre pion dans le jeu ( x ou o )"
        prise = gets.chomp
        while prise != "x" && prise != "o" #Si l'utilisateur choisi un autre valeur que X et O
        puts "Choix non pris en compt! Veuillez choisir entre ( x ou o ) "
        prise = gets.chomp
        end
        valeur = prise
      end
      @valeur = valeur
    end

end

class Game
    def initialize
      #creation des deux joueur, et un board
      puts "Au Joueur n_1 (>_<)"
      @joueur_1 = Player.new
  
      puts "Au Joueur n_2 *>_<*"
      #le joueur n 2 ne choisi plus son pion
      if @joueur_1.valeur == "x"        
        @joueur_2 = Player.new(nil, "o")
      else
        @joueur_2 = Player.new(nil, "x")
      end
  
      @board = Board.new
  
    end
  
    def go
      #lancement de la partie
      puts "Commencant à jouer :) , #{@joueur_1.nom} tu va jouer le premier"
      #sleep 2
      turn #On fait appel à la méthode turn ci-dessous
    end
  
    def turn
      #On affiche les cases avec ses numéros
      tab = [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"] ]

      puts "voila ci-dessous la representation du plateau du jeu"
      tab.each do |x|
                puts "--- --- ---"
                puts "| "+x[0].to_s+" | "+x[1]+" | "+x[2]+" |"        
        end
      puts "\t\t\t --- --- ---"
      #sleep 3
  
      boucle = true
      var_intermediaire = 0
      nbr_tour = 1

      while boucle
=begin
      display_board = [*(1..9)]
      puts " #{display_board[0]} | #{display_board[1]} | #{display_board[2]} "
      puts "-----------"
      puts " #{display_board[3]} | #{display_board[4]} | #{display_board[5]} "
      puts "-----------"
      puts " #{display_board[6]} | #{display_board[7]} | #{display_board[8]} "
      puts "===================================="
=end
        #Si le nombre de tour est paire, alors c'est le deuxième joueur qui jouer     
        if nbr_tour % 2 == 0
          puts "\n#{@joueur_2.nom}, vous allez vous placez où? (case entre 1 à 9)\n"
        else
          puts "\n#{@joueur_1.nom}, vous allez vous placez où? (case entre 1 à 9)\n"
        end
        #On place dans var_intermediaire le numero de case où le joueur veux placer
        var_intermediaire = gets.chomp
        var_intermediaire = var_intermediaire.to_i
        #checking placement dans le case
        while (var_intermediaire < 1) || (9 < var_intermediaire) 
          puts "Aye, pas cool! :/ la case est entre 1 à 9"
          var_intermediaire = gets.chomp
          var_intermediaire = var_intermediaire.to_i
        end
        #On place la valeur du joueur au numéros du case choisi
        if nbr_tour % 2 == 0
          playing = @board.play(@joueur_2.valeur, var_intermediaire)
        else
          playing = @board.play(@joueur_1.valeur, var_intermediaire)
        end
        #checking si la case du joueur est non vide
        while playing == false
          var_intermediaire = gets.chomp
          var_intermediaire = var_intermediaire.to_i
          if nbr_tour % 2 == 0
            playing = @board.play(@joueur_2.valeur, var_intermediaire)
          else
            playing = @board.play(@joueur_1.valeur, var_intermediaire)
          end
        end

        #On affiche le board à chaque fois
        #sleep 1
        @board.to_s
        #affichage si l'un des joueur a gagner
        if @board.victory? == true
          if nbr_tour % 2 == 0
            puts "Bravo #{@joueur_2.nom} !!! tu a gagner,... #{@joueur_1.nom} tu feras mieux la prochaine fois >_<"
          else
            puts "Brabo #{@joueur_1.nom} !!! tu a gagner,... #{@joueur_2.nom} tu feras mieux la prochaine fois >_<"
          end
        end
        #On affiche le vainqueur et arrête la boucle si on a une victoire
        break if @board.victory? == true
        #On incrémente le nombre de tour sinon 
        nbr_tour += 1
        #On recommence le jeux si le nombre de tour dépasse 9 et si personne n'a gagné
        if nbr_tour == 10
          puts "oh! domage c'est un match nul :( c'est pas cool!"
          puts "\n\n Plateu du jeu final"          
          nbr_tour = 1
          #reinitialisation de la table
          @board.array_case = tab
          @board.to_s
          break
        end
      end
  
    end
  
end

Game.new.go
