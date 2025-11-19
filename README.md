# 📄 Spin Glass Models in Neural Networks

This repository contains a research paper exploring how spin glass models from statistical physics can be used to understand the loss landscapes of deep neural networks. 
While neural networks are powerful and successful, their inner workings - particularly their optimisability in high-dimensional, non-convex loss settings - are still not fully understood.
Spin glass theory offers an effective mathematical framework to examine this.

# 🔍 Overview

The paper investigates connections between:

|**Neural Networks** |	**Spin Glass Systems**|
|--------------------|------------------------|
|High-dimensional weight spaces | Configurations of interacting spins|
|Non-convex loss landscapes	| Rugged energy landscapes|
|Local minima with generalization	| Low-energy basins|
|Optimisability of deep networks	| Distribution of critical points|

# 🧪 Experimental Component

On top of the theoretical findings, the also paper includes:

- Visualisations of **loss landscapes** for neural networks trained on MNIST, examining the effect of increasing depth while **keeping the number of parameters fixed**.

  This visualisation was generated using modified code from

  > Loss Landscapes by Marcello de Bernardi (https://github.com/marcellodebernardi/loss-landscapes)

- Empirical comparison between the **loss landscape of a neural network** and the **energy landscape of a spin glass model**, demonstrating structural similarity.

![landscape comparison](./plots/comparison.png "landscape comparison")

# 📌 Abstract

> Neural networks have proven to be powerful and flexible models that generalise well even in over-parameterised regimes. 
However, their optimisation properties remain poorly understood from a theoretical perspective. 
This work explores the role of spin glass models in explaining the structure of neural network loss landscapes, 
covering both theoretical results and empirical evidence supporting the link.

# 🔗 Citation

If you reference this paper in your work, you may cite it as:
```bibtex
@misc{spin_glass_nn,
  title   = {Spin Glass Models in Neural Networks},
  author  = {Robert Shanahan},
  year    = {2025},
}
```









