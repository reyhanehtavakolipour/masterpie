-dontwarn javax.naming.NamingEnumeration
-dontwarn javax.naming.NamingException
-dontwarn javax.naming.directory.Attribute
-dontwarn javax.naming.directory.Attributes
-dontwarn javax.naming.directory.DirContext
-dontwarn javax.naming.directory.InitialDirContext
-dontwarn javax.naming.directory.SearchControls
-dontwarn javax.naming.directory.SearchResult
-dontwarn net.jcip.annotations.Immutable
-dontwarn net.jcip.annotations.NotThreadSafe
-dontwarn net.jcip.annotations.ThreadSafe
-keep class com.app.masterpie.BuildConfig { *; }





# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

# Sqflite
-keep class androidx.sqlite.db.** { *; }
-keep class androidx.room.** { *; }
-keep class android.arch.persistence.room.** { *; }
-keep class android.arch.persistence.db.** { *; }
-dontwarn androidx.sqlite.db.**
-dontwarn androidx.room.**
-dontwarn android.arch.persistence.room.**
-dontwarn android.arch.persistence.db.**

# Gson (if you use it)
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# For debugging (optional, remove in production)
-keepattributes *Annotation*
-keep class **.R$* { *; }
-keep class **.BuildConfig { *; }
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(***);
}
-keepclassmembers class **.R$* {
    public static <fields>;
}


# Room and SQLite
-keep class androidx.room.** { *; }
-keep class androidx.sqlite.** { *; }

# For sqflite
-keep class com.tekartik.sqflite.** { *; }
-keep interface com.tekartik.sqflite.** { *; }
-keepclassmembers class * {
    @androidx.room.* <fields>;
    @androidx.room.* <methods>;
}



