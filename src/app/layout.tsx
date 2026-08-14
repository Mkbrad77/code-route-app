import type { Metadata, Viewport } from "next";
import "./globals.css";
import BottomNav from "@/components/BottomNav";
import RegisterSW from "@/components/RegisterSW";
import ToastProvider from "@/components/ToastProvider";

export const metadata: Metadata = {
  title: "Code Route — Révision intensive",
  description: "Prépare ton examen du Code de la route en 10 jours.",
  manifest: "/manifest.json",
  icons: {
    icon: [
      { url: "/icon-192.png", sizes: "192x192", type: "image/png" },
      { url: "/icon-512.png", sizes: "512x512", type: "image/png" },
    ],
    apple: "/icon-192.png",
  },
};

export const viewport: Viewport = {
  themeColor: "#14171f",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="fr" className="h-full antialiased" suppressHydrationWarning>
      <body className="min-h-full flex flex-col pb-16" suppressHydrationWarning>
        <ToastProvider>
          {children}
          <BottomNav />
        </ToastProvider>
        <RegisterSW />
      </body>
    </html>
  );
}
