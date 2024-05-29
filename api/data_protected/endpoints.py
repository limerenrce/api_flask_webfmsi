"""Routes for module protected endpoints"""
from flask import Blueprint, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity


protected_endpoints = Blueprint('data_protected', __name__)


@protected_endpoints.route('/data', methods=['GET'])
@jwt_required()
def get_data():
    """
    Routes for demonstrate protected data endpoints, 
    need jwt to visit this endpoint
    """
    current_user = get_jwt_identity()
    return jsonify({"message": "OK", "user_logged": current_user['username']}), 200
