require "test_helper"

class PatientClinicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_clinic = patient_clinics(:one)
  end

  test "should get index" do
    get patient_clinics_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_clinic_url
    assert_response :success
  end

  test "should create patient_clinic" do
    assert_difference("PatientClinic.count") do
      post patient_clinics_url, params: { patient_clinic: {  } }
    end

    assert_redirected_to patient_clinic_url(PatientClinic.last)
  end

  test "should show patient_clinic" do
    get patient_clinic_url(@patient_clinic)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_clinic_url(@patient_clinic)
    assert_response :success
  end

  test "should update patient_clinic" do
    patch patient_clinic_url(@patient_clinic), params: { patient_clinic: {  } }
    assert_redirected_to patient_clinic_url(@patient_clinic)
  end

  test "should destroy patient_clinic" do
    assert_difference("PatientClinic.count", -1) do
      delete patient_clinic_url(@patient_clinic)
    end

    assert_redirected_to patient_clinics_url
  end
end
