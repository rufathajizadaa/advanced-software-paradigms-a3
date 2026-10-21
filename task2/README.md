# Task 2: Dynamic and Static Binding in C#

## About the task

In this task I used a university attendance system to show dynamic and static binding in C#. The base class is `AttendanceTerminal` and the derived class is `FaceRecognitionTerminal`.

The base class has a virtual method:

```csharp
public virtual void RegisterStudent()
```

The derived class replaces it by using `override`:

```csharp
public override void RegisterStudent()
```

I created this object:

```csharp
AttendanceTerminal faceAsAttendanceTerminal = new FaceRecognitionTerminal();
```

The variable is declared as `AttendanceTerminal`, but the real object is a `FaceRecognitionTerminal`. When I call `RegisterStudent()`, C# checks the real object type while the program is running. Because the method is virtual and overridden, it runs the face recognition version. This is dynamic binding.

For static binding, the base class has a normal method called `ShowVerificationMethod()`. The derived class hides it with the `new` keyword:

```csharp
public new void ShowVerificationMethod()
```

With this type of method, C# chooses the version by looking at the declared variable type. Calling the method through an `AttendanceTerminal` variable runs the base version. Calling it through a `FaceRecognitionTerminal` variable runs the derived version.

In short:

```text
virtual + override -> real object type -> dynamic binding
new method         -> declared variable type -> static binding
```

## Result

I ran the program using the C# compiler on [www.onlinеgdb.com](https://www.onlinegdb.com/) 
The output was:

```text
Dynamic binding:
Student attendance was registered with an ID card
Student attendance was registered using face recognition

Static binding:
The terminal verifies students using an ID card
The terminal verifies students by scanning their face

...Program finished with exit code 0
Press ENTER to exit console.
```

In the dynamic binding part, the first line comes from a normal `AttendanceTerminal` object. The second line comes from a `FaceRecognitionTerminal`, even though its variable type is `AttendanceTerminal`. This shows that the overridden method is chosen from the real object type.

In the static binding part, the first call uses a variable declared as `AttendanceTerminal`, so the base method is selected. The second call uses a variable declared as `FaceRecognitionTerminal`, so the hidden method from the derived class is selected.

The `virtual` keyword allows a method to be changed in a derived class. `override` provides the new implementation for dynamic binding. `new` hides the inherited method and demonstrates static binding. Exit code `0` means the program finished without an error.
