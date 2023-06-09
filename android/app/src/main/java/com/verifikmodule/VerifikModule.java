package com.verifikmodule;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import co.mat.verifikkit.Verifik;
import co.mat.verifikkit.VerifikCallback;
import co.mat.verifikkit.VerifikDocType;

public class VerifikModule extends ReactContextBaseJavaModule {

    public static final String NAME = "VerifikModule";
    private boolean initVerifik = false;
    private Verifik verifik;
    final private String tokenKYC = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBSZWdpc3RyYXRpb25JZCI6IjY0NTNlZDIxMjQyZmM4ZjEzNzc2OGMwNyIsImV4cGlyZXNBdCI6IjIwMjMtMDUtMDQgMTg6MTU6NTEiLCJhY2Nlc3NUeXBlIjoiYXBwX3JlZ2lzdHJhdGlvbl9jcmVhdGVkIiwiZW1haWwiOiJpYW1mZWxpcGVvQGdtYWlsLmNvbSIsInBob25lIjoiMzEwMjY5MjEzOCIsInByb2plY3QiOiI2M2M2Y2IyYWU3YzkyZGFkNTBiNjI4ODIiLCJpYXQiOjE2ODMyMjIzNTF9.dUenQm1IUi1c4pWY_rLX75BfbpdFWgEE-fz2SXnZKHk";
    final private String projectID = "63c5620874ed501af5f983b1";
    private Callback initCallback;
    private Callback callback;
    private VerifikCallback verifikCallback = new VerifikCallback() {
        @Override
        public void initVerifikSuccess() {
            initVerifik = true;
            if(initCallback!=null) {
                initCallback.invoke(null, "INIT VERIFIK SUCCESS");
            }
        }

        @Override
        public void appRegisterSuccessful(String s) {}

        @Override
        public void appLoginSuccessful(String s) {}

        @Override
        public void appPhotoIDScanSuccessful(String s) {}

        @Override
        public void configError(String s) {
            if(initCallback!=null) {
                initCallback.invoke("CONFIG ERROR: " + s, null);
            }
        }

        @Override
        public void sessionError(String s) {
            if(initCallback!=null) {
                initCallback.invoke("SESSION ERROR: " + s, null);
            }
        }

        @Override
        public void enrollmentError(String s) {
            if(callback!=null) {
                callback.invoke("ENROLLMENT ERROR: " + s, null);
            }
        }

        @Override
        public void authError(String s) {
            if(callback!=null) {
                callback.invoke("AUTH ERROR: " + s, null);
            }
        }

        @Override
        public void photoIDMatchError(String s) {
            if(callback!=null) {
                callback.invoke("ID MATCH ERROR: " + s, null);
            }
        }

        @Override
        public void photoIDScanError(String s) {
            if(callback!=null) {
                callback.invoke("PHOTO ID SCAN ERROR: " + s, null);
            }
        }

        @Override
        public void appRegisterError(String s) {
            if(callback!=null) {
                callback.invoke("APP REGISTER ERROR: " + s, null);
            }
        }

        @Override
        public void appLoginError(String s) {
            if(callback!=null) {
                callback.invoke("APP LOGIN ERROR: " + s, null);
            }
        }

        @Override
        public void appPhotoIDScanError(String s) {
            if(callback!=null) {
                callback.invoke("APP PHOTO ID SCAN ERROR: " + s, null);
            }
        }
    };

    public VerifikModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }


    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    public void multiply(double a, double b, Promise promise) {
        promise.resolve(a * b);
    }

    @ReactMethod
    public void initVerifik(String token, Callback callback) {
        this.initCallback = callback;
        if(token==null || token.isEmpty()){
            callback.invoke("CONFIG ERROR: Please provide a valid token", null);
        }
        verifik = new Verifik(getCurrentActivity(), token, verifikCallback);
    }

    @ReactMethod
    public void enroll(String externalDatabaseID, Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.enroll(externalDatabaseID);
        }
    }

    @ReactMethod
    public void authenticate(String externalDatabaseID, Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.authenticate(externalDatabaseID);
        }
    }

    @ReactMethod
    public void matchID(String externalDatabaseID, Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.matchIDScan(externalDatabaseID);
        }
    }

    @ReactMethod
    public void ocr(Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.photoIDScan();
        }
    }

    @ReactMethod
    public void appRegisterKYC(String projectID,
                               String email,
                               String phone,
                               Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.appRegistrationKYC(projectID, email, phone);
        }
    }

    @ReactMethod
    public void appLoginKYC(String projectID,
                            String email,
                            String phone,
                            Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.appLoginKYC(projectID, email, phone);
        }
    }

    @ReactMethod
    public void photoIDKYC(String projectID,
                           Callback callback) {
        this.callback = callback;
        if(initVerifik) {
            verifik.appPhotoIDScanKYC(projectID, VerifikDocType.AUTOMATIC_DETECTION);
        }
    }

}
