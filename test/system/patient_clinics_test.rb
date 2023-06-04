require "application_system_test_case"

class PatientClinicsTest < ApplicationSystemTestCase
  setup do
    @patient_clinic = patient_clinics(:one)
  end

  test "visiting the index" do
    visit patient_clinics_url
    assert_selector "h1", text: "Patient clinics"
  end

  test "should create patient clinic" do
    visit patient_clinics_url
    click_on "New patient clinic"

    click_on "Create Patient clinic"

    assert_text "Patient clinic was successfully created"
    click_on "Back"
  end

  test "should update Patient clinic" do
    visit patient_clinic_url(@patient_clinic)
    click_on "Edit this patient clinic", match: :first

    click_on "Update Patient clinic"

    assert_text "Patient clinic was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient clinic" do
    visit patient_clinic_url(@patient_clinic)
    click_on "Destroy this patient clinic", match: :first

    assert_text "Patient clinic was successfully destroyed"
  end
end
