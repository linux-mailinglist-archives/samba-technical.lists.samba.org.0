Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1D1D7C37
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 17:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FXT2eI19txENKg7+hTScTQ4gOzu625mwMchtqxvwQXI=; b=y2tBnHXB3tHLZwa5BQy7jL9jsS
	WFc38JR+B7evKY/dlaWJV5k+Ht7pFQ1/ureY7fUkzz1EeFlaKEpvRHzdVoB8RulYIiKkjGwZC61qR
	xi7pX1BwzzbH/5cGA2nO6oZfQR9xcrRa+SyHJ5qtgQ7aHK/nGbYomoMjZUrXsOv4BzyQUKgdK+dcE
	Kww9Ofbr+g78F9nc2yE2Yy9vzV94+jh3Am9U1Sx42+0wJygxChIDMwa/pJKPdeBgI/P+VDlmxnNpW
	KsW+m/X3YDnBwzMXxaqcGiNtxwszZd8Y3Wxirt9X9bHXngpA4twoOfZZOs2AsAkn/uGum4esN7FRY
	zfgECcQw==;
Received: from localhost ([::1]:52990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jahHk-004vPy-Lx; Mon, 18 May 2020 15:02:32 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:45163) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jahHf-004vPr-8y
 for samba-technical@lists.samba.org; Mon, 18 May 2020 15:02:29 +0000
Received: by mail-qv1-xf41.google.com with SMTP id z9so4821614qvi.12
 for <samba-technical@lists.samba.org>; Mon, 18 May 2020 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iBsgUPPdW7WI3R9C4FsWazI5pNlAawve4NyWpKt5Nfw=;
 b=hbpCTFvW8iQG0f3aWnHuYtVcZQFDFKcok1uMw66vn5gaMaRnmuQzjGskr/himVVR/c
 R2JcLlWODZS2AU/piXWCtRIFRQYNYFvXz+jAzbl0uArGa9DDOo7mNIu3QKtcENIYOzvv
 sI15FPqU7EKpDvrbAu1YTTxDi4NDRfDeEtZlk5z7l+rDcKJDmLUgJqIioWPvZS9OJa2n
 /f1Dr/NYWEMJfF4XphMtH14Eb0TPE2GZ8LHgQiM8qu65FzBX4zRNHPODhl2k6L+lUjb8
 +J5QXWhZHugutR4cx3fne8oUa7MSXkgWCA+dGXdwkdM0hWEQnvPlxBva6sT9li6Mbpud
 awjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBsgUPPdW7WI3R9C4FsWazI5pNlAawve4NyWpKt5Nfw=;
 b=b7VUXchgtx1vx7DCalbKtt0OMza4dldXUbaeDv0k1xfmsTKaKVraN8cIrjT7G1acQO
 /Mav6l94Luf6dNj6LPsRUtreuTsuuWV63fmMofdB+0SRFNJjM91kPNqDvQ1jHmdOjvg+
 kw8yQzvu9jHsbGN//o2TpfDGNtj/25fZsvOgtI4P2foTI01LIER+0sa/pY+ymVN+7dc+
 uJuvEmLhvFUL5DWhw5NdrwYAjMoUZ3sMxYUUefkxKiKB0hFuBYwobOz20WVY+kb1XlX0
 ZwPaiK2KjU3x+Nh6JZW0AFMtD5jK5lLLHH0fcPmOi26ziSu0hBPicUBH0lmXf1L/z2Gs
 RkBw==
X-Gm-Message-State: AOAM533J/6aaL5wgPmX1ZdCOsEZ0YSsnyprZ9FMg00ecP+0UMI/o6j06
 ye8O/mt9H3o30DBaVm/cwfJSli2bMjBQVYP1qT8=
X-Google-Smtp-Source: ABdhPJw2IUZ1QjXZsHH4o9Dklh0BHueByf5qXXYXvdIsrDws0Ke7plCrLBx3Vtb8SJRBSuiBuXSf1NM1JfRs0Meth3U=
X-Received: by 2002:a0c:f054:: with SMTP id b20mr15806588qvl.112.1589814145076; 
 Mon, 18 May 2020 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
In-Reply-To: <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
Date: Mon, 18 May 2020 20:32:12 +0530
Message-ID: <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
To: Ralph Boehme <slow@samba.org>
Content-Type: multipart/mixed; boundary="0000000000006082af05a5ed73a0"
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
From: anubhav rakshit via samba-technical <samba-technical@lists.samba.org>
Reply-To: anubhav rakshit <anubhav.rakshit@gmail.com>
Cc: hemanth.thummala@nutanix.com,
 "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000006082af05a5ed73a0
Content-Type: text/plain; charset="UTF-8"

