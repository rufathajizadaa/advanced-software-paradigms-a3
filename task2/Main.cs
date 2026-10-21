using System;

class AttendanceTerminal
{
    public virtual void RegisterStudent()
    {
        Console.WriteLine("Student attendance was registered with an ID card");
    }

    public void ShowVerificationMethod()
    {
        Console.WriteLine("The terminal verifies students using an ID card");
    }
}

class FaceRecognitionTerminal : AttendanceTerminal
{
    public override void RegisterStudent()
    {
        Console.WriteLine("Student attendance was registered using face recognition");
    }

    public new void ShowVerificationMethod()
    {
        Console.WriteLine("The terminal verifies students by scanning their face");
    }
}

class Program
{
    static void Main()
    {
        AttendanceTerminal cardTerminal = new AttendanceTerminal();
        AttendanceTerminal faceAsAttendanceTerminal = new FaceRecognitionTerminal();
        FaceRecognitionTerminal faceTerminal = new FaceRecognitionTerminal();

        Console.WriteLine("Dynamic binding:");
        cardTerminal.RegisterStudent();
        faceAsAttendanceTerminal.RegisterStudent();

        Console.WriteLine("\nStatic binding:");
        faceAsAttendanceTerminal.ShowVerificationMethod();
        faceTerminal.ShowVerificationMethod();
    }
}
