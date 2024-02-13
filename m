Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056585296E
	for <lists+samba-technical@lfdr.de>; Tue, 13 Feb 2024 07:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Uro2vIL5UzfLR9CBkRK8hQUEzXauSQuSPFm2NOww4vM=; b=qWLCJaZc9TpPduiAErWN1RhK40
	Rgbn24dz5msU3F5u8LUZDjltEGctWBNDC3I2lVuIxjKCqKEFTRcT65u491ypi9jKEbwPCpQw5DOwz
	DI8z/BmwzrLgUhNpavUtIJ7CWCLVs2G1/Q3Slo5GoUk6HH1qDXsHk0wMiYuUfO6zNSJ4LLMwJ2Wjh
	YJMCMtaUB4RwaGmY3DPtRBnLhksE/G2evogvMxPxjfF362Ry2yjeLsZ+0h0l3igG4voCgzZvcXOIu
	RaWgMQjnQIBiBTc5TCnOXEtCvFYY2EMEOPhsyzvSeY3K2ymPXuNvrJ06gb3+vCz5/nNVgB6EVJXh+
	ZEd9B9lQ==;
Received: from ip6-localhost ([::1]:59058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rZmfy-008Jvh-NR; Tue, 13 Feb 2024 06:53:54 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:46324) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rZmfe-008JvL-Qf
 for samba-technical@lists.samba.org; Tue, 13 Feb 2024 06:53:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d10ad20955so2270131fa.0
 for <samba-technical@lists.samba.org>; Mon, 12 Feb 2024 22:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707807212; x=1708412012; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Uro2vIL5UzfLR9CBkRK8hQUEzXauSQuSPFm2NOww4vM=;
 b=hk3uwXRtJ0763PWvK2h6EJ/oatA396KXQ0OFYW3JmPuxnN+SIY0id1U9yhL9Fyy0/r
 cdiiUPN3O/rvUxr1lAkiI4DisSPxJiY88m5y7e3XBkQ8iszF0tCOHZhBhL12cr9M9wJ4
 AEHxY7dCu5vT37WqAnG6kMoq1ePBS8nKcmQoxfsmux5KqjuFBFL1L4vwO5ogcYSiZrtO
 kTNbQCMLrMsgNJlsKwozmDQ2iJIfvs106MNSMYmoEmbR7wVu3bz3MtqfjZ/FgRjAy+rs
 B+cnvnoVl3edDddTeE7jyjw9KCZH5cpI3bIGyM6EWKnqo4BtxWqZtSlXO9AdOpxRfY8I
 aTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707807212; x=1708412012;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uro2vIL5UzfLR9CBkRK8hQUEzXauSQuSPFm2NOww4vM=;
 b=HMEa/b2aFWrrnRDqLoTrxGibYmItgvrsMa0iSyACX8c/xWD0i5YqmQ8F8bXDE620V6
 t5qAxhgzroXbpj57qrsga26Hp9IUyDW7ACTHQi56YkLVyH3J7PD0BT26bZK/vPH5o1xQ
 DzLCtfjMpg9UGlqv0ZMjEPTjq7irn1bLaWb+H4Yl8MqyfChJ72NWO/iFy2jqM/ljiibS
 5Jng52RCLeDreDXGZAe5Cdpgzib3weFhegdZ0dAzjh1ZNLLMyeo+SZEUkd4za6tIeuUV
 qTVopwHpV0reXoFZHyXD+ya/zVFnt3DIwuaRQEZOyjHp9ENeUtypRaqjxwTiLGnf+XVU
 dLJQ==
X-Gm-Message-State: AOJu0YzrT7K9DuMmjLX2KvXwufNhY+5YgwVx4CC0DdVD6dQujuBiJE4K
 ViGGltYxPg3QrMJbTWJuT/aSGbKvipN+JhCc5cJsXFREm8H8ZfIirARTZsJx8EWMrwU0nXbpwud
 6JD/W74HcyfCkF2FwFCsZL3qsoMk=
