"use client";
import { useParams } from "next/navigation";
import Link from "next/link";
import { useEffect, useState } from "react";
import ReactMarkdown from "react-markdown";

export default function Questions() {
  const [odpoved, setOdpoved] = useState(null);
  const [loading, setLoading] = useState(true); // Track loading state
  const { odpoved_id } = useParams();

  useEffect(() => {
    const fetchOdpovedi = async () => {
      try {
        const response = await fetch(
          `http://localhost:3000/odpoved/${odpoved_id}`
        );
        const data = await response.json();
        setOdpoved(data[0]); // Ensure data has the expected structure
      } catch (e) {
        console.error("Error fetching data:", e);
      } finally {
        setLoading(false); // Stop loading indicator
      }
    };

    fetchOdpovedi();
  }, [odpoved_id]); // Added otazka_id as a dependency to avoid potential stale data issues

  return (
    <div className="flex flex-col min-h-screen bg-[#ffffff] text-[#d83030]">
      <header className="fixed top-0 left-0 right-0 z-50 flex items-center justify-between p-4 bg-[#d83030] shadow-md transition-all duration-300 ease-in-out">
        <div className="flex items-center space-x-4">
          <Link href="/" className="text-2xl font-bold text-[#ffffff]">
            StaniceGuru
          </Link>
        </div>
      </header>
      <main className="flex-1 px-4 pt-20">
        <section className="max-w-6xl mx-auto">
          {loading ? (
            <p>Loading...</p> // Display loading message
          ) : odpoved && odpoved.text ? (
            <ReactMarkdown className="mx-auto prose sm:prose-sm md:prose-base lg:prose-lg xl:prose-xl">
              {odpoved.text}
            </ReactMarkdown>
          ) : (
            <p>No data available.</p> // Display if there's no data
          )}
        </section>
      </main>
    </div>
  );
}
