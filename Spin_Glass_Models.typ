#let title = [
  *Spin Glass Models in Neural Networks*
]

#set page(
  header: align(
    right + horizon,
    title
  ),
  numbering: "1",
  columns: 2,
)

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #align(center, text(17pt)[
    *#title*
  ])
  #par(justify: false)[
    *Abstract* \
    Neural networks have been the focus of the most exciting research for over a decade in the field of machine learning. They have proven to be an incredibly powerful and flexible model that generalizes well even in an over-parameterised setting. However, as powerful as it is, we are still struggling to understand their inner-workings. This paper explores the advancements made in this endevour through the use of the spin glass model taken from statistical physics.
  ]
]

== Introduction
While neural networks are incredibly powerful, they are very difficult for a human to interperate and many optimisation techniques still only come from empirical evidence instead of theoretical justification. The relationship between spin glass models and neural networks was recognised in the very early stages of the existance of neural networks @amit1985spin. While there has been progress in analyzing how deep neural networks (DNNs) work mathematically @becker2018geometry, our understanding remains incomplete. In this project I will discuss the involvement of the spin glass model in aiding explainability and optimisation in DNNs. We can take advantage of the spin glass' non-convex nature to understand why DNNs are so easily optimizable despite their also non-convex loss landscape while still using something as simple as gradient decent.


== Background
While this approach to viewing, understanding and optimising neural networks is relatively niche, I still think it offers meaningful insight into the mechanics of such a system through the network's loss landscape. The loss landscape of a neural network is, put simply, a mapping of each possible weight configuration to a corresponding loss value. Naturally, it would be infeasible to model and then test every single variation of weights to find the one that gives of the best performance, so we must find a method that can both find a minimum training loss with the hope of also having good generalisation, and also be effective at doing so. The problem is a loss landscape is non-convex and most of the time in very high dimensions, therefore making it a complex problem to solve. Yet, minimising the loss function has been empirically very tractable @liao2024exploring. Simple algorithms such as stochastic gradient descent and Adam are commonly used which raises a key question: why is such a complex problem so easy to solve?

To answer this question we must look toward the physical spin glass magnet, a spin glass is a disordered magnetic system with randomly interacting spins, resulting in a rugged energy landscape with many local minima. 
This type of landscape is similar to that of a neural network’s loss surface, which comes from the non-convex nature of objective functions (e.g. cross-entropy, mean squared error, etc.) and overparameterization. In particular, the p-spin (also refered to as H-spin) spherical spin glass model provides a useful analogy for understanding the geometry and critical points of these loss landscapes.

By modeling a neural network's loss landscape using a p-spin spherical spin glass, we can study the optimization process from a statistical physics perspective. Under assumptions such as parameter redundancy, independence of variables, and uniformity, the neural network’s loss function becomes analogous to the Hamiltonian of a spin glass system @choromanska2015loss.

== Theoretical Findings
The earliest attempts to mathematically understand the optimistion problem of a non-convex loss function through the use of spin glass models was @choromanska2015loss. By modeling the loss landscape using a spin glass we can describe the landscape in terms of energy levels, from the ground state $E_0(H)$ (the global minimum) to the energy barrier $E_(infinity)(H)$, defined by:

$ E_(infinity)(H) = 2 sqrt((H-1)/H) $

where $H$ is the dimensionality of the system. Critical points with energy higher than $E_(infinity)(H)$ are exponentially likely to be high index saddle points @dauphin2014identifying. Within the band $(-Lambda E_0(H), -Lambda E_(infinity)(H))$, where $Lambda$ is given in *Definition 3.1* of @choromanska2015loss, the probability of the existence of a saddle point rapidly approaches zero as the dimensionality increases. This implies that local minima are more densely located in this region.

In practice, the goal is not to find the global minimum—doing so becomes exponentially more difficult as network size increases and may lead to overfitting—but rather to identify a good local minimum that generalizes well. Spin glass theory provides an effective framework for understanding why stochastic gradient descent often converges to such solutions.

Spin glass theory has also enabled us to understand more about the role of network depth. Shallow neural networks have been shown to be just as effective as DNNs in their accuracy @ba2014do, however the differences between the two lies in their optimisability. Allowing depth to vary while fixing the number of parameters in place, we see that minima start to coagulate together and the trade-off between the width and depth of minima becomes weaker as the depth increases @becker2018geometry. We can also see the number of critial points N, as described in *Equation 5* of @becker2018geometry

$ N = ((H-1)^(Lambda) - 1)/(H-2) $

is non-monotonic, meaning at a certain depth, the number of critical points starts to decrease giving the minimisor less "bad" critical points to potentially land on instead of a good local minimum. Because of this, the fact that minima become more clustered with wider basins, deeper networks become much easier to optimise than shallower networks even though accuracy may not change with depth.

== Experimental Findings
An experiment was carried out to confirm the theoretical proposal that increasing the depth of the network while keeping the number of parameters the same would eliminate "bad minima" and also increase the width of minima's basin. For this experiment I modified an example script for visualsation taken from @becker2018geometry in order to visualise the landscape, using the MNIST dataset to train the model. For implemenation details, see @debernardi_loss_landscapes. As seen in @hidden_layers the loss landscape formed with only one hidden layer is jagged with narrow minima, however when the depth of the neural network increases, the landscape becomes smoother and the minima become much broader. This aligns empirically with the theoretical findings of @liao2024exploring.

#place(
  top+center,
  float: true,
  scope: "parent",
  clearance: 1em
)[
  #figure(
    grid(
      columns: (1fr, 1fr, 1fr), 
      gutter: 1em,
      image("plots/1_hidden.png"),
      image("plots/5_hidden.png"),
      image("plots/10_hidden.png"),
    ),
    caption:[The difference in smoothness in loss landscapes between neural networks with different depths is very evident when comparing the network with one hidden layer (leftmost figure) and the networks with five and ten hidden layers (middle and rightmost figure respectively)],
  )<hidden_layers>
]

In @landscape, we see the empirical evidence of the similarities between the p-spin spherical spin glass model's energy landscape and the loss landscape of neural networks. Using the sklearn linnerud dataset, we can see that it produces a complex lanscape for both the neural network (while it is very subtle there are two minima in the loss landscape plot with a maxima splitting them through the middle) and the spin glass model. By proving that they both are non-convex we can also say that they share multiple other properties such as the minima band and the exponential growth of critical points as the system increases.



#place(
  top+center,
  float: true,
  scope: "parent",
  clearance: 1em
)[
  #figure(
    image("plots/comparison.png"),
    caption:[The similarity between the energy landscape of the spin glass model and the loss landscape of a neural network. We can see that they both have complex, non-convex landscapes which implies similar properties.],
  )<landscape>
]

== Conclusion
In summary I have explored how, through the application of spin glass theory, we can understand more about neural networks and their optimisability because of the similarities in the spin glass model's energy landscape and the neural network's loss landscape which can be seen in @landscape showing both of their non-convexities and complex landscapes. I have shown that, according to spin glass theory minima are confined within a band. Higher than this band, the frequency of minima decreases exponentially as the number of saddle points start to increase exponentially @choromanska2015loss. I also showed that, while initially the number of critical points increases when the depth of the network increases, it begins to decrease with more depth allowing the network to optimise easier as there is less saddle points for the optimiser to get stuck on. The minima also broaden as the network deepens which can be seen in @hidden_layers.

#bibliography("references.bib", title: "References")