X-Google-Smtp-Source: AGHT+IFo3HToQu71VcjBRfMjOYqBEEmCZPrE3c1U7kVrhysHVzjmvOq9ZHFxPTfNk+RaXE1HVzNNntIFhHtnrB3GJxg=
X-Received: by 2002:a2e:8847:0:b0:2d0:d471:5c67 with SMTP id
 z7-20020a2e8847000000b002d0d4715c67mr5237830ljj.45.1707807211845; Mon, 12 Feb
 2024 22:53:31 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 13 Feb 2024 00:53:19 -0600
Message-ID: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
Subject: [WIP PATCH] allow changing the password on remount in some cases
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000350ef706113dda21"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000350ef706113dda21
Content-Type: text/plain; charset="UTF-8"

cifs: Work-in-progress patch to allow changing password
 during remount

There are cases where a session is disconnected but we can
not reconnect successfully since the user's password has changed
on the server (or expired) and this case currently can not be fixed
without unmount and mounting again which is not always realistic to do.
This patch allows remount to change the password when the session
is disconnected.

This patch needs to be tested for cases where you have multiuser mounts
and to make sure that there are no cases where we are changing
passwords for a different user than the one for the master tcon's
session (cifs_sb->tcon->ses->username)

Future patches should also allow us to setup the keyring (cifscreds)
to have an "alternate password" so we would be able to change
the password before the session drops (without the risk of races
between when the password changes and the disconnect occurs -
ie cases where the old password is still needed because the new
password has not fully rolled out to all servers yet).

See attached patch


-- 
Thanks,

Steve

--000000000000350ef706113dda21
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-Work-in-progress-patch-to-allow-changing-passwo.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-Work-in-progress-patch-to-allow-changing-passwo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lsk077px0>
X-Attachment-Id: f_lsk077px0

