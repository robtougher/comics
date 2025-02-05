

$imageDescriptions = ls descriptions/*.txt
$fileNameForAllText = "all.txt"
$filePathForAllText = "descriptions/all.txt"


$allText = ""

foreach ($imageDescription in $imageDescriptions)
{
    if($imageDescription.Name -ne $fileNameForAllText)
    {
        $allText += "`n"
        $allText += "`n"
        $allText += $imageDescription.Name
        $allText += "`n"
        $allText += "`n"

        $allText += get-content $imageDescription.VersionInfo.FileName -Raw
        $allText += "`n"
        $allText += "`n"
    }
    else
    {
        ("Skipping: " + $imageDescription.Name)
    }
}


"Writing to: $filePathForAllText"
$allText | Set-Content -Path $filePathForAllText

