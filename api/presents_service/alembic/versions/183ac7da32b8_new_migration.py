"""New Migration

Revision ID: 183ac7da32b8
Revises: b7a9c1ca84bf
Create Date: 2021-10-29 06:31:01.175409

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '183ac7da32b8'
down_revision = 'b7a9c1ca84bf'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('present', sa.Column('image_origin', sa.String(length=1000), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('present', 'image_origin')
    # ### end Alembic commands ###