Hi Ralph,
I am attaching additional test case that would verify
Create(RO)->Read->Write->Read->Close chain. As expected we see Write
failing with ACCESS DENIED.

=-=-=
2948 35.969303 10.46.189.203 10.46.184.237 SMB2 742 Create Request File:
compound_related6.dat;Read Request Len:1 Off:0;Write Request Len:64
Off:0;Read Request Len:1 Off:0;Close Request
2949 35.969500 10.46.184.237 10.46.189.203 SMB2 606 Create Response File:
compound_related6.dat;Read Response;Write Response, Error:
STATUS_ACCESS_DENIED;Read Response;Close Response
=-=-=

Thanks,
Anubhav

On Mon, May 18, 2020 at 4:19 PM Ralph Boehme <slow@samba.org> wrote:

> Am 5/15/20 um 11:29 PM schrieb Anubhav Rakshit via samba-technical:
> > Please review the following patches.They consist of:
> > 1. Smbtorture test case to verify the expected behaviour in case of
> > Create failure in a compound related chain.
> > 2. Implement the behaviour in Samba Fileserver code.
> >
> > I have attached the patches.
> > The changes are also staged in github.
> >
> https://github.com/anubhavrakshit/samba/commit/a0e7d6196b259038342569d371ff67ed30c9b6b8
> >
> https://github.com/anubhavrakshit/samba/commit/4637b6108f188c1a2df7cce94165b621294942a1
>
> https://gitlab.com/samba-team/samba/-/merge_requests/1350
>
> -slow
>
> --
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
>
>

--0000000000006082af05a5ed73a0
Content-Type: text/plain; charset="US-ASCII"; name="compound_smbtor.txt"
Content-Disposition: attachment; filename="compound_smbtor.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kacm94t40>
X-Attachment-Id: f_kacm94t40

