import { NextResponse } from "next/server";
import { PrismaClient } from '@prisma/client'
 

// find many query

export async function GET(){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };
    try{
        const prisma = new PrismaClient();
        
        let result = await prisma.order.aggregate({
            _count:{id:true},
            _avg:{total:true},
            _max:{discount:true},
            _min:{tax:true}
        });
        return NextResponse.json({status:"success", data:result});
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}


//insert single data
export async function POST(req , res){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };
    try{
        const prisma = new PrismaClient();
        const reqBody = await req.json();     


    let result = await prisma.order.create( {
        data: {...reqBody }
    } )

        return NextResponse.json({ status: 'Success' , data:result });
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}

// //update query
export async function PUT(req, res){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };
    try{
     const prisma = new PrismaClient();
     const reqBody = await req.json(); 
     const id = reqBody.id;
    let result = await prisma.order.update({
        where : { id : id },
        data: {...reqBody }
    });
        return NextResponse.json({status:"Success" , data:result});
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}


 
//delete query
export async function DELETE(req,res){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };
    try{
     const prisma = new PrismaClient();
     const reqBody = await req.json(); 
     const id = reqBody.id;
    let result = await prisma.order.delete({
        where:{id:id}
      
    });
        return NextResponse.json({status:"Success", result : result});
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}





