<#
.SYNOPSIS
    Shows a rating message for a product.

.DESCRIPTION
    The Get-RatingMessage function takes a product name, score, max score,
    rating label and comment, and shows a message about the product.

.PARAMETER ProductName
    Product name. Mandatory. Works with pipeline.

.PARAMETER Score
    Product score from 1 to 10. Mandatory.

.PARAMETER MaxScore
    Max score. Default is 10.

.PARAMETER RatingLabel
    Standard, Excellent, Poor or Average. Default is Standard.

.PARAMETER Comment
    Comment about the product.

.EXAMPLE
    Example usage:
    PS> Get-RatingMessage -ProductName "Laptop" -Score 8 -RatingLabel "Excellent"
    Product Laptop scored 8 points. This product is doing Excellent.

.NOTES
    Author:
    Created:
    Version: 1.0
    Last Modified:
    Change Log:
        1.0 - Initial release

.LINK

#>

#Parameters

#Functions
function Get-RatingMessage {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$ProductName,

        [Parameter(Mandatory)]
        [ValidateRange(1, 10)]
        [int]$Score,

        [int]$MaxScore = 10,

        [ValidateSet("Standard", "Excellent", "Poor", "Average")]
        [string]$RatingLabel = "Standard",

        [string]$Comment
    )

    process {
        Write-Output "Product $ProductName scored $Score points. This product is doing $RatingLabel."
        Write-Output "Comment: $Comment"
    }
}

#Execution Code
Get-RatingMessage -ProductName "Laptop" -Score 8 -RatingLabel "Excellent" -Comment "Good"

"Mouse" | Get-RatingMessage -Score 5 -RatingLabel "Average" -Comment "Okay"
