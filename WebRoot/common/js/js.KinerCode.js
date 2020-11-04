/**
 * 纯js验证码校验
 * Created by kiner on 15/3/26.
 */
function KinerCode(options) {

    this.opt = this.extend(true, this.options, options);


    this.opt.chars = (this.opt.chars && this.opt.chars.length == 0) ? this.options.chars : this.opt.chars;

    //背景图优先级最高，用户指定背景颜色优先级次之，随机背景颜色优先级最低
    this.opt.bg = (this.opt.bgImg && this.opt.bgImg.length != 0) ? "url('" + this.opt.bgImg + "')" : this.options.bgColor;

    //当验证码是算术题形式时，先计算出算式的结果并保存与answer数组中
    if(this.opt.question){
        this.answer = [];
        for(var i=0;i<this.opt.chars.length;i++){
            this.answer.push(eval(this.opt.chars[i]));
        }
    }
    //插件初始化
    this.init();
    //绑定事件
    this.bind();

}

/**
 * 初始化，创建验证码元素
 */
KinerCode.prototype.init = function () {

    var self = this;

    if(!this.body){
        this.body = document.createElement('div');
    }else{
        this.body.innerHTML = '';
    }

    //当用户选择禁止复制验证码中文字时执行，禁用验证码区域及验证码输入框的复制、选中、右键菜单等操作
    if (!self.copy) {
        doProhibit();
    }

    //创建验证码
    this.myCode = this.createCode();
    //console.log(this.myCode);

    //创建验证码项元素并添加进其盒子中
    var len = this.myCode.arrCode.length;

    for (var i = 0; i < len; i++) {
        var item = this.createCodeEle(this.myCode.arrCode[i]);
        this.body.appendChild(item);
    }

    //为验证码盒子设置样式
    //this.body.style.background = this.opt.randomBg ? this.toRGB().background : this.opt.bg;
    //this.body.style.backgroundPosition = 'center';
    //this.body.style.backgroundSize = 'cover';
    //this.body.style.overflow = 'hidden';
    //this.body.style.width = '100%';
    //this.body.style.height = '100%';
    //this.body.style.lineHeight = '100%';
    //this.body.style.cursor = 'pointer';

    //alert(this.createCode().strCode);

    //禁止复制
    function doProhibit() {
        if (window.Event)
            document.captureEvents(Event.MOUSEUP);

        function nocontextmenu() {
            event.cancelBubble = true;
            event.returnvalue = false;
            return false;
        }

        function norightclick(e) {
            if (window.Event) {
                if (e.which == 2 || e.which == 3)
                    return false;
            }
            else if (event.button == 2 || event.button == 3) {
                event.cancelBubble = true
                event.returnvalue = false;
                return false;
            }
        }

        function select() {
            return false;
        }

        self.body.oncontextmenu = nocontextmenu;
        self.body.onmousedown = norightclick;
        self.body.onselectionstart = select;
        self.body.oncopy = function () {
            return false;
        };
        self.body.oncut = function () {
            return false;
        };
        self.opt.inputArea.style.imeMode = 'disabled';
        self.opt.inputArea.onpaste = function () {
            return false;
        };
        self.opt.inputArea.oncontextmenu = nocontextmenu;
        self.opt.inputArea.onmousedown = norightclick;
        self.opt.inputArea.onselectionstart = select;
        setSelectable(self.body, false);

    }

    this.opt.codeArea.appendChild(this.body);


    // 参数 obj: 要禁止选中文本的元素的jquery对象
    // 参数 enabled: true, 可选中; false, 不可选中
    function setSelectable(obj, enabled) {


        if (enabled) {
            obj.removeAttribute("unselectable");
            obj.removeAttribute("onselectstart");
            obj.style["-moz-user-select"] = '';
            obj.style["-webkit-user-select"] = "";
        } else {
            obj.setAttribute("unselectable", "on");
            obj.setAttribute("onselectstart", "return false;");
            obj.style["-moz-user-select"] = 'none';
            obj.style["-webkit-user-select"] = "none";
        }
    }


};

/**
 * 刷新验证码操作
 */
KinerCode.prototype.refresh = function () {

    this.init();
};

