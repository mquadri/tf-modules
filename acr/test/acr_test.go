package test

import (
	"testing"
	"os"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAcrModule(t *testing.T) {
	t.Parallel()

	// Configure Terraform options
	terraformOptions := &terraform.Options{
		// Path to your Terraform code that you want to test
		TerraformDir: "../examples",
		VarFiles:     []string{"deploy.tfvars"},
	}

	// At the end of the test, clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply the Terraform code
	terraform.InitAndApply(t, terraformOptions)

	// Verify the outputs
	acrName := terraform.Output(t, terraformOptions, "acr_name")
	acrResourceId := terraform.Output(t, terraformOptions, "acr_resource_id")
	
	// Validate outputs
	assert.NotEmpty(t, acrName, "ACR name should not be empty")
	assert.NotEmpty(t, acrResourceId, "ACR resource ID should not be empty")
	
	// You can add more assertions based on your expected values
}

func TestAcrModuleWithPrivateEndpoint(t *testing.T) {
	// Skip this test if running in CI environment without proper Azure credentials
	if os.Getenv("CI") != "" {
		t.Skip("Skipping test in CI environment")
	}
	
	t.Parallel()

	// Configure Terraform options
	terraformOptions := &terraform.Options{
		// Path to your Terraform code that you want to test
		TerraformDir: "../examples",
		VarFiles:     []string{"private_endpoint.tfvars"},
	}

	// At the end of the test, clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply the Terraform code
	terraform.InitAndApply(t, terraformOptions)

	// Verify the outputs
	privateEndpoints := terraform.OutputMap(t, terraformOptions, "private_endpoints")
	
	// Validate outputs
	assert.NotEmpty(t, privateEndpoints, "Private endpoints should not be empty")
}

func TestAcrModuleWithGeoReplication(t *testing.T) {
	// Skip this test if running in CI environment without proper Azure credentials
	if os.Getenv("CI") != "" {
		t.Skip("Skipping test in CI environment")
	}
	
	t.Parallel()

	// Configure Terraform options
	terraformOptions := &terraform.Options{
		// Path to your Terraform code that you want to test
		TerraformDir: "../examples",
		VarFiles:     []string{"geo_replication.tfvars"},
	}

	// At the end of the test, clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply the Terraform code
	terraform.InitAndApply(t, terraformOptions)

	// Add assertions specific to geo-replication
}

func TestAcrModuleWithNetworkRules(t *testing.T) {
	// Skip this test if running in CI environment without proper Azure credentials
	if os.Getenv("CI") != "" {
		t.Skip("Skipping test in CI environment")
	}
	
	t.Parallel()

	// Configure Terraform options
	terraformOptions := &terraform.Options{
		// Path to your Terraform code that you want to test
		TerraformDir: "../examples",
		VarFiles:     []string{"network_rules.tfvars"},
	}

	// At the end of the test, clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply the Terraform code
	terraform.InitAndApply(t, terraformOptions)

	// Add assertions specific to network rules
}
