"use client";
import Link from "next/link";
import Image from "next/image";
import { useEffect, useState } from "react";

export default function Component() {
  const [predmety, setPredmety] = useState([]);
  const [otazky, setOtazky] = useState([]);

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

  useEffect(() => {
    const fetchOtazky = async () => {
      try {
        const response = await fetch(`http://localhost:3000/otazky/`);
        const otazky = await response.json();
        setOtazky(otazky);
        console.log(otazky);
      } catch (e) {
        console.log(e);
      }
    };
    fetchOtazky();
  }, []);

  return (
    <div className="flex flex-col min-h-screen bg-gray-200 text-[#d83030]">
      <header className="fixed top-0 left-0 right-0 z-50 flex items-center justify-between p-4 bg-[#d83030] shadow-md transition-all duration-300 ease-in-out">
        <div className="flex items-center space-x-4">
          <div className="text-2xl font-bold text-[#ffff]">StátniceGuru</div>
        </div>
      </header>
      <main className="flex-1 pt-20">
        <section className="flex flex-col items-center justify-center p-12 bg-[##d3d3d3] text-[#d83030] animate-fade-in">
          <div className="grid grid-cols-1 gap-12 md:grid-cols-2 animate-slide-up">
            <div className="flex flex-col items-center">
              <h2 className="text-6xl font-bold">{predmety.length}</h2>
              <p className="text-2xl">Předmětů</p>
            </div>
            <div className="flex flex-col items-center">
              <h2 className="text-6xl font-bold">{otazky.length}</h2>
              <p className="text-2xl">Otázky</p>
            </div>
          </div>
        </section>
        <section className="p-8">
          <h2 className="text-5xl font-bold text-center">
            Státnicové podklady pro studenty Aplikované Informatiky ročník 2022
          </h2>
          <p className="mt-4 text-center">Vytvořil Kryštof Malinda</p>
          <div className="grid grid-cols-1 gap-8 mt-8 md:grid-cols-3">
            {predmety.map((predmet) => (
              <div
                key={predmet.predmet_id}
                className="flex flex-col items-center p-6 bg-red-600 rounded-lg shadow-lg group"
              >
                <Image
                  src={
                    predmet.img ? predmet.img : "/predmety_ico/placeholder.webp"
                  }
                  alt={predmet.nazev}
                  className="mb-4 transition-all duration-300 ease-in-out rounded-lg shadow-lg group-hover:scale-105"
                  width="200"
                  height="200"
                  style={{ aspectRatio: "200/200", objectFit: "cover" }}
                />
                <h3 className="text-xl font-bold text-[#ffff]">
                  {predmet.nazev}
                </h3>
                <p className="mt-2 text-center text-[#ffff]">{predmet.popis}</p>
              </div>
            ))}
          </div>
        </section>
        <section className="p-8">
          <h2 className="text-3xl font-bold text-center text-[##d3d3d3]">
            Něco je špatně?
          </h2>
          <p className="mt-4 text-center text-[##d3d3d3]">
            Neváhej mi zanechat Issue na repositáři této webové stránky. A co v
            nejbližší době se na to kouknu!
          </p>
          <div className="flex justify-center mt-6">
            <Link
              href="https://github.com/Lynder063/statnice/issues"
              className="bg-[##d3d3d3] text-red-800 px-6 py-3 font-semibold bg-red-500 rounded-md hover:bg-[##d3d3d3]/80 transition-colors"
              prefetch={false}
            >
              Otevři nový Github Issue
            </Link>
          </div>
        </section>
      </main>
      <footer className="p-4 bg-[#d83030]">
        <div className="flex items-center justify-between">
          <div className="space-y-2">
            <Link href="#" className="block text-[##d3d3d3]" prefetch={false} />
          </div>
        </div>
      </footer>
    </div>
  );
}

function MenuIcon(props) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <line x1="4" x2="20" y1="12" y2="12" />
      <line x1="4" x2="20" y1="6" y2="6" />
      <line x1="4" x2="20" y1="18" y2="18" />
    </svg>
  );
}
