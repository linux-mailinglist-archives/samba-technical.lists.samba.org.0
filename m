Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5A35F392B
	for <lists+samba-technical@lfdr.de>; Tue,  4 Oct 2022 00:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J2VEhXIkUhFuyCaE6y4HmQp12FrwES5jEagrof5I97o=; b=1nmqZ1UJN8PsD17ogIqy3pMpRI
	3GBdNuV3B0bjegU9c6fqkHPXBhJYnmQvWGz4cR92lpWryUMxo12Ir+MTzmfwzFTptNJen9Ovov6HJ
	uVYpWvP8PJQRdzak3X4pseqjyLBzeCOhAxVjP7rpuAZfHsxl8iT4AOV4i3KwsoFsuz9SPk8iImxEJ
	4xx2Ct0kaPz8ai1ZAVOy2JyN49jswU9P4D3oEkFeK96KbylD6dhj+h47+ddaguwlE769AVbmu7lZM
	m5xk5B4ZsH+Fl97qVAkPhJpI/kHJ1kQZ/HqnGR5wkh38ccFGFdhZ7CLiiiUHLkG6txf/nv6cz+ktr
	RUWacotQ==;
Received: from ip6-localhost ([::1]:50270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofU2y-007jl5-Ka; Mon, 03 Oct 2022 22:36:24 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:45750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofU2t-007jkv-MI
 for samba-technical@lists.samba.org; Mon, 03 Oct 2022 22:36:22 +0000
Received: by mail-vs1-xe35.google.com with SMTP id t18so6201841vsr.12
 for <samba-technical@lists.samba.org>; Mon, 03 Oct 2022 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=J2VEhXIkUhFuyCaE6y4HmQp12FrwES5jEagrof5I97o=;
 b=XMV/ZG5pfpCmBSXHiyM7/0J96KZ2jZfWDZ0PY6xAZdlH3yp00WJoN4HnRyDL3tm7AV
 V9OR+jSwjzD0xTzJNwl8U7mb62D2/Lzwr/cTMTRJZrM71oJe8E5YW7ef/ivkDFeztnZs
 yrm9HiPcuwIdWsjrf9Hqc/N6MYSblsn1/QkvlAGGnM59+KydBW4VFn5ql4tVv/cIjbco
 6GuzagnOpdfoMVAtF2Mq/zN/QojrN/eLM+nVTrFYiff/MLsJ79HFLTouVZfWyiKbI58B
 Nd9/aY4jFA9o1ee9jpdQNng1v1o5WfDLKdbiYmkiZDrtEJOWtGD2SELSRg8k1YWeTevp
 2wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=J2VEhXIkUhFuyCaE6y4HmQp12FrwES5jEagrof5I97o=;
 b=LtWTV8kFYFkS1WLEMivkcVWymRCcn51xRiBjfAROx18rgCh9p5yKSOMbJ+5pERoMs7
 vQLsHbQLtHn/JiY3PMmJolkBIKUnyapXdYOlAxEkcgdEbgaKP2S0g4LCP5lk4RdXHDPH
 ZRdYXtt4BlqjD1/ljSqdp1etnladqlexA4LoItkuaJLeIgLqqyJ+OT+rOTXeIrjS12nN
 GuVewt39dOj/JPhUKi9fLQ0MT8K2miCFns5NgQd/pNlKXNp82j6YdD8BJA90Vms2u6B2
 Li26W3ySqRhzeSC9wa0DyHcW9j7zoMXlH+dgXyUmnhbDFErxE30inp68dw98Fkx6Nua6
 8O2g==
X-Gm-Message-State: ACrzQf3AUx5vR9+NkyYw0NXWCod2fo+JNzW+XKwbwSoX68WduRbgznlL
 8z6rRAgMIeXtCt5ZcDe+shlNZnwQ8RLe3JUAtHg=
X-Google-Smtp-Source: AMsMyM6RhqVxJBxZ4Ku8u0WCZ1i6fRsREPNrj/plSImW8JSfFXUBZ4Zz+MmvVveTXi3lFogB4XY+ZAG2I58toMS8/WQ=
X-Received: by 2002:a67:cb87:0:b0:3a6:8ee3:994 with SMTP id
 h7-20020a67cb87000000b003a68ee30994mr1899062vsl.6.1664836577667; Mon, 03 Oct
 2022 15:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
 <df473fde-e79d-ae90-37bb-3a3869d3aa9a@talpey.com>
 <CAH2r5msDX4eaGuyine__ePtOTRoSBDjiUN_dthaHpiA9UKm0yg@mail.gmail.com>
 <d7bf66c8-0695-a239-4bfb-d234241479ac@talpey.com>
 <CAH2r5mtyshZWxN9nycxyu-_mDsJBkmFP_JMJZCm5RL_FP+3bmA@mail.gmail.com>
In-Reply-To: <CAH2r5mtyshZWxN9nycxyu-_mDsJBkmFP_JMJZCm5RL_FP+3bmA@mail.gmail.com>
Date: Mon, 3 Oct 2022 17:36:06 -0500
Message-ID: <CAH2r5muv++9HAyCMfxuez8DakR=1-kkGYpGNVF=TE86FvsUkBA@mail.gmail.com>
Subject: Re: [PATCH][smb3 client] log less confusing message on multichannel
 mounts to Samba when no interfaces returned
To: Tom Talpey <tom@talpey.com>
Content-Type: multipart/mixed; boundary="000000000000d243ec05ea28f894"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000d243ec05ea28f894
Content-Type: text/plain; charset="UTF-8"

attached wrong patch - resending


On Mon, Oct 3, 2022 at 5:32 PM Steve French <smfrench@gmail.com> wrote:
>
> updated patch to:
> 1) log the server name for this message
> 2) only log on mount (not every ten minutes)
>
> See attached
>
> On Mon, Oct 3, 2022 at 9:21 AM Tom Talpey <tom@talpey.com> wrote:
> >
> > On 10/3/2022 12:38 AM, Steve French wrote:
> > > On Sat, Oct 1, 2022 at 6:22 PM Tom Talpey <tom@talpey.com> wrote:
> > >>
> > >> On 10/1/2022 12:54 PM, Steve French wrote:
> > >>> Some servers can return an empty network interface list so, unless
> > >>> multichannel is requested, no need to log an error for this, and
> > >>> when multichannel is requested on mount but no interfaces, log
> > >>> something less confusing.  For this case change
> > >>>      parse_server_interfaces: malformed interface info
> > >>> to
> > >>>      empty network interface list returned by server
> > >>
> > >> Will this spam the log if it happens on every MC refresh (10 mins)?
> > >> It might be helpful to identify the servername, too.
> > >
> > > Yes - I just noticed that in this case (multichannel mount to Samba
> > > where no valid interfaces) we log it every ten minutes.
> > > Maybe best way to fix this is to change it to a log once error (with
> > > server name is fine with me) since it is probably legal to return an
> > > empty list (so not serious enough to be worth logging every ten
> > > minutes) and in theory server could fix its interfaces later.
> >
> > Ten minutes is the default recommended polling interval in the doc.
> >
> > While it's odd, it's not prevented by the protocol. I could guess
> > that a server running in a namespace might return strange things
> > as devices came and went, for example.
> >
> > It's not an error, so the message is purely informational. It is
> > useful though. Is it possible to suppress the logging if the
> > message *doesn't* change, but otherwise emit new ones? That might
> > require some per-server fiddling to avoid multiple servers flipping
> > the message.
> >
> > A boolean or bit in the server struct? A little ugly for the purpose,
> > but surfacing multichannel events - especially ones that prevent it
> > from happening - seems worthwhile.
> >
> > Tom.
> >
> >
> > Tom.
> >
> >
> > >>> Cc: <stable@vger.kernel.org>
> > >>> Signed-off-by: Steve French <stfrench@microsoft.com>
> > >>>
> > >>> See attached patch
> > >>>
> > >
> > >
> > >
>
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--000000000000d243ec05ea28f894
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-do-not-log-confusing-message-when-server-return.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-do-not-log-confusing-message-when-server-return.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l8tcp47n0>
X-Attachment-Id: f_l8tcp47n0

