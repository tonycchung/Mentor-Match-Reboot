# require 'test_helper'

# class CodefellowsCoursesControllerTest < ActionController::TestCase
#   setup do
#     @codefellows_course = codefellows_courses(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:codefellows_courses)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create codefellows_course" do
#     assert_difference('CodefellowsCourse.count') do
#       post :create, codefellows_course: { kind: @codefellows_course.kind, stack: @codefellows_course.stack, code: @codefellows_course.code, ends_at: @codefellows_course.ends_at, instructor: @codefellows_course.instructor, section: @codefellows_course.section, starts_at: @codefellows_course.starts_at }
#     end

#     assert_redirected_to codefellows_course_path(assigns(:codefellows_course))
#   end

#   test "should show codefellows_course" do
#     get :show, id: @codefellows_course
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @codefellows_course
#     assert_response :success
#   end

#   test "should update codefellows_course" do
#     patch :update, id: @codefellows_course, codefellows_course: { kind: @codefellows_course.kind, stack: @codefellows_course.stack, code: @codefellows_course.code, ends_at: @codefellows_course.ends_at, instructor: @codefellows_course.instructor, section: @codefellows_course.section, starts_at: @codefellows_course.starts_at }
#     assert_redirected_to codefellows_course_path(assigns(:codefellows_course))
#   end

#   test "should destroy codefellows_course" do
#     assert_difference('CodefellowsCourse.count', -1) do
#       delete :destroy, id: @codefellows_course
#     end

#     assert_redirected_to codefellows_courses_path
#   end
# end
