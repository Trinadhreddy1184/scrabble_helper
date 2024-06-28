import collections


def create_letter_hash(input_word):
    return collections.Counter(input_word.lower())


def word_possible(input_word, reference):
    input_word_hash = create_letter_hash(input_word)
    reference_word_hash = create_letter_hash(reference)

    for letter, remaining_instances in reference_word_hash.items():
        # Checking if each letter from the reference is present in the input. If not, reference word not possible.
        if letter not in input_word_hash:
            return False

        # Subtracting a usage of the letter from input
        input_word_hash[letter] -= remaining_instances

        # Checking if there were any instances of the input letter remaining. If not, reference word not possible.
        if input_word_hash[letter] < 0:
            return False

    # Returning true, since checks ensure reference word is possible.
    return True


def get_word_list(input_word):
    with open('lib/words_alpha.txt') as f:
        dict_array = [line.strip() for line in f]

    matching_words_array = []

    for dict_word in dict_array:
        if word_possible(input_word, dict_word):
            matching_words_array.append(dict_word)

    return matching_words_array


def get_user_input():
    return input().strip().lower()


def continue_or_exit():
    print("Would you like to check more letters? (Y/n)")

    input_choice = get_user_input()

    if input_choice == "y":
        main()
    elif input_choice == "n":
        print("Exiting program. Thanks for using Scrabble Helper!")
    else:
        print("================================")
        print("Error: Invalid selection.")
        print("================================")
        continue_or_exit()


def main():
    print("================================")
    print("Enter some letters to receive a list of possible words:")
    input_word = get_user_input()
    result = get_word_list(input_word)

    print("================================")
    print(f"Possible words using {input_word}:")
    print(result)
    print("================================")

    continue_or_exit()


if __name__ == "__main__":
    main()
