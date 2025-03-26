// Copyright (c) Microsoft. All rights reserved.

using System;
using System.Text.Json.Serialization;

namespace Microsoft.SemanticKernel;

/// <summary>
/// Represents Document content.
/// </summary>
public class DocumentContent : BinaryContent
{
    public string Filename { get; init; }

    /// <summary>
    /// Initializes a new instance of the <see cref="DocumentContent"/> class.
    /// </summary>
    [JsonConstructor]
    public DocumentContent()
    {
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="DocumentContent"/> class.
    /// </summary>
    /// <param name="dataUri">DataUri of the image</param>
    /// <param name="filename"></param>
    public DocumentContent(string dataUri, string filename) : base(dataUri)
    {
        this.Filename = filename;
    }
}