/**
 * 绑定事件
 */
KinerCode.prototype.bind = function () {

    var self = this;

    //刷新验证码
    if (self.opt.click2refresh) {
        self.bindHandler(self.body,'click',function(){
            self.refresh();
        });
    }

    /**
     * 绑定验证回调函数
     */
    self.bindHandler(self.opt.inputArea,self.opt.validateEven,function(){

        self.opt.validateFn.call(self,self.validate(),self.myCode);
        if(self.opt.false2refresh && !self.validate()){
            self.refresh();
            self.opt.inputArea.focus();
            self.opt.inputArea.select();
        }
    });



};

/**
 * 绑定事件方法
 * @param elem
 * @param type
 * @param handler
 */
KinerCode.prototype.bindHandler = function(elem, type, handler) {
    if (window.addEventListener) {// 标准浏览器
            elem.addEventListener(type, handler, false);
    } else if (window.attachEvent) {// IE浏览器
            elem.attachEvent("on" + type, handler);
    }
};

/**
 * 验证输入是否正确
 * @returns {boolean}
 */
KinerCode.prototype.validate = function(){

    if(!this.opt.question)
    return this.myCode.strCode.toLowerCase().trim()==this.opt.inputArea.value.toLowerCase().trim();
    else
    return parseFloat(this.myCode.answer) === parseFloat(this.opt.inputArea.value.trim());

};

/**
 * 根据传进来的验证码项创建元素
 * @param code
 * @returns {HTMLElement}
 */
KinerCode.prototype.createCodeEle = function (code) {
    var item = document.createElement('span');
    item.innerHTML = code;
    item.style.color = this.toRGB().color;
    item.style.textAlign = 'center';
    item.style.height = '100%';
    item.style.lineHeight = this.opt.codeArea.offsetHeight + 'px';
    //item.style.margin = '0 2%';
    if(!this.opt.question){
        item.style.width = 90 / this.opt.len + '%';
    }else{

        item.style.width = '100%';
    }

    item.style.padding = '0 1%';
    item.style.fontSize = '1.5em';
    item.style.display = 'inline-block';
    return item;

};

/**
 * //产生随机颜色的函数，可以产生随机的背景色和前景色（也就是字体的颜色）
 * @returns {{background: string, color: string}}
 */
KinerCode.prototype.toRGB = function () {
    var str = "", str2 = "";
    var num = [], strs2 = [], strs = [];
    var i = 0;

    for (i = 0; i < 3; i++) {
        num.push(parseInt(Math.random() * 255));
    }
    for (i = 0; i < num.length; i++) {
        strs.push(num[i].toString(16));
        strs2.push((255 - num[i]).toString(16))
    }
    for (i = 0; i < strs.length; i++) {
        str += strs[i];
        str2 += strs2[i];
    }

    var rgb = {

        background: '#' + str,
        color: '#' + str2

    };
    return rgb;
};

/**
 * 根据验证码类型及长度创建验证码
 * @returns {{strCode: string, arrCode: Array, answer: string}}
 */
KinerCode.prototype.createCode = function () {
    var str = "";
    var codes = [];
    var char;
    var self = this;
    var answer = '';
    if(this.opt.question){

        var c = parseInt(Math.random() * self.opt.chars.length);
        char = self.opt.chars[c];
        str  = char;
        answer = this.answer[c];
        codes.push(char);
    }else{
        for (var i = 0; i < self.opt.len; i++) {
            var c = parseInt(Math.random() * self.opt.chars.length);
            char = self.opt.chars[c];
            str += char;
            codes.push(char);
        }
    }
    return this.myCode = {
        strCode: str,
        arrCode: codes,
        answer : answer
    };

};
/**
 * 默认选项
 * @type {{len: number, chars: *[], copy: boolean, bgColor: string, bgImg: string, randomBg: boolean, inputArea: string, codeArea: string, click2refresh: boolean, validateEven: string, validateFn: Function}}
 */