RnJvbSA4NjMyZmNjOTE3YzBjMzUyODFiNGJmNGQ4Y2FkZDVmNWFhYTE4NzQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMTMgRmViIDIwMjQgMDA6NDA6MDEgLTA2MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBXb3JrLWluLXByb2dyZXNzIHBhdGNoIHRvIGFsbG93IGNoYW5naW5nIHBhc3N3b3JkCiBk
dXJpbmcgcmVtb3VudAoKVGhlcmUgYXJlIGNhc2VzIHdoZXJlIGEgc2Vzc2lvbiBpcyBkaXNjb25u
ZWN0ZWQgYW5kIHBhc3N3b3JkIGhhcyBjaGFuZ2VkCm9uIHRoZSBzZXJ2ZXIgKG9yIGV4cGlyZWQp
IGZvciB0aGlzIHVzZXIgYW5kIHRoaXMgY3VycmVudGx5IGNhbiBub3QKYmUgZml4ZWQgd2l0aG91
dCB1bm1vdW50IGFuZCBtb3VudGluZyBhZ2Fpbi4gIFRoaXMgcGF0Y2ggYWxsb3dzCnJlbW91bnQg
dG8gY2hhbmdlIHRoZSBwYXNzd29yZCB3aGVuIHRoZSBzZXNzaW9uIGlzIGRpc2Nvbm5lY3QuCgpJ
dCBuZWVkcyB0byBiZSB0ZXN0ZWQgZm9yIGNhc2VzIHdoZXJlIHlvdSBoYXZlIG11bHRpdXNlciBt
b3VudHMKYW5kIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZXJlIGFyZSBubyBjYXNlcyB3aGVyZSB3ZSBh
cmUgY2hhbmdpbmcKcGFzc3dvcmRzIGZvciBhIGRpZmZlcmVudCB1c2VyIHRoYW4gdGhlIG9uZSBm
b3IgdGhlIG1hc3RlciB0Y29uJ3MKc2Vzc2lvbiAoY2lmc19zYi0+dGNvbi0+c2VzLT51c2VybmFt
ZSkKCkZ1dHVyZSBwYXRjaGVzIHNob3VsZCBhbHNvIGFsbG93IHVzIHRvIHNldHVwIHRoZSBrZXly
aW5nIChjaWZzY3JlZHMpCnRvIGhhdmUgYW4gImFsdGVybmF0ZSBwYXNzd29yZCIgc28gd2Ugd291
bGQgYmUgYWJsZSB0byBjaGFuZ2UKdGhlIHBhc3N3b3JkIGJlZm9yZSB0aGUgc2Vzc2lvbiBkcm9w
cyAod2l0aG91dCB0aGUgcmlzayBvZiByYWNlcwpiZXR3ZWVuIHdoZW4gdGhlIHBhc3N3b3JkIGNo
YW5nZXMgYW5kIHRoZSBkaXNjb25uZWN0IG9jY3VycyAtCmllIGNhc2VzIHdoZXJlIHRoZSBvbGQg
cGFzc3dvcmQgaXMgc3RpbGwgbmVlZGVkIGJlY2F1c2UgdGhlIG5ldwpwYXNzd29yZCBoYXMgbm90
IGZ1bGx5IHJvbGxlZCBvdXQgdG8gYWxsIHNlcnZlcnMgeWV0KS4KCkNjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0
LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2ZzX2NvbnRleHQuYyB8IDI0ICsrKysrKysrKysrKysr
KysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9mc19jb250ZXh0LmMgYi9mcy9zbWIvY2xp
ZW50L2ZzX2NvbnRleHQuYwppbmRleCBhZWM4ZGJkMWY5ZGIuLmM3YTBiMmJkN2ExNSAxMDA2NDQK
LS0tIGEvZnMvc21iL2NsaWVudC9mc19jb250ZXh0LmMKKysrIGIvZnMvc21iL2NsaWVudC9mc19j
b250ZXh0LmMKQEAgLTc3Miw3ICs3NzIsNyBAQCBzdGF0aWMgdm9pZCBzbWIzX2ZzX2NvbnRleHRf
ZnJlZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAgKi8KIHN0YXRpYyBpbnQgc21iM192ZXJpZnlf
cmVjb25maWd1cmVfY3R4KHN0cnVjdCBmc19jb250ZXh0ICpmYywKIAkJCQkgICAgICAgc3RydWN0
IHNtYjNfZnNfY29udGV4dCAqbmV3X2N0eCwKLQkJCQkgICAgICAgc3RydWN0IHNtYjNfZnNfY29u
dGV4dCAqb2xkX2N0eCkKKwkJCQkgICAgICAgc3RydWN0IHNtYjNfZnNfY29udGV4dCAqb2xkX2N0
eCwgYm9vbCBuZWVkX3JlY29uKQogewogCWlmIChuZXdfY3R4LT5wb3NpeF9wYXRocyAhPSBvbGRf
Y3R4LT5wb3NpeF9wYXRocykgewogCQljaWZzX2Vycm9yZihmYywgImNhbiBub3QgY2hhbmdlIHBv
c2l4cGF0aHMgZHVyaW5nIHJlbW91bnRcbiIpOwpAQCAtNzk4LDggKzc5OCwxMSBAQCBzdGF0aWMg
aW50IHNtYjNfdmVyaWZ5X3JlY29uZmlndXJlX2N0eChzdHJ1Y3QgZnNfY29udGV4dCAqZmMsCiAJ
fQogCWlmIChuZXdfY3R4LT5wYXNzd29yZCAmJgogCSAgICAoIW9sZF9jdHgtPnBhc3N3b3JkIHx8
IHN0cmNtcChuZXdfY3R4LT5wYXNzd29yZCwgb2xkX2N0eC0+cGFzc3dvcmQpKSkgewotCQljaWZz
X2Vycm9yZihmYywgImNhbiBub3QgY2hhbmdlIHBhc3N3b3JkIGR1cmluZyByZW1vdW50XG4iKTsK
LQkJcmV0dXJuIC1FSU5WQUw7CisJCWlmIChuZWVkX3JlY29uID09IGZhbHNlKSB7CisJCQljaWZz
X2Vycm9yZihmYywKKwkJCQkgICAgImNhbiBub3QgY2hhbmdlIHBhc3N3b3JkIG9mIGFjdGl2ZSBz
ZXNzaW9uIGR1cmluZyByZW1vdW50XG4iKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CiAJfQog
CWlmIChuZXdfY3R4LT5kb21haW5uYW1lICYmCiAJICAgICghb2xkX2N0eC0+ZG9tYWlubmFtZSB8
fCBzdHJjbXAobmV3X2N0eC0+ZG9tYWlubmFtZSwgb2xkX2N0eC0+ZG9tYWlubmFtZSkpKSB7CkBA
IC04NDMsOSArODQ2LDE1IEBAIHN0YXRpYyBpbnQgc21iM19yZWNvbmZpZ3VyZShzdHJ1Y3QgZnNf
Y29udGV4dCAqZmMpCiAJc3RydWN0IHNtYjNfZnNfY29udGV4dCAqY3R4ID0gc21iM19mYzJjb250
ZXh0KGZjKTsKIAlzdHJ1Y3QgZGVudHJ5ICpyb290ID0gZmMtPnJvb3Q7CiAJc3RydWN0IGNpZnNf
c2JfaW5mbyAqY2lmc19zYiA9IENJRlNfU0Iocm9vdC0+ZF9zYik7CisJc3RydWN0IGNpZnNfc2Vz
ICpzZXMgPSBjaWZzX3NiX21hc3Rlcl90Y29uKGNpZnNfc2IpLT5zZXM7CisJYm9vbCBuZWVkX3Jl
Y29uID0gZmFsc2U7CiAJaW50IHJjOwogCi0JcmMgPSBzbWIzX3ZlcmlmeV9yZWNvbmZpZ3VyZV9j
dHgoZmMsIGN0eCwgY2lmc19zYi0+Y3R4KTsKKwlpZiAoKHNlcy0+c2VzX3N0YXR1cyA9PSBTRVNf
TkVFRF9SRUNPTikgfHwKKwkgICAgKHNlcy0+c2VzX3N0YXR1cyA9PSBTRVNfSU5fU0VUVVApKQor
CQluZWVkX3JlY29uID0gdHJ1ZTsKKworCXJjID0gc21iM192ZXJpZnlfcmVjb25maWd1cmVfY3R4
KGZjLCBjdHgsIGNpZnNfc2ItPmN0eCwgbmVlZF9yZWNvbik7CiAJaWYgKHJjKQogCQlyZXR1cm4g
cmM7CiAKQEAgLTg1OCw3ICs4NjcsMTIgQEAgc3RhdGljIGludCBzbWIzX3JlY29uZmlndXJlKHN0
cnVjdCBmc19jb250ZXh0ICpmYykKIAlTVEVBTF9TVFJJTkcoY2lmc19zYiwgY3R4LCBVTkMpOwog
CVNURUFMX1NUUklORyhjaWZzX3NiLCBjdHgsIHNvdXJjZSk7CiAJU1RFQUxfU1RSSU5HKGNpZnNf
c2IsIGN0eCwgdXNlcm5hbWUpOwotCVNURUFMX1NUUklOR19TRU5TSVRJVkUoY2lmc19zYiwgY3R4
LCBwYXNzd29yZCk7CisJaWYgKG5lZWRfcmVjb24gPT0gZmFsc2UpCisJCVNURUFMX1NUUklOR19T
RU5TSVRJVkUoY2lmc19zYiwgY3R4LCBwYXNzd29yZCk7CisJZWxzZSAgeworCQlrZnJlZV9zZW5z
aXRpdmUoc2VzLT5wYXNzd29yZCk7CisJCXNlcy0+cGFzc3dvcmQgPSBrc3RyZHVwKGN0eC0+cGFz
c3dvcmQsIEdGUF9LRVJORUwpOworCX0KIAlTVEVBTF9TVFJJTkcoY2lmc19zYiwgY3R4LCBkb21h
aW5uYW1lKTsKIAlTVEVBTF9TVFJJTkcoY2lmc19zYiwgY3R4LCBub2RlbmFtZSk7CiAJU1RFQUxf
U1RSSU5HKGNpZnNfc2IsIGN0eCwgaW9jaGFyc2V0KTsKLS0gCjIuNDAuMQoK
--000000000000350ef706113dda21--

