function(resp){
     const myJson = resp;
     const findEquals = myJson.reduce((acc, pet) => {
       acc[pet.name] = ++acc[pet.name] || 0;
       return acc;
     },{});
     const duplicate = myJson.filter( (pet) => {
      	return findEquals[pet.name];
     });
     const nameDuplicate = duplicate[0].name;
     const count = duplicate.length;
     return "{"+nameDuplicate+": "+count+"}";
}