env:
	@uv venv --python 3.11.11

rmenv:
	@rm -rf .venv

install:  # [tetgen] is AGPL, [pymeshlab] is GPL
	@uv pip install torch tqdm numpy scipy pymeshlab pyvista tetgen trimesh einops comet_ml 

install-dev: install
	@uv pip install ruff

lint:               ## Run black, isort, mypy, and other code checks.
	@ruff check --fix
	@ruff format .

test: 
	uv run python main.py --exp_name spiral_fish --mesh spiral_fish.tet --cage None --stress None --wSF 1 --wSR 0 --wSQ 0 --wOP 0 --wRigid 100 --wConstraints 5 --wScaling 10 --wQuaternion 10 --nstep 5000 --wQuaternion 0.01 --lock_bottom --beta 2