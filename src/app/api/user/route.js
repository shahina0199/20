import { NextResponse } from "next/server";
import { PrismaClient } from '@prisma/client'
 

// find many query

export async function GET(){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };
    try{
        const prisma = new PrismaClient();
        
        let result = await prisma.user.aggregate({
            _count:{id:true}
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


    let result = await prisma.user.create( {
        data: {...reqBody, lastLogin: new Date(reqBody.lastLogin).toISOString() , registeredAt: new Date(reqBody.registeredAt).toISOString() }
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
    let result = await prisma.user.update({
        where : { id : 1 },
        data: {...reqBody, lastLogin: new Date(reqBody.lastLogin).toISOString() , registeredAt: new Date(reqBody.registeredAt).toISOString()}
    });
        return NextResponse.json({status:"Success" , data:result});
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}


 
//delete query
export async function DELETE(){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };

    try{
     const prisma = new PrismaClient();

    let result = await prisma.user.delete({
        where:{id:4}
      
    });
        return NextResponse.json({status:"Success", data:result});
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}





