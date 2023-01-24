# Upload file using Minimal APIs

## Upload-file

``` cs title="Program.cs"

app.MapPost("/upload-file", async (IformFile file) => {
    var fileName = "MyFile.jpg";

    using var stream = File.OpenWrite(fileName);

    await file.CopyToAsync(stream);

    return fileName;
});

```