RnJvbSBjZjgyYTRjMTc4NDBhNjk3MWZlZThjYjBlNGMyYWQwNjBmMDI4M2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMTo0NDowOCAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGRvIG5vdCBsb2cgY29uZnVzaW5nIG1lc3NhZ2Ugd2hlbiBzZXJ2ZXIgcmV0dXJucyBubwog
bmV0d29yayBpbnRlcmZhY2VzCgpTb21lIHNlcnZlcnMgY2FuIHJldHVybiBhbiBlbXB0eSBuZXR3
b3JrIGludGVyZmFjZSBsaXN0IHNvLCB1bmxlc3MKbXVsdGljaGFubmVsIGlzIHJlcXVlc3RlZCwg
bm8gbmVlZCB0byBsb2cgYW4gZXJyb3IgZm9yIHRoaXMsIGFuZAp3aGVuIG11bHRpY2hhbm5lbCBp
cyByZXF1ZXN0ZWQgb24gbW91bnQgYnV0IG5vIGludGVyZmFjZXMsIGxvZwpzb21ldGhpbmcgbGVz
cyBjb25mdXNpbmcuICBGb3IgdGhpcyBjYXNlIGNoYW5nZQogICBwYXJzZV9zZXJ2ZXJfaW50ZXJm
YWNlczogbWFsZm9ybWVkIGludGVyZmFjZSBpbmZvCnRvCiAgIGVtcHR5IG5ldHdvcmsgaW50ZXJm
YWNlIGxpc3QgcmV0dXJuZWQgYnkgc2VydmVyIGxvY2FsaG9zdAoKQWxzbyBkbyBub3QgcmVsb2cg
dGhpcyBlcnJvciBldmVyeSB0ZW4gbWludXRlcyAob25seSBsb2cgb24gbW91bnQsIG9uY2UpCgpD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8
c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL2NpZnNwcm90by5oIHwgIDIgKy0K
IGZzL2NpZnMvY29ubmVjdC5jICAgfCAgMiArLQogZnMvY2lmcy9zbWIyb3BzLmMgICB8IDIzICsr
KysrKysrKysrKysrKysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9jaWZzcHJvdG8uaCBiL2ZzL2Np
ZnMvY2lmc3Byb3RvLmgKaW5kZXggZjVhZGNiOGVhMDRkLi44NGVjNzFiZGZhY2QgMTAwNjQ0Ci0t
LSBhL2ZzL2NpZnMvY2lmc3Byb3RvLmgKKysrIGIvZnMvY2lmcy9jaWZzcHJvdG8uaApAQCAtNjM4
LDcgKzYzOCw3IEBAIGNpZnNfY2hhbl9pc19pZmFjZV9hY3RpdmUoc3RydWN0IGNpZnNfc2VzICpz
ZXMsCiBpbnQKIGNpZnNfY2hhbl91cGRhdGVfaWZhY2Uoc3RydWN0IGNpZnNfc2VzICpzZXMsIHN0
cnVjdCBUQ1BfU2VydmVyX0luZm8gKnNlcnZlcik7CiBpbnQKLVNNQjNfcmVxdWVzdF9pbnRlcmZh
Y2VzKGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24pOworU01C
M19yZXF1ZXN0X2ludGVyZmFjZXMoY29uc3QgdW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNf
dGNvbiAqdGNvbiwgYm9vbCBpbl9tb3VudCk7CiAKIHZvaWQgZXh0cmFjdF91bmNfaG9zdG5hbWUo
Y29uc3QgY2hhciAqdW5jLCBjb25zdCBjaGFyICoqaCwgc2l6ZV90ICpsZW4pOwogaW50IGNvcHlf
cGF0aF9uYW1lKGNoYXIgKmRzdCwgY29uc3QgY2hhciAqc3JjKTsKZGlmZiAtLWdpdCBhL2ZzL2Np
ZnMvY29ubmVjdC5jIGIvZnMvY2lmcy9jb25uZWN0LmMKaW5kZXggYWQ4MWQ3ZDQzZWFmLi45M2U1
OWIzYjM2YzcgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvY29ubmVjdC5jCisrKyBiL2ZzL2NpZnMvY29u
bmVjdC5jCkBAIC0xNTUsNyArMTU1LDcgQEAgc3RhdGljIHZvaWQgc21iMl9xdWVyeV9zZXJ2ZXJf
aW50ZXJmYWNlcyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJLyoKIAkgKiBxdWVyeSBzZXJ2
ZXIgbmV0d29yayBpbnRlcmZhY2VzLCBpbiBjYXNlIHRoZXkgY2hhbmdlCiAJICovCi0JcmMgPSBT
TUIzX3JlcXVlc3RfaW50ZXJmYWNlcygwLCB0Y29uKTsKKwlyYyA9IFNNQjNfcmVxdWVzdF9pbnRl
cmZhY2VzKDAsIHRjb24sIGZhbHNlKTsKIAlpZiAocmMpIHsKIAkJY2lmc19kYmcoRllJLCAiJXM6
IGZhaWxlZCB0byBxdWVyeSBzZXJ2ZXIgaW50ZXJmYWNlczogJWRcbiIsCiAJCQkJX19mdW5jX18s
IHJjKTsKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMm9wcy5jIGIvZnMvY2lmcy9zbWIyb3BzLmMK
aW5kZXggYzgyYjA4NzEzNDFjLi5iMGQ5MzE4ODYzMWUgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21i
Mm9wcy5jCisrKyBiL2ZzL2NpZnMvc21iMm9wcy5jCkBAIC01MTIsOCArNTEyLDcgQEAgc21iM19u
ZWdvdGlhdGVfcnNpemUoc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwgc3RydWN0IHNtYjNfZnNfY29u
dGV4dCAqY3R4KQogCiBzdGF0aWMgaW50CiBwYXJzZV9zZXJ2ZXJfaW50ZXJmYWNlcyhzdHJ1Y3Qg
bmV0d29ya19pbnRlcmZhY2VfaW5mb19pb2N0bF9yc3AgKmJ1ZiwKLQkJCXNpemVfdCBidWZfbGVu
LAotCQkJc3RydWN0IGNpZnNfc2VzICpzZXMpCisJCQlzaXplX3QgYnVmX2xlbiwgc3RydWN0IGNp
ZnNfc2VzICpzZXMsIGJvb2wgaW5fbW91bnQpCiB7CiAJc3RydWN0IG5ldHdvcmtfaW50ZXJmYWNl
X2luZm9faW9jdGxfcnNwICpwOwogCXN0cnVjdCBzb2NrYWRkcl9pbiAqYWRkcjQ7CkBAIC01NDMs
NiArNTQyLDIwIEBAIHBhcnNlX3NlcnZlcl9pbnRlcmZhY2VzKHN0cnVjdCBuZXR3b3JrX2ludGVy
ZmFjZV9pbmZvX2lvY3RsX3JzcCAqYnVmLAogCX0KIAlzcGluX3VubG9jaygmc2VzLT5pZmFjZV9s
b2NrKTsKIAorCS8qCisJICogU2FtYmEgc2VydmVyIGUuZy4gY2FuIHJldHVybiBhbiBlbXB0eSBp
bnRlcmZhY2UgbGlzdCBpbiBzb21lIGNhc2VzLAorCSAqIHdoaWNoIHdvdWxkIG9ubHkgYmUgYSBw
cm9ibGVtIGlmIHdlIHdlcmUgcmVxdWVzdGluZyBtdWx0aWNoYW5uZWwKKwkgKi8KKwlpZiAoYnl0
ZXNfbGVmdCA9PSAwKSB7CisJCS8qIGF2b2lkIHNwYW1taW5nIGxvZ3MgZXZlcnkgMTAgbWludXRl
cywgc28gbG9nIG9ubHkgaW4gbW91bnQgKi8KKwkJaWYgKChzZXMtPmNoYW5fbWF4ID4gMSkgJiYg
aW5fbW91bnQpCisJCQljaWZzX2RiZyhWRlMsCisJCQkJICJlbXB0eSBuZXR3b3JrIGludGVyZmFj
ZSBsaXN0IHJldHVybmVkIGJ5IHNlcnZlciAlc1xuIiwKKwkJCQkgc2VzLT5zZXJ2ZXItPmhvc3Ru
YW1lKTsKKwkJcmMgPSAtRUlOVkFMOworCQlnb3RvIG91dDsKKwl9CisKIAl3aGlsZSAoYnl0ZXNf
bGVmdCA+PSBzaXplb2YoKnApKSB7CiAJCW1lbXNldCgmdG1wX2lmYWNlLCAwLCBzaXplb2YodG1w
X2lmYWNlKSk7CiAJCXRtcF9pZmFjZS5zcGVlZCA9IGxlNjRfdG9fY3B1KHAtPkxpbmtTcGVlZCk7
CkBAIC02NzMsNyArNjg2LDcgQEAgcGFyc2Vfc2VydmVyX2ludGVyZmFjZXMoc3RydWN0IG5ldHdv
cmtfaW50ZXJmYWNlX2luZm9faW9jdGxfcnNwICpidWYsCiB9CiAKIGludAotU01CM19yZXF1ZXN0
X2ludGVyZmFjZXMoY29uc3QgdW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfdGNvbiAqdGNv
bikKK1NNQjNfcmVxdWVzdF9pbnRlcmZhY2VzKGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVj
dCBjaWZzX3Rjb24gKnRjb24sIGJvb2wgaW5fbW91bnQpCiB7CiAJaW50IHJjOwogCXVuc2lnbmVk
IGludCByZXRfZGF0YV9sZW4gPSAwOwpAQCAtNjkzLDcgKzcwNiw3IEBAIFNNQjNfcmVxdWVzdF9p
bnRlcmZhY2VzKGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24p
CiAJCWdvdG8gb3V0OwogCX0KIAotCXJjID0gcGFyc2Vfc2VydmVyX2ludGVyZmFjZXMob3V0X2J1
ZiwgcmV0X2RhdGFfbGVuLCBzZXMpOworCXJjID0gcGFyc2Vfc2VydmVyX2ludGVyZmFjZXMob3V0
X2J1ZiwgcmV0X2RhdGFfbGVuLCBzZXMsIGluX21vdW50KTsKIAlpZiAocmMpCiAJCWdvdG8gb3V0
OwogCkBAIC03MjksNyArNzQyLDcgQEAgc21iM19xZnNfdGNvbihjb25zdCB1bnNpZ25lZCBpbnQg
eGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAogCWlmIChyYykKIAkJcmV0dXJuOwogCi0JU01C
M19yZXF1ZXN0X2ludGVyZmFjZXMoeGlkLCB0Y29uKTsKKwlTTUIzX3JlcXVlc3RfaW50ZXJmYWNl
cyh4aWQsIHRjb24sIHRydWUgLyogY2FsbGVkIGR1cmluZyAgbW91bnQgKi8pOwogCiAJU01CMl9R
RlNfYXR0cih4aWQsIHRjb24sIGZpZC5wZXJzaXN0ZW50X2ZpZCwgZmlkLnZvbGF0aWxlX2ZpZCwK
IAkJCUZTX0FUVFJJQlVURV9JTkZPUk1BVElPTik7Ci0tIAoyLjM0LjEKCg==
--000000000000d243ec05ea28f894--

