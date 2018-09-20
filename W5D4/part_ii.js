function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes phrrr.`)
}

Elephant.prototype.grow = function() {
  this.height = this.height + 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  trickIndex = Math.floor(Math.random * this.tricks.length)
  console.log(`${this.name} is ${this.tricks[trickIndex]}`)
}

Elephant.paradeHelper = function(name) {
  console.log(`${this.name} is trotting by.`);
}

function dinnerBreakfast() {
  let order = "I'd like oatmeal and tost";
  console.log(order);

  return function(food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  }
}
