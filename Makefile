env:
	@conda create -n neural_slicer python=3.11 -y
	@conda install -n neural_slicer pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch -y

rmenv:
	@conda remove -n neural_slicer --all -y

install:  # [tetgen] is AGPL, [pymeshlab] is GPL
	@uv pip install tqdm numpy scipy pymeshlab pyvista tetgen trimesh einops comet_ml 

install-dev: install
	@uv pip install ruff

lint:               ## Run black, isort, mypy, and other code checks.
	@ruff check --fix
	@ruff format .

test: 
	python main.py --exp_name spiral_fish --mesh spiral_fish.tet --cage None --stress None --wSF 1 --wSR 0 --wSQ 0 --wOP 0 --wRigid 100 --wConstraints 5 --wScaling 10 --wQuaternion 10 --nstep 5000 --wQuaternion 0.01 --lock_bottom --beta 2