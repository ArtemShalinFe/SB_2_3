//
//  User.swift
//  SB_2_3
//
//  Created by Артем ШАЛИН on 24.01.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func userFound(login: String, password: String) -> Bool {
        
        let allUsers = getUsers();
        
        for user in allUsers {
            if user.login == login || user.password == password {
                return true
            }
        }
        
        return false
    }
    
    private static func getUsers() -> [User]{
        return [
            User(login: "mimi", password: "mumu", person: getPersonData())
        ]
    }
}

struct Person {
    let firstname: String
    let lastname: String
    let age: Int
    let resume: Resume
    let hobbys: [Hobby]
    let moreAboutPerson: String
}

struct Resume {
    let workExpirience: Int
    let currentProfession: String
    let activity: String
}

struct Hobby {
    let title: String
    let detail: String
}

func getPersonData() -> Person{
    
    let hobbyOne = Hobby(
        title: "Кулинария",
        detail: "С недавних пор начал увлекаться кулинарией. Нравится готовить всякого рода выпечку.")
    
    let hobbyTwo = Hobby(
        title: "Спорт",
        detail: "С детства занимаюсь легкой атлетикой, а сейчас просто стараюсь поддерживать форму.")
    
    let hobbyThree = Hobby(
        title: "Программирование",
        detail: "В свободное время, для расширения кругозора, изучаю дополнительные языки программирования.")
    
    return Person(
            firstname: "Артем",
            lastname: "Шалин",
            age: 30,
            resume: Resume(
                        workExpirience: 9,
                        currentProfession: "Эксперт по технологическим вопросам 1С",
                        activity: "Оптимизация крупных корпоративных систем построеных на платформе 1С, работающих под высокой нагрузкой."
                    ),
            hobbys: [hobbyOne, hobbyTwo, hobbyThree],
            moreAboutPerson: "Просто какой-то текст. Экран занять. :с")
}
