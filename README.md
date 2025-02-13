<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OCR-Based Patient Data Extraction</title>
</head>
<body>
    <h1>OCR-Based Patient Data Extraction</h1>
    <p>This repository contains Python code that uses Optical Character Recognition (OCR) to extract patient data from images of medical forms. It processes the images, extracts specific details like pain symptoms, patient information, medical assistant inputs, and difficulty ratings, then outputs the data in JSON format. Additionally, SQL scripts are generated to help set up a database for storing the extracted information.</p>

    <h2>Prerequisites</h2>
    <p>Before running the code, you'll need to install the necessary dependencies. These dependencies include libraries for OCR processing, image manipulation, and additional utilities.</p>

    <h3>Required Libraries:</h3>
    <ul>
        <li><strong>opencv-python:</strong> Used for image processing tasks such as reading images, converting to grayscale, thresholding, and applying filters.</li>
        <li><strong>pytesseract:</strong> Python wrapper for Tesseract OCR engine, which extracts text from images.</li>
        <li><strong>numpy:</strong> Used for numerical operations like matrix manipulation.</li>
        <li><strong>matplotlib:</strong> Used to display images and visualizations.</li>
        <li><strong>heapq:</strong> Utilized to identify and handle missing numbers in the extracted text.</li>
        <li><strong>re:</strong> For regular expressions to search specific patterns in the extracted text.</li>
        <li><strong>json:</strong> For structuring the extracted data in JSON format.</li>
    </ul>

    <h3>Installation Steps:</h3>
    <p>You can install the required libraries using the following commands:</p>
    <pre>
        !pip install opencv-python-headless
        !pip install pytesseract
        !pip install numpy
        !apt-get install tesseract-ocr
        !tesseract --version
    </pre>
    <p>Alternatively, use the following command if you prefer to install the libraries via pip:</p>
    <pre>
        pip install --user pytesseract opencv-python numpy tensorflow
    </pre>
    <p>Make sure you have Tesseract OCR installed on your system, as it's needed for text recognition. You can download Tesseract from <a href="https://github.com/tesseract-ocr/tesseract" target="_blank">here</a> or use a package manager depending on your system.</p>

    <h2>Script Explanation</h2>
    <h3>Image Processing:</h3>
    <ul>
        <li><strong>Grayscale Conversion:</strong> The image is first converted to grayscale to reduce the complexity of the image data while retaining the important details for OCR. This helps to focus the recognition on the text without color distractions. The function used: <code>cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)</code>.</li>
        <li><strong>Denoising:</strong> Noise in the image (such as small distortions) can negatively affect OCR performance. Denoising techniques are used to reduce this noise. The <code>cv2.fastNlMeansDenoising()</code> function is used to remove noise while preserving important edges in the image. This results in a cleaner image and improves the accuracy of text extraction.</li>
        <li><strong>Adaptive Thresholding:</strong> Thresholding is used to convert the grayscale image into a binary image (black and white), which makes it easier for Tesseract to detect text. Adaptive thresholding is applied with the function <code>cv2.adaptiveThreshold()</code>, which dynamically adjusts pixel values based on local regions of the image, making it more robust to varying lighting conditions.</li>
        <li><strong>Sharpening:</strong> Sharpening enhances the edges and details of the image, which is helpful for improving the clarity of the text for OCR. The sharpening kernel is applied using the function <code>cv2.filter2D()</code>. The kernel used here is a common edge-enhancing filter.</li>
        <li><strong>OCR Text Extraction:</strong> After processing the image with the above methods, Tesseract OCR is used to extract text from the image. The <code>pytesseract.image_to_data()</code> function provides detailed OCR output, including bounding box coordinates for each word detected in the image.</li>
        <li><strong>Text Grouping and Line Formation:</strong> The recognized words are grouped into lines based on their vertical positioning in the image. This is done by comparing the <code>y</code> coordinates of each word, and when a large gap is detected, it assumes the end of a line.</li>
    </ul>

    <h3>Data Extraction:</h3>
    <p>The script looks for specific patient-related details in the recognized text, such as:</p>
    <ul>
        <li><strong>Patient Name:</strong> Extracted after finding the word "Patient" and the data following it.</li>
        <li><strong>Pain Symptoms:</strong> Terms like "Pain", "Numbness", "Tingling", "Burning", and "Tightness" are used to capture pain-related values from the text.</li>
        <li><strong>Additional Patient Information:</strong> Information like "DOB", "DATE", "INJECTION", "EXERCISE THERAPY", and other medical data are extracted using predefined patterns.</li>
    </ul>

    <h3>Difficulty Ratings:</h3>
    <p>The script checks for missing numbers in the lines related to difficulty ratings, such as tasks like "Bending or Stooping", "Putting on shoes", etc. It uses a heap-based approach to identify missing ratings.</p>

    <h3>Output:</h3>
    <p>The extracted data is organized into a structured format, including:</p>
    <ul>
        <li>Patient Details (Name, DOB)</li>
        <li>Treatment Details (Injection, Exercise Therapy)</li>
        <li>Pain Symptoms (Pain, Numbness, Tingling, etc.)</li>
        <li>Medical Assistant Inputs (Blood Pressure, HR, Weight, etc.)</li>
        <li>Difficulty Ratings for various tasks</li>
    </ul>
    <p>The final output is printed as a formatted JSON object.</p>

    <h3>Note:</h3>
    <p>Although not all the text in the image is read, efforts were made to extract the maximum amount of data possible. This was achieved through the following image processing techniques:</p>
    <ul>
        <li><strong>Grayscale Conversion</strong> – to reduce complexity and focus on text recognition.</li>
        <li><strong>Denoising</strong> – to remove small distortions and improve text clarity.</li>
        <li><strong>Adaptive Thresholding</strong> – to convert the image into a more readable binary format for Tesseract OCR.</li>
        <li><strong>Sharpening</strong> – to enhance the edges and details of the image for clearer text extraction.</li>
        <li><strong>OCR Text Extraction</strong> – using Tesseract OCR to convert image content into structured text.</li>
        <li><strong>Text Grouping and Line Formation</strong> – grouping recognized words into lines for easier analysis.</li>
    </ul>
    <p>These methods were applied to extract the maximum amount of information while considering image quality and the limitations of OCR technology.</p>

</body>
</html>
