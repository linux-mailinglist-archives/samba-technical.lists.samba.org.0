Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5FB7EE72C
	for <lists+samba-technical@lfdr.de>; Thu, 16 Nov 2023 20:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=e3qBTraQyMwi69i8yxLRuKzfw+FJeXAgWVTCFfRhTec=; b=hBfVDIJQEVvBEwwi1hHM9CZGTB
	3SbpwYvkHvP122kC8AJmtwet3t0FzCeH2cu8zceriLTglbF8rKDnobkGYymKLjizOSuhWZVB7FxCX
	1fCjDlnbNzRWHD50FHHZvYvF3xImpf7mQ8QPoteEYxiuQu/IImtpUyrKHIdqYBdjmN7diHXDzSNZ5
	vKqRA654iYETyVfFS6kgiGyhS10aT9KovWzkwJW/gjYvNwaOPUkAN0grV8wciNlT1pf+I9IcvOgbw
	ychURF8kzTfvgG81WJ2fMOUyqc/ey5rIbPQcjNMO9SVZI+lltTN4Y0e+vZDII4HMH6mde4Ks2O2AG
	1u+bLENw==;
Received: from ip6-localhost ([::1]:30780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r3hk2-008hlI-B0; Thu, 16 Nov 2023 19:09:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:60575) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r3hjw-008hl9-Kk
 for samba-technical@lists.samba.org; Thu, 16 Nov 2023 19:09:27 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507962561adso1752434e87.0
 for <samba-technical@lists.samba.org>; Thu, 16 Nov 2023 11:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700161760; x=1700766560; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Dn04mRqD381J0knM3vu5fALJ+ePstcD8oihEcanhTwM=;
 b=lO6ufyhoSL6e0bVRoXgqOD6wfxn1MohGi4enqMWhmWhs5+92d4l/2wHglfac5KFYLk
 /miDkIjc7KOEqhi09UmW6Z5FdoKopWR7bJmT9+QO2EoIXLA73l/j1nPFm+4h4kdgZ8kn
 0hgEuLWwL8qrW7ZdVhlww6GF0DEfgCBJx/DoAgDof9WwCXiUSXfCltXljWFVLr0nTFKW
 gri2bryNH6nwWGwjt+5fsKeQN7iS5WZfuNsjcedu+TgnKgFNLHkBZ/w9iGWUpwlQEnK0
 ijgVruBUQt5vpVaG5Bgpk7FA8IMiM+VeARsZGJUlSH+nzAZU/RgdW2C442fEhvn6VOrm
 3DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700161760; x=1700766560;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dn04mRqD381J0knM3vu5fALJ+ePstcD8oihEcanhTwM=;
 b=rPgQzp0x3B7lKDK1/j0DTc0By3l4f2ARO6IFCyvnkpXKzDSwei1JFg4vLwGhZ4SjOV
 ccC787JzWbzm5Lw9KSgcsBcsXJjSyN1EOXRmJtS0L8OORclLo3NAhupHZRHve/dS/+MH
 4MgkBBRdRAo7eDXdeuRxqSj+9RNxFOkYznTrFI29jAZ3JEG2Wc7/bcgWNii7SQVnLKLU
 Jp9gVuRyeJfCHSWB1a/XF+C+KyjwYCS23PumR4dayqomYvVR0l4X+Y2r1diM7SjPdE5N
 AGTSJGL8lSuV1ePV6sJ8uXt6Til36B6ALY19kDJm5ZrkDCiI4MCsS7jheh3tWILw7IHm
 WeOg==
X-Gm-Message-State: AOJu0YzIeK2J/Gftc7Gtf6miu+3Dc4QHS83RuThS0LvP3/rbdoy7uFzP
 JySwfX+R55O/MEm0pK91dNhFH3wpMgGwx0llEUY=
X-Google-Smtp-Source: AGHT+IF1F+EubZIXeGExd5+TESvIhpKbU4PqgysTlfOId+BT+ooMNX3ywZHQS4ThhqWc1R1JaQsKEuzn1Zy++AhioaI=
X-Received: by 2002:a05:6512:398a:b0:509:145c:6a49 with SMTP id
 j10-20020a056512398a00b00509145c6a49mr16599331lfu.42.1700161760232; Thu, 16
 Nov 2023 11:09:20 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 16 Nov 2023 13:09:09 -0600
