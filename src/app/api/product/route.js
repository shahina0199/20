import { NextResponse } from "next/server";
import { PrismaClient } from '@prisma/client'
 

// find many query

export async function GET(){
    BigInt.prototype.toJSON = function () {
        return this.toString();
      };
    try{
        const prisma = new PrismaClient();
        
        let result = await prisma.product.aggregate({
            _count:{id:true},
            _avg:{price:true},
            _max:{price:true},
            _min:{price:true}
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
        const createProduct = prisma.product.create({
            data:{
                firstName   : "Single phase induction motor",
                metaTitle   : "single-phase-induction-motor",
                slug        : "single-phase-induction-motor",
                summery     : "single-phase-induction-motor single-phase-induction-motor ",
                price       : 12000,
                discount    : 500,
                userId      : 1,
                publishedAt :  new Date().toISOString() ,
                startsdAt   : new Date().toISOString() ,
                endsdAt     : new Date().toISOString() ,
            }
        })
        const productMeta = prisma.product_meta.create({
            data:{
                key         : "induction motor",
                content     : "single-phase-induction-motor single-phase-induction-motor",
                productId   : 22,

            }
        })
        
        const productReview = prisma.product_review.create({
            data:{
                title       : "induction motor",
                rating      : "5*",
                content     : "single-phase-induction-motor single-phase-induction-motor",
                productId   : 25,

            }
        })
  
        const result = await prisma.$transaction([createProduct,productMeta,productReview])

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
    let result = await prisma.product.update({
        where : { id : id },
        data: {...reqBody , publishedAt: new Date(reqBody.publishedAt).toISOString() , startsdAt: new Date(reqBody.startsdAt).toISOString() ,endsdAt: new Date(reqBody.endsdAt).toISOString()}
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
    let result = await prisma.product.delete({
        where:{id:id}
      
    });
        return NextResponse.json({status:"Success", result : result});
    }catch(err){
        return NextResponse.json({status:"Fail" , data:err.toString()});
    }
}





