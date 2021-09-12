# import getopt, sys

# args = sys.argv[1:2]

documents = [
    {"type": "passport", "number": "2207 876234", "name": "Василий Гупкин"},
    {"type": "invoice", "number": "11-2", "name": "Геннадий Покемонов"},
    {"type": "insurance", "number": "10006", "name": "Аристарх Павлов"}
]

directories = {
    '1': ['2207 876234', '11-2'],
    '2': ['10006'],
    '3': []
}


def find_people_by_document(document_number):
    for document in documents:
        if document_number == document['number']:
            return document['name']
    return None


def find_shelf_by_document(document_number):
    for key, value in directories.items():
        for document in value:
            if document_number == document:
                return key
    return None


def print_documents():
    lst_documents = []
    for document in documents:
        # passport "2207 876234" "Василий Гупкин";
        lst_documents.append(document['type'] + ' "' + document['number'] + '" "' + document['name'] + '"')
    return lst_documents


def add_to_documents(document_type, document_number, document_owner):
    dct = {"type": document_type, "number": document_number, "name": document_owner}
    return documents.append(dct)


def add_to_self(shelf_number, document_number):
    return directories[shelf_number].append(document_number)


def delete_document_from_document(document_number):
    for document in documents:
        if document_number == document['number']:
            return documents.remove(document)


def delete_document_from_shelf(document_number):
    for key, value in directories.items():
        for document in value:
            if document_number == document:
                return directories[key].remove(document_number)


def add_shelf(shelf_number):
    directories[shelf_number] = []
    return directories

def main():

    message = "Enter: \n\
        'p' or 'people' for find people by document's,\n\
        's' or 'shelf' for find shelf by document's number,\n\
        'l' or 'list' to list documents,\n\
        'a' or 'add' to add document,\n\
        'd' or 'delete' to delete document,\n\
        'm' or 'move' to move document,\n\
        'as' or 'add shelf' to add shelf.\n"

    user_input = input(message)

    # if args[0] == 'p' or args[0] == 'people':
    if user_input == 'p' or user_input == 'people':
        document_number = input("Enter document number: ")
        print(f'People by document number: {find_people_by_document(document_number)}')

    elif user_input == 's' or user_input == 'shelf':
        document_number = input("Enter document number: ")
        print(f'Document find in shelf: {find_shelf_by_document(document_number)}')

    elif user_input == 'l' or user_input == 'list':
        print(*print_documents(), sep=";\n")

    elif user_input == 'a' or user_input == 'add':
        document_type = input("Enter document type: ")
        document_number = input("Enter document number: ")
        document_owner = input("Enter document owner: ")
        shelf_number = input("Enter shelf number: ")
        if document_type and document_number and document_owner:
            if shelf_number in directories:
                add_to_documents(document_type, document_number, document_owner)
                print(*print_documents(), sep=";\n")
                add_to_self(shelf_number, document_number)
                print(directories)
            else:
                print(f'Shelf number {shelf_number} doesn\'t exist')
        else:
            print('Missing value')

    elif user_input == 'd' or user_input == 'delete':
        document_number = input("Enter document number: ")
        if find_people_by_document(document_number) and find_shelf_by_document(document_number):
            delete_document_from_document(document_number)
            delete_document_from_shelf(document_number)
            print(*print_documents(), sep=";\n")
            print(directories)
        else:
            print(f'Document {document_number} not found')

    elif user_input == 'm' or user_input == 'move':
        document_number = input("Enter document number: ")
        target_shelf_number = input("Enter target shelf number: ")
        shelf_number = find_shelf_by_document(document_number)
        if find_people_by_document(document_number) and shelf_number:
            if shelf_number == target_shelf_number:
                print(f'Shelf number already: {target_shelf_number}')
            else:
                if target_shelf_number in directories:
                    delete_document_from_shelf(document_number)
                    add_to_self(target_shelf_number, document_number)
                    print(directories)
                else:
                    print(f'Shelf number {target_shelf_number} not found')
        else:
            print(f'Document {document_number} not found')

    elif user_input == 'as' or user_input == 'add shelf':
        new_shelf_number = input("Enter new shelf number: ")
        if new_shelf_number in directories:
            print(f'Shelf number {new_shelf_number} already exist')
        else:
            print(add_shelf(new_shelf_number))

    else:
        print(message)


if __name__ == "__main__":
    main()
