import re
from flask import Flask, request, jsonify
import easyocr
import spacy
import os
import math

app = Flask(__name__)

def extract_text_from_receipt(image_path):
    # Create an OCR reader
    reader = easyocr.Reader(['en'], gpu=True)  

    # Read text from the image
    result = reader.readtext(image_path)

    # Extract and concatenate the detected text
    extracted_text = ' '.join([entry[1] for entry in result])

    return extracted_text

def extract_entities(text):
    # Load the English language model
    nlp = spacy.load("en_core_web_sm")

    # Process the text with spaCy
    doc = nlp(text)

    # Extract named entities
    entities = [(ent.text, ent.label_) for ent in doc.ents]

    return entities

def extract_first_word_heading(text):
    # Split the text into lines
    lines = text.split('\n')

    # Iterate through the lines to find the first heading
    for line in lines:
        # Adjust the condition based on the format of headings in your receipts
        if line.strip():  # Check if the line is not empty
            # Extract the first word from the heading
            first_word = re.match(r'\b(\w+)\b', line.strip()).group(1)
            return first_word  # Return the first word of the heading

    return None  # Return None if no heading is found
def extract_total_money(text):
    # Define regular expression pattern to find total money
    # Modify this pattern based on the format of the total amount in your receipts
    pattern = r'Total\s*\S([\d,]+\.\d{2})'  # Assuming the total amount is in the format: Total: $xxx.xx

    # Search for the pattern in the text
    match = re.search(pattern, text, re.IGNORECASE)

    if match:
        return match.group(1)  # Return the matched total amount
    else:
        return None

@app.route('/process_receipt', methods=['POST'])
def process_receipt():
    # Check if a file is included in the request
    if 'file' not in request.files:
        return jsonify({'error': 'No file included in the request'}), 400
    
    file = request.files['file']

    # Check if the file is empty
    if file.filename == '':
        return jsonify({'error': 'No file selected'}), 400

    # Save the uploaded file to a temporary location
    file_path = 'temp.jpg'
    file.save(file_path)

    # Extract text from the receipt image
    extracted_text = extract_text_from_receipt(file_path)
    total_money = extract_total_money(extracted_text)
    total_money = float(total_money);
    math.ceil(total_money);
    total_money = int(total_money);
    # Extract named entities from the text
    entities = extract_entities(extracted_text)

    # Extract the first word of the heading from the text
    first_word_heading = extract_first_word_heading(extracted_text)

    # Delete the temporary file
    os.remove(file_path)

    # Return the extracted information as JSON response
    response = {
        'extracted_text': extracted_text,
        'named_entities': entities,
        'money':total_money,
        'first_word_heading': first_word_heading
    }
    print(response)

    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
