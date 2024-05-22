import 'package:genesis/models/daily_task/daily_task_model.dart';
import 'package:genesis/models/users/users_model.dart';
import 'package:get/get.dart';

class AppInstances {
  Rx<Users> authUser = Users(
    id: "3567HD",
    capacity: [
      "Capacité 1",
      "Capacité 1",
      "Capacité 1",
      "Capacité 1",
      "Capacité 1"
    ],
  ).obs;

  static List<DailyTask> tasks = [
    DailyTask(
      task: "Conception des interfaces",
      description:
          "Il étais question de concevoir des interface jolie, ergonomique et facile d'utilisation pour les différents collaborateurs de Sygalin SAS utilisant l'application Génesis que ce soit web ou mobile",
      evolution: "86%",
      date: "2024-05-21",
      difficulty:
          "- Difficulté 1\n- Difficulté 2\n- Difficulté 3\n- Difficulté 4",
      id: "1",
      time: "08h12",
    ),
    DailyTask(
      task: "Conception des interfaces",
      description:
          "Il étais question de concevoir des interface jolie, ergonomique et facile d'utilisation pour les différents collaborateurs de Sygalin SAS utilisant l'application Génesis que ce soit web ou mobile",
      evolution: "86%",
      date: "2024-05-21",
      difficulty:
          "- Difficulté 1\n- Difficulté 2\n- Difficulté 3\n- Difficulté 4",
      id: "1",
      time: "08h12",
    ),
    DailyTask(
      task: "Conception des interfaces",
      description:
          "Il étais question de concevoir des interface jolie, ergonomique et facile d'utilisation pour les différents collaborateurs de Sygalin SAS utilisant l'application Génesis que ce soit web ou mobile",
      evolution: "86%",
      date: "2024-05-21",
      difficulty:
          "- Difficulté 1\n- Difficulté 2\n- Difficulté 3\n- Difficulté 4",
      id: "1",
      time: "08h12",
    ),
    DailyTask(
      task: "Conception des interfaces",
      description:
          "Il étais question de concevoir des interface jolie, ergonomique et facile d'utilisation pour les différents collaborateurs de Sygalin SAS utilisant l'application Génesis que ce soit web ou mobile",
      evolution: "86%",
      date: "2024-05-21",
      difficulty:
          "- Difficulté 1\n- Difficulté 2\n- Difficulté 3\n- Difficulté 4",
      id: "1",
      time: "08h12",
    ),
  ];

  onClose() {
    authUser.value = Users();
  }
}
