Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0AA179FBF
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 07:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=di+BCj3E+sDLdxcnjG5LaOk3AYwvIBNiHoUh8uNXoGU=; b=dth1Hlxl+6QIQPGCOQivO5RyuW
	T3ITa73G4ImeY+OiHtIw7Xh2+c3HADNw30wHzOa+ftsws8L8X+43AfYu91cGSvn7Ph8ycqn3j/fsL
	ntfTGBIHS9AS+3Z3gKhq/jV/Ehof47L6+mGbMKiRDNSE3PCs1uNLbmc/RS+y8gfTVEVA73Pq5Ybg5
	XCfeLUEeubv4/nRFGJ1V/bR2TBaS7Cmk5KgKq3+F6AqVKvKMc2D3r+rRoL2K8gjLrWM2vOV493HZ7
	bN3P+yga00l2euphIlm5EXva8Q2tztfTsoVVrt+QTiIKitN2AkVTH01EtBoX5hDE/CxDMyLxDqM2O
	roRZx6pQ==;
Received: from localhost ([::1]:18708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9jbd-00F09M-46; Thu, 05 Mar 2020 06:03:37 +0000
Received: from mail-yw1-xc31.google.com ([2607:f8b0:4864:20::c31]:33003) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9jbY-00F09F-1y
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 06:03:34 +0000
Received: by mail-yw1-xc31.google.com with SMTP id j186so4634779ywe.0
 for <samba-technical@lists.samba.org>; Wed, 04 Mar 2020 22:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=di+BCj3E+sDLdxcnjG5LaOk3AYwvIBNiHoUh8uNXoGU=;
 b=byICpEeZWjWJPD1hxQ/G+1BJJP1wWTiokIlS+gh2ktFZOul0c8MkPRWC4AP6rHQEpG
 PQDg3uTm4NHyvD9aklhWjhFYTzE3vOYXTXNmbjnQGi9XrDWNSafXeTn87dxPBMG2YGME
 YOR5Abw4hzEmx9hXgcbfy0GenfbH2gCmUjLJwDiDv8jdHLrthHGw2MGepr+ZHprSBPIp
 Vd5K5+4gCeueJNln5gvbu83P2Slxnr+/3swDr/NvoFq/4Xt4mnMbZ7awmGmWtAM31zPg
 yVcktiZahVMfqWgByIJz7M9ukJH6rU//VKDKbJit0i37l6vyDHqOmr7p0DcTYGLpxznJ
 LNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=di+BCj3E+sDLdxcnjG5LaOk3AYwvIBNiHoUh8uNXoGU=;
 b=b+sVtNhNQhE5PH3aVRBPdGn/BTm8iAGQzLQ/sWPiyQU1NARqETpKjFUcOb99dRqwuS
 xLTCAcfWbDIvBaVF0HRDWS/C7eM8qTVkAx7QjVKm4hNvkRoVWAlxV2D9LPf2UmQ8oYtD
 bIrKIsVTKEzh2iB7Sbw8LnNjlL1W2N3s117EZsePZQAXppHEJivWsl7XWbWEa6mzu9GN
 ZiYJNgqNDrhZFnzw4pVTEC3dYaTOOqy6010K+/edHJaUGKzxkChFTnKmkrS1KUS4L7G3
 lz6GZ5vYAASiXEq1lg6TstyoT6+jAhCUPryTbfGsKKJSjZJlbvrm1oAQqZp+h4W406Rr
 kcLA==
X-Gm-Message-State: ANhLgQ0nYc8RorZouPHJCDt2/0eV8D7m++pc7RhbMHctgikf1V4ypae5
 rewunMNbunxwoblb2JGo50vTkPJMwPugtH2CxKU=
X-Google-Smtp-Source: ADFU+vufV/a8AY4MVXaLNBJqveSHQH/fP36hAnhwZ9sTDF0/qerRYfOFqBAdW2ZqU0EYBUIeyuWMBsq7Ya90eJPqA+A=
X-Received: by 2002:a25:e805:: with SMTP id k5mr6032493ybd.14.1583388205615;
 Wed, 04 Mar 2020 22:03:25 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 5 Mar 2020 00:03:14 -0600
Message-ID: <CAH2r5msKRKFdpg16DE-HvEGDDMZQOw2=nhL3xbBJoYEvyzHwnQ@mail.gmail.com>
Subject: [CIFS][PATCH] Make warning when using default version (default mount)
 less noisy
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="00000000000089b6ba05a0154b0b"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000089b6ba05a0154b0b
Content-Type: text/plain; charset="UTF-8"

    The warning we print on mount about how to use less secure dialects
    (when the user does not specify a version on mount) is useful
    but is noisy to print on every default mount, and can be changed
    to a warn_once.  Slightly updated the warning text as well to note
    SMB3.1.1 which has been the default which is typically negotiated
    (for a few years now) by most servers.

          "No dialect specified on mount. Default has changed to a more
           secure dialect, SMB2.1 or later (e.g. SMB3.1.1), from CIFS
           (SMB1). To use the less secure SMB1 dialect to access old
           servers which do not support SMB3.1.1 (or even SMB3 or SMB2.1)
           specify vers=1.0 on mount."


-- 
Thanks,

Steve

--00000000000089b6ba05a0154b0b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-CIFS-Warn-less-noisily-on-default-mount.patch"
Content-Disposition: attachment; 
	filename="0001-CIFS-Warn-less-noisily-on-default-mount.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k7ecg2730>
X-Attachment-Id: f_k7ecg2730

RnJvbSBiMzdkNDExZjc0Njc3ZjljNWJhM2ZjMmFlZjE1MmNkNjZiNTFlODVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgNCBNYXIgMjAyMCAyMzo1Njo1MiAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIENJ
RlM6IFdhcm4gbGVzcyBub2lzaWx5IG9uIGRlZmF1bHQgbW91bnQKClRoZSB3YXJuaW5nIHdlIHBy
aW50IG9uIG1vdW50IGFib3V0IGhvdyB0byB1c2UgbGVzcyBzZWN1cmUgZGlhbGVjdHMKKHdoZW4g
dGhlIHVzZXIgZG9lcyBub3Qgc3BlY2lmeSBhIHZlcnNpb24gb24gbW91bnQpIGlzIHVzZWZ1bApi
dXQgaXMgbm9pc3kgdG8gcHJpbnQgb24gZXZlcnkgZGVmYXVsdCBtb3VudCwgYW5kIGNhbiBiZSBj
aGFuZ2VkCnRvIGEgd2Fybl9vbmNlLiAgU2xpZ2h0bHkgdXBkYXRlZCB0aGUgd2FybmluZyB0ZXh0
IGFzIHdlbGwgdG8gbm90ZQpTTUIzLjEuMSB3aGljaCBoYXMgYmVlbiB0aGUgZGVmYXVsdCB3aGlj
aCBpcyB0eXBpY2FsbHkgbmVnb3RpYXRlZAooZm9yIGEgZmV3IHllYXJzIG5vdykgYnkgbW9zdCBz
ZXJ2ZXJzLgoKICAgICAgIk5vIGRpYWxlY3Qgc3BlY2lmaWVkIG9uIG1vdW50LiBEZWZhdWx0IGhh
cyBjaGFuZ2VkIHRvIGEgbW9yZQogICAgICAgc2VjdXJlIGRpYWxlY3QsIFNNQjIuMSBvciBsYXRl
ciAoZS5nLiBTTUIzLjEuMSksIGZyb20gQ0lGUwogICAgICAgKFNNQjEpLiBUbyB1c2UgdGhlIGxl
c3Mgc2VjdXJlIFNNQjEgZGlhbGVjdCB0byBhY2Nlc3Mgb2xkCiAgICAgICBzZXJ2ZXJzIHdoaWNo
IGRvIG5vdCBzdXBwb3J0IFNNQjMuMS4xIChvciBldmVuIFNNQjMgb3IgU01CMi4xKQogICAgICAg
c3BlY2lmeSB2ZXJzPTEuMCBvbiBtb3VudC4iCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2gg
PHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvY2lmcy9jb25uZWN0LmMgfCAxMSArKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9mcy9jaWZzL2Nvbm5lY3QuYyBiL2ZzL2NpZnMvY29ubmVjdC5jCmluZGV4
IDQ2YjYwMmRmYzRkMy4uMjUyNjI0NDZiMjIyIDEwMDY0NAotLS0gYS9mcy9jaWZzL2Nvbm5lY3Qu
YworKysgYi9mcy9jaWZzL2Nvbm5lY3QuYwpAQCAtMjQ2OSwxMSArMjQ2OSwxMiBAQCBjaWZzX3Bh
cnNlX21vdW50X29wdGlvbnMoY29uc3QgY2hhciAqbW91bnRkYXRhLCBjb25zdCBjaGFyICpkZXZu
YW1lLAogCQlwcl9ub3RpY2UoIkNJRlM6IGlnbm9yaW5nIGZvcmNlZ2lkIG1vdW50IG9wdGlvbiBz
cGVjaWZpZWQgd2l0aCBubyBnaWQ9IG9wdGlvbi5cbiIpOwogCiAJaWYgKGdvdF92ZXJzaW9uID09
IGZhbHNlKQotCQlwcl93YXJuKCJObyBkaWFsZWN0IHNwZWNpZmllZCBvbiBtb3VudC4gRGVmYXVs
dCBoYXMgY2hhbmdlZCB0byAiCi0JCQkiYSBtb3JlIHNlY3VyZSBkaWFsZWN0LCBTTUIyLjEgb3Ig
bGF0ZXIgKGUuZy4gU01CMyksIGZyb20gQ0lGUyAiCi0JCQkiKFNNQjEpLiBUbyB1c2UgdGhlIGxl
c3Mgc2VjdXJlIFNNQjEgZGlhbGVjdCB0byBhY2Nlc3MgIgotCQkJIm9sZCBzZXJ2ZXJzIHdoaWNo
IGRvIG5vdCBzdXBwb3J0IFNNQjMgKG9yIFNNQjIuMSkgc3BlY2lmeSB2ZXJzPTEuMCIKLQkJCSIg
b24gbW91bnQuXG4iKTsKKwkJcHJfd2Fybl9vbmNlKCJObyBkaWFsZWN0IHNwZWNpZmllZCBvbiBt
b3VudC4gRGVmYXVsdCBoYXMgY2hhbmdlZCIKKwkJCSIgdG8gYSBtb3JlIHNlY3VyZSBkaWFsZWN0
LCBTTUIyLjEgb3IgbGF0ZXIgKGUuZy4gIgorCQkJIlNNQjMuMS4xKSwgZnJvbSBDSUZTIChTTUIx
KS4gVG8gdXNlIHRoZSBsZXNzIHNlY3VyZSAiCisJCQkiU01CMSBkaWFsZWN0IHRvIGFjY2VzcyBv
bGQgc2VydmVycyB3aGljaCBkbyBub3QgIgorCQkJInN1cHBvcnQgU01CMy4xLjEgKG9yIGV2ZW4g
U01CMyBvciBTTUIyLjEpIHNwZWNpZnkgIgorCQkJInZlcnM9MS4wIG9uIG1vdW50LlxuIik7CiAK
IAlrZnJlZShtb3VudGRhdGFfY29weSk7CiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCg==
--00000000000089b6ba05a0154b0b--

