function(resp){
    const myJson = resp;
    const data = []
    const object = {}
    for (var i = 0; i < myJson.length; i++) {
        const id = myJson[i].id
        const name = myJson[i].name
        data.push({
            "id": id,
            "name": name
        });
    }
    return object.data = data;
}