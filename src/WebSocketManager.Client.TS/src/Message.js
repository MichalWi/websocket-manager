"use strict";
(function (MessageType) {
    MessageType[MessageType["Text"] = 0] = "Text";
    MessageType[MessageType["MethodInvocation"] = 1] = "MethodInvocation";
    MessageType[MessageType["ConnectionEvent"] = 2] = "ConnectionEvent";
})(exports.MessageType || (exports.MessageType = {}));
var MessageType = exports.MessageType;
var Message = (function () {
    function Message() {
    }
    return Message;
}());
exports.Message = Message;
//# sourceMappingURL=Message.js.map