RnJvbSA2MTllOTM0ZjZjYWFhYWYxMTQ5MmZmMmQwNWZkNjk3NzQ1ODBlZjg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbnViaGF2IFJha3NoaXQgPGFudWJoYXYucmFrc2hpdEBnbWFp
bC5jb20+CkRhdGU6IE1vbiwgMTggTWF5IDIwMjAgMjA6MjA6MDUgKzA1MzAKU3ViamVjdDogW1BB
VENIXSBzbWJ0b3J0dXJlIHRlc3QgY2FzZSB0byB2ZXJpZnkgQ29tcG91bmQgcmVsYXRlZCBoYW5k
bGluZwoKVGhpcyB0ZXN0IGNhc2UgY2hlY2tzIHdoYXQgaGFwcGVucyB3aGVuIHdlIGhhdmUgYW4g
aW50ZXJtZWRpYXRlIHJlcXVlc3QKZmFpbHVyZSBhbmQgaG93IGl0IGltcGFjdHMgcmVzdCBvZiB0
aGUgY2hhaW4uCgpTaWduZWQtb2ZmLWJ5OiBBbnViaGF2IFJha3NoaXQgPGFudWJoYXYucmFrc2hp
dEBnbWFpbC5jb20+Ci0tLQogc291cmNlNC90b3J0dXJlL3NtYjIvY29tcG91bmQuYyB8IDk0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDk0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VyY2U0L3RvcnR1cmUvc21iMi9jb21wb3VuZC5jIGIv
c291cmNlNC90b3J0dXJlL3NtYjIvY29tcG91bmQuYwppbmRleCA5YWIzNzBkNjc5Mi4uNTJjNDVl
ODNjMGQgMTAwNjQ0Ci0tLSBhL3NvdXJjZTQvdG9ydHVyZS9zbWIyL2NvbXBvdW5kLmMKKysrIGIv
c291cmNlNC90b3J0dXJlL3NtYjIvY29tcG91bmQuYwpAQCAtNTc1LDYgKzU3NSw5OCBAQCBkb25l
OgogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBib29sIHRlc3RfY29tcG91bmRfcmVsYXRlZDYo
c3RydWN0IHRvcnR1cmVfY29udGV4dCAqdGN0eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHNtYjJfdHJlZSAqdHJlZSkgeworICBzdHJ1Y3Qgc21iMl9oYW5kbGUg
aGQ7CisgIHN0cnVjdCBzbWIyX2NyZWF0ZSBjcjsKKyAgc3RydWN0IHNtYjJfcmVhZCByZDsKKyAg
c3RydWN0IHNtYjJfd3JpdGUgd3I7CisgIHN0cnVjdCBzbWIyX2Nsb3NlIGNsOworICBOVFNUQVRV
UyBzdGF0dXM7CisgIGNvbnN0IGNoYXIgKmZuYW1lID0gImNvbXBvdW5kX3JlbGF0ZWQ2LmRhdCI7
CisgIHN0cnVjdCBzbWIyX3JlcXVlc3QgKnJlcVs1XTsKKyAgdWludDhfdCBidWZbNjRdOworICBi
b29sIHJldCA9IHRydWU7CisKKyAgc21iMl91dGlsX3VubGluayh0cmVlLCBmbmFtZSk7CisKKyAg
WkVST19TVFJVQ1QoY3IpOworICBjci5sZXZlbCA9IFJBV19PUEVOX1NNQjI7CisgIGNyLmluLmNy
ZWF0ZV9mbGFncyA9IDA7CisgIGNyLmluLmRlc2lyZWRfYWNjZXNzID0gU0VDX1JJR0hUU19GSUxF
X0FMTDsKKyAgY3IuaW4uY3JlYXRlX29wdGlvbnMgPSAwOworICBjci5pbi5maWxlX2F0dHJpYnV0
ZXMgPSBGSUxFX0FUVFJJQlVURV9OT1JNQUw7CisgIGNyLmluLnNoYXJlX2FjY2VzcyA9IE5UQ1JF
QVRFWF9TSEFSRV9BQ0NFU1NfREVMRVRFIHwKKyAgICAgICAgICAgICAgICAgICAgICAgTlRDUkVB
VEVYX1NIQVJFX0FDQ0VTU19SRUFEIHwKKyAgICAgICAgICAgICAgICAgICAgICAgTlRDUkVBVEVY
X1NIQVJFX0FDQ0VTU19XUklURTsKKyAgY3IuaW4uYWxsb2Nfc2l6ZSA9IDA7CisgIGNyLmluLmNy
ZWF0ZV9kaXNwb3NpdGlvbiA9IE5UQ1JFQVRFWF9ESVNQX09QRU5fSUY7CisgIGNyLmluLmltcGVy
c29uYXRpb25fbGV2ZWwgPSBOVENSRUFURVhfSU1QRVJTT05BVElPTl9BTk9OWU1PVVM7CisgIGNy
LmluLnNlY3VyaXR5X2ZsYWdzID0gMDsKKyAgY3IuaW4uZm5hbWUgPSBmbmFtZTsKKworICBzdGF0
dXMgPSBzbWIyX2NyZWF0ZSh0cmVlLCB0Y3R4LCAmY3IpOworICBDSEVDS19TVEFUVVMoc3RhdHVz
LCBOVF9TVEFUVVNfT0spOworICBoZCA9IGNyLm91dC5maWxlLmhhbmRsZTsKKworICBaRVJPX1NU
UlVDVChidWYpOworICBzdGF0dXMgPSBzbWIyX3V0aWxfd3JpdGUodHJlZSwgaGQsIGJ1ZiwgMCwg
QVJSQVlfU0laRShidWYpKTsKKyAgQ0hFQ0tfU1RBVFVTKHN0YXR1cywgTlRfU1RBVFVTX09LKTsK
KworICB0b3J0dXJlX2NvbW1lbnQodGN0eCwgInRyeSBvcGVuIGZvciByZWFkXG4iKTsKKyAgY3Iu
aW4uZGVzaXJlZF9hY2Nlc3MgPSBTRUNfRklMRV9SRUFEX0RBVEE7CisgIHNtYjJfdHJhbnNwb3J0
X2NvbXBvdW5kX3N0YXJ0KHRyZWUtPnNlc3Npb24tPnRyYW5zcG9ydCwgNSk7CisKKyAgcmVxWzBd
ID0gc21iMl9jcmVhdGVfc2VuZCh0cmVlLCAmY3IpOworCisgIGhkLmRhdGFbMF0gPSBVSU5UNjRf
TUFYOworICBoZC5kYXRhWzFdID0gVUlOVDY0X01BWDsKKworICBzbWIyX3RyYW5zcG9ydF9jb21w
b3VuZF9zZXRfcmVsYXRlZCh0cmVlLT5zZXNzaW9uLT50cmFuc3BvcnQsIHRydWUpOworCisgIFpF
Uk9fU1RSVUNUKHJkKTsKKyAgcmQuaW4uZmlsZS5oYW5kbGUgPSBoZDsKKyAgcmQuaW4ubGVuZ3Ro
ICAgICAgPSAxOworICByZC5pbi5vZmZzZXQgICAgICA9IDA7CisKKyAgcmVxWzFdID0gc21iMl9y
ZWFkX3NlbmQodHJlZSwgJnJkKTsKKworICBaRVJPX1NUUlVDVCh3cik7CisgIHdyLmluLmZpbGUu
aGFuZGxlID0gaGQ7CisgIHdyLmluLm9mZnNldCA9IDA7CisgIHdyLmluLmRhdGEgPSBkYXRhX2Js
b2JfdGFsbG9jKHRjdHgsIE5VTEwsIDY0KTsKKworICByZXFbMl0gPSBzbWIyX3dyaXRlX3NlbmQo
dHJlZSwgJndyKTsKKworICBaRVJPX1NUUlVDVChyZCk7CisgIHJkLmluLmZpbGUuaGFuZGxlID0g
aGQ7CisgIHJkLmluLmxlbmd0aCAgICAgID0gMTsKKyAgcmQuaW4ub2Zmc2V0ICAgICAgPSAwOwor
CisgIHJlcVszXSA9IHNtYjJfcmVhZF9zZW5kKHRyZWUsICZyZCk7CisKKyAgWkVST19TVFJVQ1Qo
Y2wpOworICBjbC5pbi5maWxlLmhhbmRsZSA9IGhkOworCisgIHJlcVs0XSA9IHNtYjJfY2xvc2Vf
c2VuZCh0cmVlLCAmY2wpOworCisgIHN0YXR1cyA9IHNtYjJfY3JlYXRlX3JlY3YocmVxWzBdLCB0
cmVlLCAmY3IpOworICBDSEVDS19TVEFUVVMoc3RhdHVzLCBOVF9TVEFUVVNfT0spOworICBzdGF0
dXMgPSBzbWIyX3JlYWRfcmVjdihyZXFbMV0sIHRyZWUsICZyZCk7CisgIENIRUNLX1NUQVRVUyhz
dGF0dXMsIE5UX1NUQVRVU19PSyk7CisgIHN0YXR1cyA9IHNtYjJfd3JpdGVfcmVjdihyZXFbMl0s
ICZ3cik7CisgIENIRUNLX1NUQVRVUyhzdGF0dXMsIE5UX1NUQVRVU19BQ0NFU1NfREVOSUVEKTsK
KyAgc3RhdHVzID0gc21iMl9yZWFkX3JlY3YocmVxWzNdLCB0cmVlLCAmcmQpOworICBDSEVDS19T
VEFUVVMoc3RhdHVzLCBOVF9TVEFUVVNfT0spOworICBzdGF0dXMgPSBzbWIyX2Nsb3NlX3JlY3Yo
cmVxWzRdLCAmY2wpOworICBDSEVDS19TVEFUVVMoc3RhdHVzLCBOVF9TVEFUVVNfT0spOworZG9u
ZToKKyAgc21iMl91dGlsX3VubGluayh0cmVlLCBmbmFtZSk7CisgIHNtYjJfdGRpcyh0cmVlKTsK
KyAgc21iMl9sb2dvZmYodHJlZS0+c2Vzc2lvbik7CisgIHJldHVybiByZXQ7Cit9CisKIHN0YXRp
YyBib29sIHRlc3RfY29tcG91bmRfcGFkZGluZyhzdHJ1Y3QgdG9ydHVyZV9jb250ZXh0ICp0Y3R4
LAogCQkJCSAgc3RydWN0IHNtYjJfdHJlZSAqdHJlZSkKIHsKQEAgLTE1NzQsNiArMTY2Niw4IEBA
IHN0cnVjdCB0b3J0dXJlX3N1aXRlICp0b3J0dXJlX3NtYjJfY29tcG91bmRfaW5pdChUQUxMT0Nf
Q1RYICpjdHgpCiAJCQkJICAgICB0ZXN0X2NvbXBvdW5kX3JlbGF0ZWQ0KTsKIAl0b3J0dXJlX3N1
aXRlX2FkZF8xc21iMl90ZXN0KHN1aXRlLCAicmVsYXRlZDUiLAogCQkJCSAgICAgdGVzdF9jb21w
b3VuZF9yZWxhdGVkNSk7CisJdG9ydHVyZV9zdWl0ZV9hZGRfMXNtYjJfdGVzdChzdWl0ZSwgInJl
bGF0ZWQ2IiwKKwkJCQkgICAgIHRlc3RfY29tcG91bmRfcmVsYXRlZDYpOwogCXRvcnR1cmVfc3Vp
dGVfYWRkXzFzbWIyX3Rlc3Qoc3VpdGUsICJ1bnJlbGF0ZWQxIiwgdGVzdF9jb21wb3VuZF91bnJl
bGF0ZWQxKTsKIAl0b3J0dXJlX3N1aXRlX2FkZF8xc21iMl90ZXN0KHN1aXRlLCAiaW52YWxpZDEi
LCB0ZXN0X2NvbXBvdW5kX2ludmFsaWQxKTsKIAl0b3J0dXJlX3N1aXRlX2FkZF8xc21iMl90ZXN0
KHN1aXRlLCAiaW52YWxpZDIiLCB0ZXN0X2NvbXBvdW5kX2ludmFsaWQyKTsKLS0gCjIuMjAuMQoK
--0000000000006082af05a5ed73a0--

