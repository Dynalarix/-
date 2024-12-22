#!/bin/bash

# Функция для проверки ответов и основого процесса
check_answers() {
    local correct=0
    local total=${#words[@]}

    
    for word in "${!words[@]}"; do
        echo "$word - "
        read -p "Введите значение: " user_answer
        if [[ "${user_answer[$word]}" == "${words[$word]}" ]]; then
            ((correct++))
        fi
    done

    # Вычисляем процент правильных ответов
    percentage=$(( 100 * correct / total ))
    echo 
    echo "<============================================>"
    echo "Правильных ответов: $correct из $total"
    echo "Процент правильных ответов: $percentage%"
}

# Запрашиваем путь к файлу
echo "Введите путь к текстовому файлу (например, 'user/home/file.txt'): "
read path

# Проверяем, существует ли файл
if [[ ! -f "$path" ]]; then
    echo "Файл не найден. Пожалуйста, проверьте путь и попробуйте снова."
    exit 1
fi

# Читаем слова из файла и заполняем ассоциативный массив чтобы использовтаь его в функции написанной выше
declare -A words=()
while IFS=' - ' read -r word translation; do
    words["$word"]="$translation"
done < "$path"
echo "$words"

echo "Заполните значения для следующих слов:"

# Проверяем ответы
check_answers









