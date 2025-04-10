# [Neural Slicer for Multi-Axis 3D Printing](https://RyanTaoLiu.github.io/NeuralSlicer)

![](DataSet/figures/teaser.jpg)

[Tao Liu](https://www.linkedin.com/in/tao-liu-730942225), [Tianyu Zhang](https://www.linkedin.com/in/tianyu-zhang-49b8231b5/), Yongxue Chen, Yuming Huang, and [Charlie C.L. Wang](https://mewangcl.github.io/), [*ACM Transactions on Graphics (SIGGRAPH 2024)*, vol.43, no.4(15 pages), July 2024](https://doi.org/10.1145/3658212)

[Arxiv Paper](http://arxiv.org/abs/2404.15061)

## Abstract
We introduce a novel neural network-based computational pipeline as a representation-agnostic slicer for multi-axis 3D printing. This advanced slicer can work on models with diverse representations and intricate topology. The approach involves employing neural networks to establish a deformation mapping, defining a scalar field in the space surrounding an input model. Isosurfaces are subsequently extracted from this field to generate curved layers for 3D printing. Creating a differentiable pipeline enables us to optimize the mapping through loss functions directly defined on the field gradients as the local printing directions. New loss functions have been introduced to meet the manufacturing objectives of support-free and strength reinforcement. Our new computation pipeline relies less on the initial values of the field and can generate slicing results with significantly improved performance. [Video Link](https://www.youtube.com/watch?v=qNm1ierKuUk)

![](DataSet/figures/pipline.jpg)

## Installation

To create and config the Python environment:
- Run `make env`
- Run `make install-dev`

To be able to run demos, let's also get some data files downloaded:
- Download datafiles from [Google Drive](https://drive.google.com/drive/folders/19bvwt9CdLHqdVBGZUZ3-ex9OD24y7bOu?usp=sharing)
and add to a `data` directory.

### Explanation of data files

**Inputs:**
- Model file tet-files in `data/TET_MODEL`,
- Cage file obj-files in `data/cage`, 
- FEA output file (using Voigt notation) txt-files in `data/fem_result`. 

**Outputs:**
Results live in in `data/results/{exp_name}/{date_time}`, where:
- *.obj shows the deformed boundary of models and cages
- *.txt shows the new position of points in models or cages (can be read by S3Slicer)
- *.ckpt is the check point file for neural network parameters.

## Examples

### Step 1: Cage-based Field Generation
Printing direction field optimisation via Neural Slicer: `make test`

### Step 2: Cage-based layers Generation [TO REVIEW]
Then achieve the cage-based layers by S^3-Slicer.
And remesh via meshlab, more details in the project [S^3-Slicer](https://github.com/zhangty019/S3_DeformFDM)

### Step 3: Model-based layers Generation [TO REVIEW]
Run the following code to get the final layers by boolean.
```
uv run python ./utils/slicer_cut_by_implicitFunction.py
```

![](DataSet/figures/printingResult.jpg)
## Reference
+ Tao Liu, Tianyu Zhang, Yongxue Chen, Yuming Huang, and Charlie C. L. Wang. 2024. Neural Slicer for Multi-Axis 3D Printing. ACM Transactions on Graphics, vol.43, no.4, Article 85 (15 pages), July 2024.

+ Tianyu Zhang, Yuming Huang, Piotr Kukulski, Neelotpal Dutta, Guoxin Fang, and Charlie C.L. Wang, "Support generation for robot-assisted 3D printing with curved layers", IEEE International Conference on Robotics and Automation (ICRA 2023), London, United Kingdom, May 29 - June 2, 2023.

+ Guoxin Fang, Tianyu Zhang, Sikai Zhong, Xiangjia Chen, Zichun Zhong, and Charlie C.L. Wang, "Reinforced FDM: Multi-axis filament alignment with controlled anisotropic strength", ACM Transactions on Graphics (SIGGRAPH Asia 2020), vol.39, no.6, article no.204 (15 pages), November 2020.

+ Tianyu Zhang, Guoxin Fang, Yuming Huang, Neelotpal Dutta, Sylvain Lefebvre, Zekai Murat Kilic, and Charlie C. L. Wang. 2022. S3-Slicer: A General Slicing Framework for Multi-Axis 3D Printing. ACM Transactions on Graphics (SIGGRAPH Asia 2022), vol.41, no.6, Article 204 (15 pages), December 2022.
## Contact Information
Tao Liu      (tao.liu@manchester.ac.uk)

Tianyu Zhang (tianyu.zhang-10@postgrad.manchester.ac.uk)

Charlie C.L. Wang (changling.wang@manchester.ac.uk)
