To properly format the README for GitHub, here’s the version in Markdown format. GitHub automatically renders Markdown files with proper formatting, making it ideal for use in a repository:

markdown
Copy
# OCR-Based Patient Data Extraction

This repository contains Python code that uses Optical Character Recognition (OCR) to extract patient data from images of medical forms. It processes the images, extracts specific details like pain symptoms, patient information, medical assistant inputs, and difficulty ratings, then outputs the data in JSON format. Additionally, SQL scripts are generated to help set up a database for storing the extracted information.

## Prerequisites

Before running the code, you'll need to install the necessary dependencies. These dependencies include libraries for OCR processing, image manipulation, and additional utilities.

### Required Libraries:
- **opencv-python**: Used for image processing tasks such as reading images, converting to grayscale, thresholding, and applying filters.
- **pytesseract**: Python wrapper for Tesseract OCR engine, which extracts text from images.
- **numpy**: Used for numerical operations like matrix manipulation.
- **matplotlib**: Used to display images and visualizations.
- **heapq**: Utilized to identify and handle missing numbers in the extracted text.
- **re**: For regular expressions to search specific patterns in the extracted text.
- **json**: For structuring the extracted data in JSON format.

### Installation Steps:
You can install the required libraries using the following commands:

!pip install opencv-python-headless
!pip install pytesseract
!pip install numpy
!apt-get install tesseract-ocr
!tesseract --version
Alternatively, use the following command if you prefer to install the libraries via pip:

bash
Copy
pip install --user pytesseract opencv-python numpy tensorflow
Make sure you have Tesseract OCR installed on your system, as it's needed for text recognition. You can download Tesseract from here or use a package manager depending on your system.

Script Explanation
Image Processing:
Grayscale Conversion:
The image is first converted to grayscale to reduce the complexity of the image data while retaining the important details for OCR. This helps to focus the recognition on the text without color distractions.
The function used: cv2.cvtColor(img, cv2.COLOR_BGR2GRAY).

Denoising:
Noise in the image (such as small distortions) can negatively affect OCR performance. Denoising techniques are used to reduce this noise. The cv2.fastNlMeansDenoising() function is used to remove noise while preserving important edges in the image. This results in a cleaner image and improves the accuracy of text extraction.

Adaptive Thresholding:
Thresholding is used to convert the grayscale image into a binary image (black and white), which makes it easier for Tesseract to detect text. Adaptive thresholding is applied with the function cv2.adaptiveThreshold(), which dynamically adjusts pixel values based on local regions of the image, making it more robust to varying lighting conditions.

Sharpening:
Sharpening enhances the edges and details of the image, which is helpful for improving the clarity of the text for OCR. The sharpening kernel is applied using the function cv2.filter2D(). The kernel used here is a common edge-enhancing filter.

OCR Text Extraction:
After processing the image with the above methods, Tesseract OCR is used to extract text from the image. The pytesseract.image_to_data() function provides detailed OCR output, including bounding box coordinates for each word detected in the image.

Text Grouping and Line Formation:
The recognized words are grouped into lines based on their vertical positioning in the image. This is done by comparing the y coordinates of each word, and when a large gap is detected, it assumes the end of a line.

Data Extraction:
The script looks for specific patient-related details in the recognized text, such as:

Patient Name: Extracted after finding the word "Patient" and the data following it.
Pain Symptoms: Terms like "Pain", "Numbness", "Tingling", "Burning", and "Tightness" are used to capture pain-related values from the text.
Additional Patient Information: Information like "DOB", "DATE", "INJECTION", "EXERCISE THERAPY", and other medical data are extracted using predefined patterns.
Difficulty Ratings:
The script checks for missing numbers in the lines related to difficulty ratings, such as tasks like "Bending or Stooping", "Putting on shoes", etc. It uses a heap-based approach to identify missing ratings.

Output:
The extracted data is organized into a structured format, including:

Patient Details (Name, DOB)
Treatment Details (Injection, Exercise Therapy)
Pain Symptoms (Pain, Numbness, Tingling, etc.)
Medical Assistant Inputs (Blood Pressure, HR, Weight, etc.)
Difficulty Ratings for various tasks
The final output is printed as a formatted JSON object.

Note:
Although not all the text in the image is read, efforts were made to extract the maximum amount of data possible. This was achieved through the following image processing techniques:

Grayscale Conversion – to reduce complexity and focus on text recognition.
Denoising – to remove small distortions and improve text clarity.
Adaptive Thresholding – to convert the image into a more readable binary format for Tesseract OCR.
Sharpening – to enhance the edges and details of the image for clearer text extraction.
OCR Text Extraction – using Tesseract OCR to convert image content into structured text.
Text Grouping and Line Formation – grouping recognized words into lines for easier analysis.
These methods were applied to extract the maximum amount of information while considering image quality and the limitations of OCR technology.

