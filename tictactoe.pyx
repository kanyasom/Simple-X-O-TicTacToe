#from IPython.display import clear_output

def display(board):
    print(100*" ")
    print(' ' + board[1] + ' | ' + board[2] + ' | ' + board[3])
    print('-----------')
    print(' ' + board[4] + ' | ' + board[5] + ' | ' + board[6])
    print('-----------')
    print(' ' + board[7] + ' | ' + board[8] + ' | ' + board[9])

#function that can take in a player input and assign their marker as 'X' or 'O'
def p_input():
    marker = ''

    while not (marker == 'X' or marker == 'O'):
        marker = input('Player 1: Do you want to be X or O? \n').upper()

    if marker == 'X':
        return 'X', 'O'
    else:
        return 'O', 'X'

# a function that takes in the board list object,
# a marker ('X' or 'O'), and a desired position (number 1-9) and assigns it to the board.
def place_marker(board, marker, position):
    board[position] = marker

#a function that takes in a board and checks to see if someone has won.
def win(board,mark):

    return ((board[7] == mark and board[8] == mark and board[9] == mark) or # across the top
    (board[4] == mark and board[5] == mark and board[6] == mark) or # across the middle
    (board[1] == mark and board[2] == mark and board[3] == mark) or # across the bottom
    (board[7] == mark and board[4] == mark and board[1] == mark) or # down the middle
    (board[8] == mark and board[5] == mark and board[2] == mark) or # down the middle
    (board[9] == mark and board[6] == mark and board[3] == mark) or # down the right side
    (board[7] == mark and board[5] == mark and board[3] == mark) or # diagonal
    (board[9] == mark and board[5] == mark and board[1] == mark)) # diagonal

#a function that uses the random module to randomly decide which player goes first
import random

def choose_first():
    if random.randint(0, 1) == 0:
        return 'Player 2'
    else:
        return 'Player 1'

# a function that returns a boolean indicating whether a space on the board is freely available.
def space_check(board, position):

    return board[position] == ' '

#a function that checks if the board is full and returns a boolean value. True if full, False otherwise.
def fullboard(board):
    for i in range(1,10):
        if space_check(board, i):
            return False
    return True

#a function that asks for a player's next position
def choice(board):
    position = 0

    while position not in [1,2,3,4,5,6,7,8,9] or not space_check(board, position):
        position = int(input('Choose your next position: (1-9) \n'))

    return position

#a function that asks the player if they want to play again
# and returns a boolean True if they do want to play again.
def replay():

    return input('Do you want to play again? Enter Yes or No: \n').lower().startswith('y')

print('Welcome to Tic Tac Toe!')

while True:
    # Reset the board
    theBoard = [' '] * 10
    player1_marker, player2_marker = p_input()
    turn = choose_first()
    print(turn + ' will go first.')

    play_game = input('Are you ready to play? Enter Yes or No.\n')

    if play_game.lower()[0] == 'y':
        game = True
    else:
        game = False



    while game:
        if turn == 'Player 1':
            # Player1's turn.

            display(theBoard)
            position = choice(theBoard)
            place_marker(theBoard, player1_marker, position)

            if win(theBoard, player1_marker):
                display(theBoard)
                print('You won!')
                game = False
            else:
                if fullboard(theBoard):
                    display(theBoard)
                    print('Draw!')
                    break
                else:
                    turn = 'Player 2'

        else:
            # Player2's turn.

            display(theBoard)
            position = choice(theBoard)
            place_marker(theBoard, player2_marker, position)

            if win(theBoard, player2_marker):
                display(theBoard)
                print('Player 2 won!')
                game_on = False
            else:
                if fullboard(theBoard):
                    display(theBoard)
                    print('Draw!')
                    break
                else:
                    turn = 'Player 1'

    if not replay():
        break
