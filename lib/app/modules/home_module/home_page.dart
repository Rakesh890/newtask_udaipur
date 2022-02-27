import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newtask/app/data/model/Student.dart';
import 'package:newtask/app/modules/home_module/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 0,
          title: Text('Home Page'),
          bottom: TabBar(
            onTap:(val) => controller.selectTabItem(val) ,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // Creates border
                color: Colors.white),
            tabs: [
              Obx(
              () => Tab(
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: 15,
                        color:(controller.selectTabIndex.value == 0) ? Colors.black87 : Colors.white
                    ),
                  ),),
              ),
              Obx(() => Tab(child:Text("Invite",
                  style: TextStyle(
                      fontSize: 15,
                      color: (controller.selectTabIndex.value == 1) ? Colors.black87 : Colors.white
                  ),)),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildAllView(context),

              _buildInvitedlist(context),
        ],
          ),
        ),
      ),
    );
  }

  _buildList()
  {
    return Expanded(
      child: Container(
        height: double.infinity,
        child: Obx(() => ListView.builder(
            itemCount: controller.studentList.length,
            itemBuilder: (contex,int index){
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(controller.studentList[index].name,style: TextStyle(
                        fontSize: 18,color: Colors.black87,fontWeight: FontWeight.bold
                    ),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Text("Class : ${controller.studentList[index].className}",style:
                        TextStyle(
                            fontSize: 15,color: Colors.black87,fontWeight: FontWeight.normal
                        ),),
                        SizedBox(height: 8,),
                        Text("Address : ${controller.studentList[index].address}",style:
                        TextStyle(
                            fontSize: 15,color: Colors.black87,fontWeight: FontWeight.normal
                        ),)
                      ],
                    ),

                  ),
                ),
              );
            },
        )),
      ),
    );
  }

  _buildSearchBar()
  {
    return Container(
      color: Colors.deepPurpleAccent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
        ),
        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        child: TextField(
          controller: controller.searchBarInput,
          decoration: InputDecoration(
              isDense: true,
              hintText: "Search By Name",
              border:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
              prefixIcon: Icon(Icons.search,color: Colors.black45,size: 24,)
          ),
          onChanged: (value) => controller.onSearchedInput(value),
        ),
      ),
    );
  }

  _buildInvitedlist(BuildContext context)
  {
    return Container(
      height: double.infinity,
      child: Obx(() => ListView.builder(
        itemCount: controller.invitedList.length,
        itemBuilder: (contex,int index){
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(controller.invitedList[index].name,style: TextStyle(
                    fontSize: 18,color: Colors.black87,fontWeight: FontWeight.bold
                ),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8,),
                    Text("Class : ${controller.invitedList[index].className}",style:
                    TextStyle(
                        fontSize: 15,color: Colors.black87,fontWeight: FontWeight.normal
                    ),),
                    SizedBox(height: 8,),
                    Text("Address : ${controller.invitedList[index].address}",style:
                    TextStyle(
                        fontSize: 15,color: Colors.black87,fontWeight: FontWeight.normal
                    ),)
                  ],
                ),
                trailing: RaisedButton(
                  elevation: 0,
                  color:(controller.invitedList[index].isInvited == false) ? Colors.deepPurpleAccent
                      : Colors.lightGreen,
                  child: Text("Invited",style: TextStyle(
                      color: Colors.white
                  ),),
                  onPressed:(){},
                ),
              ),
            ),
          );
        },
      )),
    );
  }

  _buildAllView(BuildContext context)
  {
    return  Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _buildSearchBar(),

          _buildList(),

        ],
      ),
    );
  }





}
