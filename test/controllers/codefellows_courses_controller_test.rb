require 'test_helper'

class CodefellowsCoursesControllerTest < ActionController::TestCase
  setup do
    @codefellows_course = codefellows_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:codefellows_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create codefellows_course" do
    assert_difference('CodefellowsCourse.count') do
      post :create, codefellows_course: { course: @codefellows_course.course, course_id: @codefellows_course.course_id, end_date: @codefellows_course.end_date, instructor: @codefellows_course.instructor, section: @codefellows_course.section, start_date: @codefellows_course.start_date }
    end

    assert_redirected_to codefellows_course_path(assigns(:codefellows_course))
  end

  test "should show codefellows_course" do
    get :show, id: @codefellows_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @codefellows_course
    assert_response :success
  end

  test "should update codefellows_course" do
    patch :update, id: @codefellows_course, codefellows_course: { course: @codefellows_course.course, course_id: @codefellows_course.course_id, end_date: @codefellows_course.end_date, instructor: @codefellows_course.instructor, section: @codefellows_course.section, start_date: @codefellows_course.start_date }
    assert_redirected_to codefellows_course_path(assigns(:codefellows_course))
  end

  test "should destroy codefellows_course" do
    assert_difference('CodefellowsCourse.count', -1) do
      delete :destroy, id: @codefellows_course
    end

    assert_redirected_to codefellows_courses_path
  end
end
