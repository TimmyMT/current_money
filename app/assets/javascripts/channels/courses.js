var ready = function () {
  App.cable.subscriptions.create('CoursesChannel', {
    connected: function () {
      // console.log('Courses connected!');
      this.perform('follow')
    },

    received: function (data) {
      var course = data.course;
      // console.log(course);
      $(".current_course").text('Current 1 ' + course.name + ' = ' + course.value + ' RUB')
    }
  })
};

$(document).on('turbolinks:load', ready);