KinerCode.prototype.options = {
    len: 4,//需要产生的验证码长度
    chars: [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 0,
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    ],//指定产生验证码的词典，若不给或数组长度为0则试用默认字典
    copy: false,//是否允许复制产生的验证码

    bgColor: "#222222",//背景颜色[与背景图任选其一设置]
    bgImg: "",
    randomBg: false,//若选true则采用随机背景颜色，此时设置的bgImg和bgColor将失效
    inputArea: "",//输入验证码的input对象绑定【  HTMLInputElement 】
    codeArea: "",//验证码放置的区域【  HTMLDivElement 】
    click2refresh: true,//是否点击验证码刷新验证码
    validateEven : "",//触发验证的方法名，如click，blur等
    validateFn : function(result,strCode){

    }
};

/**
 * 扩展对象方法
 * @param flag
 * @param destination
 * @param source
 * @returns {*}
 */
KinerCode.prototype.extend = function (flag, destination, source) {
    if (flag) {
        var obj = {};

        for (var property in destination) {
            obj[property] = destination[property];
        }
        for (var property in source) {
            obj[property] = source[property];
        }


        return obj;


    } else {
        for (var property in source)
            destination[property] = source[property];
        return destination;
    }
};







    var inp = document.getElementById('inputCode');
    var code = document.getElementById('code');

    var inp2 = document.getElementById('inputCode2');
    var code2 = document.getElementById('code2');

    var c = new KinerCode({
        len: 4,//需要产生的验证码长度
//        chars: ["1+2","3+15","6*8","8/4","22-15"],//问题模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
        chars: [
            1, 2, 3, 4, 5, 6, 7, 8, 9, 0,
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
        ],//经典模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
        question:false,//若给定词典为算数题，则此项必须选择true,程序将自动计算出结果进行校验【若选择此项，则可不配置len属性】,若选择经典模式，必须选择false
        copy: false,//是否允许复制产生的验证码
        bgColor:"",//背景颜色[与背景图任选其一设置]
        bgImg:"bg.jpg",//若选择背景图片，则背景颜色失效
        randomBg : false,//若选true则采用随机背景颜色，此时设置的bgImg和bgColor将失效
        inputArea: inp,//输入验证码的input对象绑定【 HTMLInputElement 】
        codeArea: code,//验证码放置的区域【HTMLDivElement 】
        click2refresh:true,//是否点击验证码刷新验证码
        false2refresh:true,//在填错验证码后是否刷新验证码
        validateEven : "blur",//触发验证的方法名，如click，blur等
        validateFn : function(result,code){//验证回调函数
            if(result){
                alert('验证成功');
            }else{

                if(this.opt.question){
                    alert('验证失败:'+code.answer);
                }else{
                    alert('验证失败:'+code.strCode);
                    alert('验证失败:' + code.arrCode);
                }
            }
        }
    });

    var c2 = new KinerCode({
        len: 4,//需要产生的验证码长度
        chars: ["1+2","3+15","6*8","8/4","22-15"],//问题模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
//        chars: [
//            1, 2, 3, 4, 5, 6, 7, 8, 9, 0,
//            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
//            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
//        ],//经典模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
        question:true,//若给定词典为算数题，则此项必须选择true,程序将自动计算出结果进行校验【若选择此项，则可不配置len属性】,若选择经典模式，必须选择false
        copy: false,//是否允许复制产生的验证码
        bgColor:"",//背景颜色[与背景图任选其一设置]
        bgImg:"",//若选择背景图片，则背景颜色失效
        randomBg : true,//若选true则采用随机背景颜色，此时设置的bgImg和bgColor将失效
        inputArea: inp2,//输入验证码的input对象绑定【 HTMLInputElement 】
        codeArea: code2,//验证码放置的区域【HTMLDivElement 】
        click2refresh:true,//是否点击验证码刷新验证码
        false2refresh:true,//在填错验证码后是否刷新验证码
        validateEven : "blur",//触发验证的方法名，如click，blur等
        validateFn : function(result,code){//验证回调函数
            if(result){
                alert('验证成功');
            }else{

                if(this.opt.question){
                    alert('验证失败:'+code.answer);
                }else{
                    alert('验证失败:'+code.strCode);
                    alert('验证失败:' + code.arrCode);
                }
            }
        }
    });
