from pathlib import Path
import sys
import pyvista as pv
import trimesh

from deformationOptimization import deformationOptimization

from utils.fileIO import loadTet, loadStress
from utils.argument_parsers import get_init_parser


if __name__ == "__main__":
    cmd = sys.argv
    # load kwargs
    parser = get_init_parser()
    args = parser.parse_args()

    mesh_path = Path(args.mesh_dir) / args.mesh_name
    # load mesh, cage and stress
    if args.mesh_name.endswith("tet"):
        mesh = loadTet(mesh_path)
    elif args.mesh_name.endswith("vtm"):
        mesh = pv.read(mesh_path)

    cage_path = Path(args.cage_dir) / args.cage_name
    # load cage or generate cage
    if cage_path.is_file():
        cage = trimesh.load(cage_path)
    else:
        cage = None

    stress_path = Path(args.stress_dir) / args.stress_name
    if stress_path.is_file():
        stress = loadStress(stress_path)
    else:
        stress = None

    # deformation optimization
    do = deformationOptimization(mesh, cage, stress, **vars(args))
    do.train(cmd)