Message-ID: <CAH2r5mvJ9=b=HCKPbi937SP-a0EhY1f5XcQHXPfXCD6TZq70BQ@mail.gmail.com>
Subject: [PATCH][SMB client] two multichannel patches
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000c7aa00060a49c1ea"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

--000000000000c7aa00060a49c1ea
Content-Type: text/plain; charset="UTF-8"

Any thoughts on these two multichannel patches from Shyam (attached)?

The first fixes: "cifs: account for primary channel in the interface list"
which fixes a refcounting issue in channel deallocation.  The second fixes
a lock ordering problem in the recent patch: "cifs: handle when server
stops supporting multichannel"

The code to handle the case of server disabling multichannel
was picking iface_lock with chan_lock held. This goes against
the lock ordering rules, as iface_lock is a higher order lock
(even if it isn't so obvious).

This change fixes the lock ordering by doing the following in
that order for each secondary channel:
1. store iface and server pointers in local variable
2. remove references to iface and server in channels
3. unlock chan_lock
4. lock iface_lock
5. dec ref count for iface
6. unlock iface_lock
7. dec ref count for server
8. lock chan_lock again

Let me know if any test feedback or reviews
-- 
Thanks,

Steve

--000000000000c7aa00060a49c1ea
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-fix-leak-of-iface-for-primary-channel.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-fix-leak-of-iface-for-primary-channel.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lp1kbwn30>
X-Attachment-Id: f_lp1kbwn30

RnJvbSAyOTk1NGQ1YjFlMGQ2N2E0Y2Q2MWMzMGMyMjAxMDMwYzk3ZTk0YjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29t
PgpEYXRlOiBUdWUsIDE0IE5vdiAyMDIzIDA0OjU0OjEyICswMDAwClN1YmplY3Q6IFtQQVRDSCAx
LzJdIGNpZnM6IGZpeCBsZWFrIG9mIGlmYWNlIGZvciBwcmltYXJ5IGNoYW5uZWwKCk15IGxhc3Qg
Y2hhbmdlIGluIHRoaXMgYXJlYSBpbnRyb2R1Y2VkIGEgY2hhbmdlIHdoaWNoCmFjY291bnRlZCBm
b3IgcHJpbWFyeSBjaGFubmVsIGluIHRoZSBpbnRlcmZhY2UgcmVmIGNvdW50LgpIb3dldmVyLCBp
dCBkaWQgbm90IHJlZHVjZSB0aGlzIHJlZiBjb3VudCBvbiBkZWFsbG9jYXRpb24Kb2YgdGhlIHBy
aW1hcnkgY2hhbm5lbC4gaS5lLiBkdXJpbmcgdW1vdW50LgoKRml4aW5nIHRoaXMgbGVhayBoZXJl
LCBieSBkcm9wcGluZyB0aGlzIHJlZiBjb3VudCBmb3IKcHJpbWFyeSBjaGFubmVsIHdoaWxlIGZy
ZWVpbmcgdXAgdGhlIHNlc3Npb24uCgpGaXhlczogZmExZDA1MDhiZGQ0ICgiY2lmczogYWNjb3Vu
dCBmb3IgcHJpbWFyeSBjaGFubmVsIGluIHRoZSBpbnRlcmZhY2UgbGlzdCIpCkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiBQYXVsbyBBbGNhbnRhcmEgPHBjQG1hbmd1ZWJp
dC5jb20+ClNpZ25lZC1vZmYtYnk6IFNoeWFtIFByYXNhZCBOIDxzcHJhc2FkQG1pY3Jvc29mdC5j
b20+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4K
LS0tCiBmcy9zbWIvY2xpZW50L2Nvbm5lY3QuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jb25uZWN0LmMgYi9m
cy9zbWIvY2xpZW50L2Nvbm5lY3QuYwppbmRleCA1N2MyYTdkZjM0NTcuLmY4OTZmNjBjOTI0YiAx
MDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jb25uZWN0LmMKKysrIGIvZnMvc21iL2NsaWVudC9j
b25uZWN0LmMKQEAgLTIwNjUsNiArMjA2NSwxMiBAQCB2b2lkIF9fY2lmc19wdXRfc21iX3Nlcyhz
dHJ1Y3QgY2lmc19zZXMgKnNlcykKIAkJc2VzLT5jaGFuc1tpXS5zZXJ2ZXIgPSBOVUxMOwogCX0K
IAorCS8qIHdlIG5vdyBhY2NvdW50IGZvciBwcmltYXJ5IGNoYW5uZWwgaW4gaWZhY2UtPnJlZmNv
dW50ICovCisJaWYgKHNlcy0+Y2hhbnNbMF0uaWZhY2UpIHsKKwkJa3JlZl9wdXQoJnNlcy0+Y2hh
bnNbMF0uaWZhY2UtPnJlZmNvdW50LCByZWxlYXNlX2lmYWNlKTsKKwkJc2VzLT5jaGFuc1swXS5z
ZXJ2ZXIgPSBOVUxMOworCX0KKwogCXNlc0luZm9GcmVlKHNlcyk7CiAJY2lmc19wdXRfdGNwX3Nl
c3Npb24oc2VydmVyLCAwKTsKIH0KLS0gCjIuMzkuMgoK
--000000000000c7aa00060a49c1ea
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-cifs-fix-lock-ordering-while-disabling-multichannel.patch"
Content-Disposition: attachment; 
	filename="0002-cifs-fix-lock-ordering-while-disabling-multichannel.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lp1kc5bv1>
X-Attachment-Id: f_lp1kc5bv1

RnJvbSA1ZWVmMTJjNGUzMjMwZjIwMjVkYzQ2YWQ4YzRhM2JjMTk5NzhlNWQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29t
PgpEYXRlOiBUdWUsIDE0IE5vdiAyMDIzIDA0OjU4OjIzICswMDAwClN1YmplY3Q6IFtQQVRDSCAy
LzJdIGNpZnM6IGZpeCBsb2NrIG9yZGVyaW5nIHdoaWxlIGRpc2FibGluZyBtdWx0aWNoYW5uZWwK
ClRoZSBjb2RlIHRvIGhhbmRsZSB0aGUgY2FzZSBvZiBzZXJ2ZXIgZGlzYWJsaW5nIG11bHRpY2hh
bm5lbAp3YXMgcGlja2luZyBpZmFjZV9sb2NrIHdpdGggY2hhbl9sb2NrIGhlbGQuIFRoaXMgZ29l
cyBhZ2FpbnN0CnRoZSBsb2NrIG9yZGVyaW5nIHJ1bGVzLCBhcyBpZmFjZV9sb2NrIGlzIGEgaGln
aGVyIG9yZGVyIGxvY2sKKGV2ZW4gaWYgaXQgaXNuJ3Qgc28gb2J2aW91cykuCgpUaGlzIGNoYW5n
ZSBmaXhlcyB0aGUgbG9jayBvcmRlcmluZyBieSBkb2luZyB0aGUgZm9sbG93aW5nIGluCnRoYXQg
b3JkZXIgZm9yIGVhY2ggc2Vjb25kYXJ5IGNoYW5uZWw6CjEuIHN0b3JlIGlmYWNlIGFuZCBzZXJ2
ZXIgcG9pbnRlcnMgaW4gbG9jYWwgdmFyaWFibGUKMi4gcmVtb3ZlIHJlZmVyZW5jZXMgdG8gaWZh
Y2UgYW5kIHNlcnZlciBpbiBjaGFubmVscwozLiB1bmxvY2sgY2hhbl9sb2NrCjQuIGxvY2sgaWZh
Y2VfbG9jawo1LiBkZWMgcmVmIGNvdW50IGZvciBpZmFjZQo2LiB1bmxvY2sgaWZhY2VfbG9jawo3
LiBkZWMgcmVmIGNvdW50IGZvciBzZXJ2ZXIKOC4gbG9jayBjaGFuX2xvY2sgYWdhaW4KClNpbmNl
IHRoaXMgZnVuY3Rpb24gY2FuIG9ubHkgYmUgY2FsbGVkIGluIHNtYjJfcmVjb25uZWN0LCBhbmQK
dGhhdCBjYW5ub3QgYmUgY2FsbGVkIGJ5IHR3byBwYXJhbGxlbCBwcm9jZXNzZXMsIHdlIHNob3Vs
ZCBub3QKaGF2ZSByYWNlcyBkdWUgdG8gZHJvcHBpbmcgY2hhbl9sb2NrIGJldHdlZW4gc3RlcHMg
MyBhbmQgOC4KCkZpeGVzOiBlZTFkMjE3OTRlNTUgKCJjaWZzOiBoYW5kbGUgd2hlbiBzZXJ2ZXIg
c3RvcHMgc3VwcG9ydGluZyBtdWx0aWNoYW5uZWwiKQpSZXBvcnRlZC1ieTogUGF1bG8gQWxjYW50
YXJhIDxwY0BtYW5ndWViaXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTaHlhbSBQcmFzYWQgTiA8c3By
YXNhZEBtaWNyb3NvZnQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNo
QG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2NsaWVudC9zZXNzLmMgfCAyMiArKysrKysrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L3Nlc3MuYyBiL2ZzL3NtYi9jbGllbnQv
c2Vzcy5jCmluZGV4IDBiYjJhYzkyOTA2MS4uOGIyZDdjMWNhNDI4IDEwMDY0NAotLS0gYS9mcy9z
bWIvY2xpZW50L3Nlc3MuYworKysgYi9mcy9zbWIvY2xpZW50L3Nlc3MuYwpAQCAtMzIyLDI4ICsz
MjIsMzIgQEAgY2lmc19kaXNhYmxlX3NlY29uZGFyeV9jaGFubmVscyhzdHJ1Y3QgY2lmc19zZXMg
KnNlcykKIAkJaWZhY2UgPSBzZXMtPmNoYW5zW2ldLmlmYWNlOwogCQlzZXJ2ZXIgPSBzZXMtPmNo
YW5zW2ldLnNlcnZlcjsKIAorCQkvKgorCQkgKiByZW1vdmUgdGhlc2UgcmVmZXJlbmNlcyBmaXJz
dCwgc2luY2Ugd2UgbmVlZCB0byB1bmxvY2sKKwkJICogdGhlIGNoYW5fbG9jayBoZXJlLCBzaW5j
ZSBpZmFjZV9sb2NrIGlzIGEgaGlnaGVyIGxvY2sKKwkJICovCisJCXNlcy0+Y2hhbnNbaV0uaWZh
Y2UgPSBOVUxMOworCQlzZXMtPmNoYW5zW2ldLnNlcnZlciA9IE5VTEw7CisJCXNwaW5fdW5sb2Nr
KCZzZXMtPmNoYW5fbG9jayk7CisKIAkJaWYgKGlmYWNlKSB7CiAJCQlzcGluX2xvY2soJnNlcy0+
aWZhY2VfbG9jayk7CiAJCQlrcmVmX3B1dCgmaWZhY2UtPnJlZmNvdW50LCByZWxlYXNlX2lmYWNl
KTsKLQkJCXNlcy0+Y2hhbnNbaV0uaWZhY2UgPSBOVUxMOwogCQkJaWZhY2UtPm51bV9jaGFubmVs
cy0tOwogCQkJaWYgKGlmYWNlLT53ZWlnaHRfZnVsZmlsbGVkKQogCQkJCWlmYWNlLT53ZWlnaHRf
ZnVsZmlsbGVkLS07CiAJCQlzcGluX3VubG9jaygmc2VzLT5pZmFjZV9sb2NrKTsKIAkJfQogCi0J
CXNwaW5fdW5sb2NrKCZzZXMtPmNoYW5fbG9jayk7Ci0JCWlmIChzZXJ2ZXIgJiYgIXNlcnZlci0+
dGVybWluYXRlKSB7Ci0JCQlzZXJ2ZXItPnRlcm1pbmF0ZSA9IHRydWU7Ci0JCQljaWZzX3NpZ25h
bF9jaWZzZF9mb3JfcmVjb25uZWN0KHNlcnZlciwgZmFsc2UpOwotCQl9Ci0JCXNwaW5fbG9jaygm
c2VzLT5jaGFuX2xvY2spOwotCiAJCWlmIChzZXJ2ZXIpIHsKLQkJCXNlcy0+Y2hhbnNbaV0uc2Vy
dmVyID0gTlVMTDsKKwkJCWlmICghc2VydmVyLT50ZXJtaW5hdGUpIHsKKwkJCQlzZXJ2ZXItPnRl
cm1pbmF0ZSA9IHRydWU7CisJCQkJY2lmc19zaWduYWxfY2lmc2RfZm9yX3JlY29ubmVjdChzZXJ2
ZXIsIGZhbHNlKTsKKwkJCX0KIAkJCWNpZnNfcHV0X3RjcF9zZXNzaW9uKHNlcnZlciwgZmFsc2Up
OwogCQl9CiAKKwkJc3Bpbl9sb2NrKCZzZXMtPmNoYW5fbG9jayk7CiAJfQogCiBkb25lOgotLSAK
Mi4zOS4yCgo=
--000000000000c7aa00060a49c1ea--

