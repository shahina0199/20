async function getData(){
  const res = await fetch(process.env.BASE_URL+"api/FeaturedProject");

  if(!res.ok){
    throw new Error("FeaturedProject calling fail");
  }
  return res.json();
}


const FeaturedProject = async () => {
  const data = await getData() ;
  return (
    <>
      <section>
        <div className="py-20 bg-gray-50 radius-for-skewed">
          <div className="container mx-auto px-4">
            <div className="flex flex-wrap items-center -mx-4">
              <div className="mb-12 lg:mb-0 w-full lg:w-1/2 flex px-4">
                <div className="max-w-md">
                  <span className="text-green-600 font-bold">
                    Dolor sit amet consectutar
                  </span>
                  <h2 className="mb-6 text-4xl lg:text-5xl font-bold font-heading">
                    Build &amp; Launch without problems
                  </h2>
                  <div className="mb-6 max-w-sm">
                    <p className="text-gray-500 leading-loose">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                      Pellentesque efficitur nisl sodales egestas lobortis.
                    </p>
                  </div>
                  <div className="flex flex-wrap lg:-ml-5">
                    <button className="lg:w-auto py-2 px-6 leading-loose lg:ml-5 text-gray-50 font-bold bg-green-600 hover:bg-green-700 transition duration-200 rounded-l-xl rounded-t-xl">
                      Get Started
                    </button>
                  </div>
                </div>
              </div>
              <div className="w-full lg:w-1/2">
               
              <div className="flex flex-wrap -mx-4 mb-4">
              {
                data.map((item,i)=>{
                  return(
                    <div key={i} className="mb-8 w-full md:w-1/2 lg:w-1/3 px-4">
                      <div className="bg-white rounded">
                        <img
                          className="rounded-t object-cover h-128"
                          src={item['image']}
                          alt=""
                        />
                        <div className="p-6">
                          <span className="text-gray-400">2021</span>
                          <h3 className="mb-4 text-2xl font-bold font-heading">
                          {item['title']}
                          </h3>
                          <a
                            className="flex text-green-600 hover:text-green-700 font-bold"
                            href={item['live']}
                          >
                            <svg
                              className="mr-3 w-6 h-6"
                              xmlns="http://www.w3.org/2000/svg"
                              viewBox="0 0 20 20"
                              fill="currentColor"
                            >
                              <path
                                fillRule="evenodd"
                                d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 1.414L10.586 9H7a1 1 0 100 2h3.586l-1.293 1.293a1 1 0 101.414 1.414l3-3a1 1 0 000-1.414z"
                                clipRule="evenodd"
                              />
                            </svg>
                            <span>View Case Study</span>
                          </a>
                        </div>
                      </div>
                    </div>
                  )
                })
              }
         
            </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
};

export default FeaturedProject;
