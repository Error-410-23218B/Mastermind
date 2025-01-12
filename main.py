import arcade
import random

# Constants
SCREEN_WIDTH = 600
SCREEN_HEIGHT = 400
CODE_LENGTH = 4
MAX_ATTEMPTS = 10
COLORS = ['R', 'G', 'B', 'Y', 'O', 'P']  # Red, Green, Blue, Yellow, Orange, Purple

class MastermindGame(arcade.Window):
    def __init__(self):
        super().__init__(SCREEN_WIDTH, SCREEN_HEIGHT, "Mastermind Game")
        arcade.set_background_color(arcade.color.WHITE)
        self.secret_code = self.generate_code()
        self.attempts = []
        self.current_guess = ""
        self.message = ""
        print(self.secret_code)

    def generate_code(self):
        return [random.choice(COLORS) for _ in range(CODE_LENGTH)]

    def on_draw(self):
        arcade.start_render()
        arcade.draw_text("Mastermind Game", SCREEN_WIDTH // 2, SCREEN_HEIGHT - 50,
                         arcade.color.BLACK, font_size=24, anchor_x="center")

        # Draw attempts
        for i, (guess, feedback) in enumerate(self.attempts):
            arcade.draw_text(f"Attempt {i + 1}: {''.join(guess)} - Feedback: {feedback}",
                             50, SCREEN_HEIGHT - 100 - i * 30, arcade.color.BLACK, font_size=14)

        # Draw current guess
        arcade.draw_text(f"Current Guess: {self.current_guess}", 50, SCREEN_HEIGHT - 100 - len(self.attempts) * 30,
                         arcade.color.BLACK, font_size=14)

        # Draw message
        arcade.draw_text(self.message, SCREEN_WIDTH // 2, 50, arcade.color.RED, font_size=18, anchor_x="center")

    def on_key_press(self, key, modifiers):
        if len(self.current_guess) < CODE_LENGTH:
            if key in [arcade.key.R, arcade.key.G, arcade.key.B, arcade.key.Y, arcade.key.O, arcade.key.P]:
                self.current_guess += chr(key).upper()
        if key == arcade.key.ENTER:
            if len(self.current_guess) == CODE_LENGTH:
                self.check_guess()
                self.current_guess = ""

    def check_guess(self):
        guess = list(self.current_guess)
        feedback = self.get_feedback(guess)
        self.attempts.append((guess, feedback))
        print(feedback)
        if "4B" in feedback:
            self.message = "Congratulations! You've cracked the code!"
        elif len(self.attempts) >= MAX_ATTEMPTS:
            self.message = f"Game Over! The code was: {''.join(self.secret_code)}"

    def get_feedback(self, guess):
        correct_position = sum(g == s for g, s in zip(guess, self.secret_code))
        correct_color = sum(min(guess.count(c), self.secret_code.count(c)) for c in set(guess))
        correct_color -= correct_position
        return f"{correct_position}B {correct_color}W"

def main():
    game = MastermindGame()
    arcade.run()

if __name__ == "__main__":
    main()