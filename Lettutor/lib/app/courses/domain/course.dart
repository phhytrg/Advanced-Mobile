class CourseList {
  int count;
  List<Course> rows;

  CourseList({
    required this.count,
    required this.rows,
  });

  factory CourseList.fromJson(Map<String, dynamic> json) {
    return CourseList(
      count: json['count'],
      rows: json['rows'].map<Course>((course) => Course.fromJson(course)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows.map((course) => course.toJson()).toList(),
    };
  }
}

class Course {
  String description;
  String id;
  String imageUrl;
  String name;
  String purpose;
  String reason;
  bool? visible;
  String level;
  List<Topic> topics;
  List<Category>? categories;
  List<User> users;

  Course({
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.purpose,
    required this.reason,
    this.visible,
    required this.topics,
    required this.level,
    this.categories,
    required this.users,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      description: json['description'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      purpose: json['purpose'],
      reason: json['reason'],
      visible: json['visible'],
      topics: json['topics'].map<Topic>((topic) => Topic.fromJson(topic)).toList(),
      level: json['level'],
      categories: json['categories']?.map<Category>((category) => Category.fromJson(category)).toList(),
      users: json['users'].map<User>((user) => User.fromJson(user)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'purpose': purpose,
      'reason': reason,
      'visible': visible,
      'topics': topics.map((topic) => topic.toJson()).toList(),
      'level': level,
      'categories': categories?.map((category) => category.toJson()).toList(),
      'users': users.map((user) => user.toJson()).toList(),
    };
  }
}

class Topic {
  String courseId;
  String description;
  String name;
  String nameFile;
  int orderCourse;

  Topic({
    required this.courseId,
    required this.description,
    required this.name,
    required this.nameFile,
    required this.orderCourse,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      courseId: json['courseId'],
      description: json['description'],
      name: json['name'],
      nameFile: json['nameFile'],
      orderCourse: json['orderCourse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'description': description,
      'name': name,
      'nameFile': nameFile,
      'orderCourse': orderCourse,
    };
  }
}

class Category {
  String id;
  String title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}

class User {
  String id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
