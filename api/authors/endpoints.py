"""Routes for module authors"""
import os
from flask import Blueprint, jsonify, request
from helper.db_helper import get_connection
from helper.form_validation import get_form_data
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import declarative_base
from models.author import Author

from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.jwt_helper import get_roles

authors_endpoints = Blueprint('authors', __name__)
UPLOAD_FOLDER = "img"
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+mysqlconnector://root:@localhost/db_library')
Base = declarative_base()

# Create tables based on the model
Base.metadata.create_all(engine)

@authors_endpoints.route('/read', methods=['GET'])
@jwt_required()
def read():
    """Routes for module get list authors"""
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    select_query = "SELECT * FROM tb_authors"
    cursor.execute(select_query)
    results = cursor.fetchall()
    cursor.close()  # Close the cursor after query execution
    return jsonify({"message": "OK", "datas": results}), 200

@authors_endpoints.route('/create', methods=['POST'])
@jwt_required()
def create():
    """Routes for module create a author"""
    # Create a session
    Session = sessionmaker(bind=engine)
    session = Session()
    required = get_form_data(["first_name"])  # use only if the field required
    first_name = required["first_name"]
    last_name = request.form['last_name']

    connection = get_connection()
    # cursor = connection.cursor()
    # insert_query = "INSERT INTO tb_authors (first_name, last_name) VALUES (%s, %s)"
    # request_insert = (first_name, last_name)
    # cursor.execute(insert_query, request_insert)
    # connection.commit()  # Commit changes to the database
    # cursor.close()
    new_author = Author(first_name=first_name, last_name=last_name)
    session.add(new_author)
    session.commit()
    return jsonify({"first_name": first_name, "last_name": last_name, "message": "Inserted", "author_id": "test"}), 201
    # new_id = cursor.lastrowid  # Get the newly inserted author's ID\
    # if new_id:
        # return jsonify({"first_name": first_name, "last_name": last_name, "message": "Inserted", "author_id": new_id}), 201
    # return jsonify({"message": "Cant Insert Data"}), 500

@authors_endpoints.route('/update/<author_id>', methods=['PUT'])
@jwt_required()
def update(author_id):
    """Routes for module update a author"""
    first_name = request.form['first_name']
    last_name = request.form['last_name']

    connection = get_connection()
    cursor = connection.cursor()

    update_query = "UPDATE tb_authors SET first_name=%s, last_name=%s WHERE author_id=%s"
    update_request = (first_name, last_name, author_id)
    cursor.execute(update_query, update_request)
    if cursor.rowcount == 0:
        return jsonify({"err_message": "Data not updated"}), 400

    connection.commit()
    cursor.close()
    data = {"message": "updated", "author_id": author_id}
    return jsonify(data), 200

@authors_endpoints.route('/delete/<author_id>', methods=['DELETE'])
@jwt_required()
def delete(author_id):
    """Routes for module to delete a author"""
    connection = get_connection()
    cursor = connection.cursor()

    delete_query = "DELETE FROM tb_authors WHERE author_id = %s"
    delete_id = (author_id,)
    cursor.execute(delete_query, delete_id)
    if cursor.rowcount == 0:
        return jsonify({"err_message": "Data not deleted"}), 400
    
    connection.commit()
    cursor.close()
    data = {"message": "Data deleted", "author_id": author_id}
    return jsonify(data)