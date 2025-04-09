env:
	@conda create -n neural_slicer python=3.8 -y
	@conda install -n neural_slicer uv pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch -y

install:  # [tetgen] is AGPL, [pymeshlab] is GPL
	@uv pip install tqdm numpy scipy pymeshlab pyvista tetgen trimesh einops comet_ml 

install-dev: install
	@uv pip install ruff
