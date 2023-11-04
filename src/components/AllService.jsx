async function getData(){
  const res = await fetch(process.env.BASE_URL+"api/AllService");

  if(!res.ok){
    throw new Error("AllService calling fail");
  }
  return res.json();
}

async function AllService() {
  const data = await getData();
  return (
    <>
      <section>
        <div className="py-20 bg-gray-50 radius-for-skewed">
          <div className="container px-4 mx-auto">
            <div className="mb-16 flex flex-wrap justify-center md:justify-between items-center">
              <div className="text-center lg:text-left">
                <span className="text-green-600 font-bold">
                  Dolor sit amet consectutar
                </span>
                <h2 className="text-4xl lg:text-5xl font-bold font-heading">
                  All Service
                </h2>
              </div>
              <a
                className="hidden md:inline-block py-2 px-6 rounded-l-xl rounded-t-xl bg-green-600 hover:bg-green-700 text-gray-50 font-bold leading-loose transition duration-200"
                href="/project"
              >
                View More Projects
              </a>
            </div>
            <div className="flex flex-wrap -mx-4 mb-4">
             {
              data.map((item,i)=>{
                return(
                  <div key={i} className="w-full md:w-1/2 lg:w-1/3 mb-8 px-4">
                    <a href="#">
                      <img
                        className="h-80 w-full mx-auto object-cover rounded"
                        src={item['image1']}
                        alt=""
                      />
                    </a>
                  </div>
                )
              })
             }
            </div>
            <div className="text-center">
              <a
                className="md:hidden inline-block py-2 px-6 rounded-l-xl rounded-t-xl bg-green-600 hover:bg-green-700 text-gray-50 font-bold leading-loose transition duration-200"
                href="#"
              >
                View More Projects
              </a>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}

export default AllService;
