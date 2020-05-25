class PostsList {
    constructor(posts) {
        this._posts = (posts || []);
    }

    _filter(parametrs){
        let filterPosts = this._posts;
        let filterParamsProps = Object.keys(parametrs);
        filterParamsProps.forEach(prop =>
        {if (parametrs[prop] instanceof Array){
            filterPosts = filterPosts.filter(post => {
                let tmp = [];
                tmp = parametrs[prop].filter(tag => post[prop].includes(tag));
                if (tmp.length !== 0) {
                    return true;
                }
            });
        }
        else if(parametrs[prop] instanceof Date){
            filterPosts = filterPosts.filter(post => post[prop].toDateString() === parametrs[prop].toDateString());
        }
        else {
            filterPosts = filterPosts.filter(post => post[prop] === parametrs[prop]);
        }
        });
        return filterPosts;
    };

    static validate(post) {
        return post.id && (typeof post.id === "string") && post.id !== '' &&
            post.description && (typeof post.description === "string") && post.description !== '' &&
            post.description.length < 200 && post.author && (typeof post.id === "string") && post.author !== '' &&
            (post.createdAt instanceof Date) && (typeof post.photoLink === "string") && (post.tags instanceof Array) &&
            (post.likes instanceof Array);
    }

    getPage(skip = 0, top = 10, filterConfig = {}) {
        let filterPosts = this._filter(filterConfig);
        filterPosts.sort((a, b) => b.createdAt - a.createdAt);
        return filterPosts.slice(skip, skip + top);
    }

    get(id) {
        return this._posts.find(post => post.id === id);
    }

    add(newPost) {
        if (PostsList.validate(newPost)) {

            if (this._posts.find(post => post.id === newPost.id)) {
                return false;
            }
            this._posts.push(newPost);
            return true;
        }
    }

    addAll(posts) {
        return posts.filter((post) => !this.add(post));
    }


    remove(id) {
        let i = this._posts.findIndex(post => post.id === id);
        if (i !== -1) {
            this._posts.splice(i, 1);
            return true;
        }
        return false;
    }

    clear() {
        this._posts = [];
    }


}

(() => {
    window.postsList = new PostsList();
})();