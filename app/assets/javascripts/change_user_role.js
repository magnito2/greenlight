// BigBlueButton open source conferencing system - http://www.bigbluebutton.org/.
//
// Copyright (c) 2018 BigBlueButton Inc. and by respective authors (see below).
//
// This program is free software; you can redistribute it and/or modify it under the
// terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3.0 of the License, or (at your option) any later
// version.
//
// BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
// PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along
// with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.

$(document).on('turbolinks:load', function(){
  var controller = $("body").data('controller');
  var action = $("body").data('action');

  // Only run on the schools page.
  if (controller == "schools" && action == "show" || controller == "admins" && action == "index") {
    // show the modal with the correct form action url
    $(".change-user-role").click(function(){

      var role = $(this).data("role");

      role === "student" ? $("#student-role").parent().hide() :
        $("#student-role").parent().attr("action", $(this).data("path"));

      role === "teacher" ? $("#teacher-role").parent().hide() :
        $("#teacher-role").parent().attr("action", $(this).data("path"));

      role === "admin" ? $("#admin-role").parent().hide() :
        $("#admin-role").parent().attr("action", $(this).data("path"));

      $("#role-title").text("Current Role is "+ role.charAt(0).toUpperCase() + role.substring(1, role.length))
    })
  }
})
