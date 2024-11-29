from sqlalchemy import Column, Integer, String, TIMESTAMP, Index
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql import func

Base = declarative_base()

class Author(Base):
    __tablename__ = 'tb_authors'

    author_id = Column(Integer, primary_key=True, autoincrement=True)
    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    created_at = Column(TIMESTAMP, nullable=False, default=func.current_timestamp())
    updated_at = Column(TIMESTAMP, nullable=False, default=func.current_timestamp(), onupdate=func.current_timestamp())
    deleted_at = Column(TIMESTAMP, nullable=True, default=None)

    __table_args__ = (
        Index('tb_authors_last_name_index', 'last_name', mysql_using='BTREE'),
        {'comment': 'Store the master data for The authors of books', 'mysql_collate': 'utf8mb4_general_ci'}
    )
