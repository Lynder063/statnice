"use client";

import { useParams } from "next/navigation";
import Link from "next/link";
import { useEffect, useState } from "react";

export default function Questions({ params }) {
  const [otazky, setOtazky] = useState([]);
  const [predmety, setPredmety] = useState([]);
  const { predmet_id } = params;
  const [selectedPredmet, setSelectedPredmet] = useState([]);

  useEffect(() => {
    const fetchOtazky = async () => {
      try {
        const response = await fetch(`http://localhost:3000/otazky`);
        const otazky = await response.json();
        setOtazky(otazky);
        console.log(otazky);
      } catch (e) {
        console.log(e);
      }
    };

    fetchOtazky();
  }, []);

  useEffect(() => {
    const fetchPredmety = async () => {
      try {
        const response = await fetch(`http://localhost:3000/predmet/`);
        const predmet = await response.json();
        setPredmety(predmet);
        console.log(predmety);
      } catch (e) {
        console.log(e);
      }
    };

    fetchPredmety();
  }, []);

  const filteredOtazky = otazky.filter(
    (otazka) => otazka.predmet_id === parseInt(predmet_id)
  );

  useEffect(() => {
    if (predmety.length > 0) {
      const predmet = predmety.find(
        (p) => p.predmet_id === parseInt(predmet_id)
      );
      setSelectedPredmet(predmet);
    }
  }, [predmety, predmet_id]);

  return (
    <div className="flex flex-col min-h-screen bg-[#ffffff] text-[#d83030]">
      <header className="fixed top-0 left-0 right-0 z-50 flex items-center justify-between p-4 bg-[#d83030] shadow-md transition-all duration-300 ease-in-out">
        <div className="flex items-center space-x-4">
          <Link href="/" className="text-2xl font-bold text-[#ffffff]">
            StaniceGuru
          </Link>
        </div>
      </header>
      <main className="flex-1 pt-20">
        <section className="max-w-6xl mx-auto">
          <h2 className="text-5xl font-bold text-center">
            {selectedPredmet.nazev}
          </h2>
          <div className="grid grid-cols-1 gap-8 mt-8 mb-8">
            {filteredOtazky.map((otazky) => (
              <Link href={`/odpoved/${otazky.otazka_id}`}>
                <div
                  key={otazky.otazka_id}
                  className="flex items-center group bg-[#d83030] p-6 rounded-lg shadow-lg"
                >
                  <div className="w-1/6">
                    <h3 className="text-xl font-bold text-[#ffffff]">
                      {otazky.otazka_id}
                    </h3>
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-bold text-[#ffffff]">
                      {otazky.text}
                    </h3>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>
      </main>
      <footer className="p-4 bg-[#d83030]">
        <div className="flex items-center justify-between">
          <div className="space-y-2">
            <Link href="#" className="block text-[#ffffff]" prefetch={false} />
          </div>
        </div>
      </footer>
    </div>
  );
}
