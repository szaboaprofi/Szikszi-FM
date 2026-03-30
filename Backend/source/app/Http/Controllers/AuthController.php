<?php

namespace App\Http\Controllers;

use App\Models\Felhasznalo;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'felhasznalonev' => ['required', 'string', 'min:3', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:felhasznalok,email'],
            'password' => ['required', 'string', 'min:6'],
        ], [
            'felhasznalonev.min' => 'A felhasználónév legalább 3 karakter legyen.',
            'email.email' => 'Adj meg egy érvényes email címet.',
            'email.unique' => 'Ezzel az email címmel már létezik fiók.',
            'password.min' => 'A jelszónak legalább 6 karakterből kell állnia.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = Felhasznalo::create([
            'felhasznalonev' => $request->string('felhasznalonev')->trim()->value(),
            'email' => strtolower(trim($request->string('email')->value())),
            'jelszo' => Hash::make($request->input('password')),
            'szerep' => 'felhasznalo',
            'letrehozva' => now()->toDateString(),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Sikeres regisztráció.',
            'user' => $this->transformUser($user),
        ], 201);
    }

    public function login(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email'],
            'password' => ['required', 'string', 'min:6'],
        ], [
            'email.email' => 'Adj meg egy érvényes email címet.',
            'password.min' => 'A jelszónak legalább 6 karakterből kell állnia.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first(),
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = Felhasznalo::where('email', strtolower(trim($request->input('email'))))->first();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Nem található felhasználó ezzel az email címmel.',
            ], 404);
        }

        $password = (string) $request->input('password');
        $storedPassword = (string) $user->jelszo;
        $passwordMatches = Hash::check($password, $storedPassword) || hash_equals($storedPassword, $password);

        if (!$passwordMatches) {
            return response()->json([
                'success' => false,
                'message' => 'Hibás jelszó.',
            ], 401);
        }

        return response()->json([
            'success' => true,
            'message' => 'Sikeres bejelentkezés.',
            'user' => $this->transformUser($user),
        ]);
    }

    private function transformUser(Felhasznalo $user): array
    {
        return [
            'id' => $user->id,
            'felhasznalonev' => $user->felhasznalonev,
            'email' => $user->email,
            'szerep' => $user->szerep,
        ];
    }
}
