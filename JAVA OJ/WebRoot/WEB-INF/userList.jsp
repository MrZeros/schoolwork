<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册用户列表</title>
    <link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="./easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="./easyui/demo.css">
    <script type="text/javascript" src="./easyUi/jquery.min.js"></script>
    <script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <h2>所有用户列表</h2>
    
    
    <table id="dg" title="用户列表" class="easyui-datagrid" style="width:100%;height:600px"
            url="get_users.php"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="account" width="70">账号</th>
                <th field="passwd" width="50">密码</th>
                  <th field="name" width="50">姓名</th>
                <th field="sex" width="50">性别</th>
                <th field="phone" width="70">电话</th>
                <th field="email" width="70">Email</th>              
                <th field="isadmin" width="70">是否为管理员</th>
                <th field="ranks" width="50">排名</th>
                <th field="nlevel" width="50">等级</th>
            </tr>
        </thead>
        <tbody>
        		<tr>
        			<td width="70">zhao</td>
        			<td width="50">123</td>
        			<td width="50">赵</td>
        			<td width="50">男</td>
        			<td width="70">123456</td>
        			<td width="70">aa@qq.com</td>
        			<td width="70">否</td>
        			<td width="50">无</td>
        			<td width="50">无</td>
        		</tr>
        		<tr>
        			<td width="70">zhao</td>
        			<td width="50">123</td>
        			<td width="50">赵</td>
        			<td width="50">男</td>
        			<td width="70">123456</td>
        			<td width="70">aa@qq.com</td>
        			<td width="70">否</td>
        			<td width="50">无</td>
        			<td width="50">无</td>
        		</tr>
        </tbody>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px"
            closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息编辑</div>
            <div style="margin-bottom:10px">
                <input name="account" class="easyui-textbox" required="true" label="账号:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="passwd" class="easyui-textbox" required="true" label="密码:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox" required="true" label="姓名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="sex" class="easyui-textbox" required="true" label="性别:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="phone" class="easyui-textbox" required="true" label="电话:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="email" class="easyui-textbox" required="true" validType="Email" label="Email:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="isadmin" class="easyui-textbox" required="true" label="是否为管理员:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="ranks" class="easyui-textbox" required="true" label="排名:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="nlevel" class="easyui-textbox" required="true" label="等级:" style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
    <script type="text/javascript">
        var url;
        function newUser(){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
            $('#fm').form('clear');
            url = 'save_user.php';
        }
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
                $('#fm').form('load',row);
                url = 'update_user.php?id='+row.id;
            }
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.errorMsg){
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
                    if (r){
                        $.post('destroy_user.php',{id:row.id},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
    </script>
</body>
</html>