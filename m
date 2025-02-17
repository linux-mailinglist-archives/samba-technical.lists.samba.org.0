Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D33A37A8A
	for <lists+samba-technical@lfdr.de>; Mon, 17 Feb 2025 05:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AAnCoc/ealkT3eEmQbJGFEG9pfRpmLAEj8exnbx1OaU=; b=daDRqvhNNJgn0h0G0HqQ8aTPFF
	/z+UcdXhhFx76+ps6E2EEuC8IS2+4rl3K5qg240Oc2Q+ir3doqxbpJe3FvYb9VBoVnMEmMN6iqPT4
	miVfasEtppfc834BF2f9wXe96uH+hmseP5UKX6OW/VlIQcCoV1Nf77Nnj24DRU4sH1uVFts+GWwAb
	1D/PwOC8z3y0mkR6ABikjf6GJJlQ+OVhD7lXVzPPnhTBNjtcnUPzePN4D7YfmtE8v62bDWu5s96rw
	7flXDa5AZaOod786wQvdNmcsZBCcnKfJiW8oBpNdfheUSOZaqCrTeY2b+Mv7CaYOsybnWN84TcPso
	5NOfID/A==;
Received: from ip6-localhost ([::1]:29066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tjsip-00CZyl-1T; Mon, 17 Feb 2025 04:27:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:59545) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tjsik-00CZye-ML
 for samba-technical@lists.samba.org; Mon, 17 Feb 2025 04:27:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5453153782aso1427427e87.2
 for <samba-technical@lists.samba.org>; Sun, 16 Feb 2025 20:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739766409; x=1740371209; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AAnCoc/ealkT3eEmQbJGFEG9pfRpmLAEj8exnbx1OaU=;
 b=apkvN8sYe1mlV4l22ZDl9q/jWPHRen+JrFiTEzUhRoOrpAsymoifXnMtNcDb06hxRn
 ZcUs34dUcaT85mB0yhqcsW/D+7Hlmr4tj91+1mVwXRiJvf95+FYvIbvaVmv6YsiSr6X6
 Ap/kI+iUEg3yHahpZMEHH1LvefOzsacjyTMmgsB7FfYQdXMkk8OiMrSTNcVzQ+jddwpZ
 3wDqTEr0JNy/xESuMKwe3bIGsG/1O0xtL+/KGovBcPQcyl6ULVGTu+bfuxv5lCKjUYbn
 cc06UD2+jdYTPCMO6bB6qBletMak23f73sm3GM8hW+8RO2C2HB6b8mtBSIGdvtEwb568
 GPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739766409; x=1740371209;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AAnCoc/ealkT3eEmQbJGFEG9pfRpmLAEj8exnbx1OaU=;
 b=hlmUvQdPd/4X6nJdAXAfL6zpBKkHfcqHSSfRS07zuyE4FMnFpFIjT/m2UWWCpd2vVt
 ollzSlI3T7GaRQGvK7vv/mb0IGiTchOirMWuYmSMRdCl07goSDuZDjgXxnplRDWkdC77
 B9fbF6445DBWtgRqQOd0w3WwfQ18WGxU9R3Ii9DXJqwd8p3lMj3pC7OUsbWftMjRWvg6
 w/2viTO8XRYnXTXhtqR5r+3NySh5ayZvabZQHe7MWom2rptk8r9FC/Qkq/hpjgwROcZF
 +gF6Afiro80Hn2cbFkambnqsSrcdGTwHRnvU8M9PRGh7gmhBd1laZ0ueZdlU1PjVLagJ
 m3DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTCuscfpM0VO6ZMjJCLmI/0MkUyjVvo14gfHYtjh9ie+AjZLMiplBdULYCJ1dtWsp7ja2meeT/p6P4C1u/gQk=@lists.samba.org
X-Gm-Message-State: AOJu0Yzu/xYkK7KlRNw7L/xoWqCswPnUKk8TCityFYlKZQ+Kltjv96Y2
 /Ioknp18gmu+q98I08PfOriaZYmTwOOYbSuAdQHdLs8jd2V1T83L6jG5RiTSzL7+3O8f1S9cUH7
 RyfaMvPOrN/L8TLuRaVRG9kNWlDw=
X-Gm-Gg: ASbGnctIAFBDfxLHPhZrIrsP8LJ5wtFyrjeHM8t2jeExdrXqTm8tU5MLlm2WBDqGHk8
 xb57zgHYoDa/JKWWaQfr6jrh3ENy8xgg2e/FJE1aVS85nO4YoxTNEUmkN8fD2bOPqVqZKlCgjyg
 eknrua6gi32dzJca/0ufijM4WT5gHF8os=
X-Google-Smtp-Source: AGHT+IFh+DGORDLqNcQMLOJ8ut4vThStw/QPnw/VLePjL6L8sO676dwFaZ0tfkraDhJ++E2q+VHoB87YU3EvuHjcWpA=
X-Received: by 2002:a05:6512:34cd:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-5453037a749mr1845577e87.13.1739766408625; Sun, 16 Feb 2025
 20:26:48 -0800 (PST)
MIME-Version: 1.0
References: <CAPhCUnV5ocw5HfW+jNRaRPgntoM4uXeHNcC03XL00wLZjSm1Vw@mail.gmail.com>
In-Reply-To: <CAPhCUnV5ocw5HfW+jNRaRPgntoM4uXeHNcC03XL00wLZjSm1Vw@mail.gmail.com>
Date: Sun, 16 Feb 2025 22:26:36 -0600
X-Gm-Features: AWEUYZmefMo6Pfyz08OXuz6lmMAMKGswFgrp6gcNOSABsqTsrunyD2lzwkVt4SY
Message-ID: <CAH2r5muHVDfWM6vmRx85S2zfgh6v7mjc-ekOpkqJaLFvV9x1mA@mail.gmail.com>
Subject: Re: Bug in getting file attributes with SMB3.1.1 and posix
To: Oleh Nykyforchyn <oleh.nyk@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000c75c81062e4eeef6"
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
Cc: linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000c75c81062e4eeef6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oleh,
Good catch, and sorry about the delay (email had gotten missed).

Here is a fix (see attached) for the problem you reported.  Let me
know if it also works for you or if you see any problems with it.

This is important fix for SMB3.1.1 POSIX Extensions client implementation.


On Wed, Jan 1, 2025 at 11:05=E2=80=AFAM Oleh Nykyforchyn <oleh.nyk@gmail.co=
m> wrote:
>
> Hello,
>
> I encountered a funny bug when a share is mounted with vers=3D3.1.1, posi=
x,... If a file size has bits 0x410 =3D ATTR_DIRECTORY | ATTR_REPARSE =3D 1=
040 set, then the file is regarded as a directory and its open fails. A sim=
plest test example is any file 1040 bytes long.
>
> The cause of this bug is that Attributes field in smb2_file_all_info stru=
ct occupies the same place that EndOfFile field in smb311_posix_qinfo, and =
sometimes the latter struct is incorrectly processed as if it was the first=
 one. I attach an example patch that solves the problem for me, obviously n=
ot ready for submission, but just to show which places in the code are subj=
ect to problems. The patch is against linux-6.12.6 kernel, but, AFAICS, not=
hing has changed since then in relevant places. If I have guessed more or l=
ess correctly what the intended functionality is, please feel free to use m=
y patch as a basis for corrections.
>
> Best regards
>
> Olen Nykyforchyn



--=20
Thanks,

Steve

--000000000000c75c81062e4eeef6
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb311-failure-to-open-files-of-length-1040-when-mou.patch"
Content-Disposition: attachment; 
	filename="0001-smb311-failure-to-open-files-of-length-1040-when-mou.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m78jyr6y0>
X-Attachment-Id: f_m78jyr6y0

RnJvbSA1NDBiMGViZDE3NmFkMzQyNjQ0Nzk4OTQ3MTUzYWVkMzVkNWI5Y2FiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMTYgRmViIDIwMjUgMjI6MTc6NTQgLTA2MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzMTE6IGZhaWx1cmUgdG8gb3BlbiBmaWxlcyBvZiBsZW5ndGggMTA0MCB3aGVuIG1vdW50aW5n
CiB3aXRoIFNNQjMuMS4xIFBPU0lYIGV4dGVuc2lvbnMKCklmIGEgZmlsZSBzaXplIGhhcyBiaXRz
IDB4NDEwID0gQVRUUl9ESVJFQ1RPUlkgfCBBVFRSX1JFUEFSU0Ugc2V0CnRoZW4gZHVyaW5nIHF1
ZXJ5aW5mbyAoc3RhdCkgdGhlIGZpbGUgaXMgcmVnYXJkZWQgYXMgYSBkaXJlY3RvcnkKYW5kIHN1
YnNlcXVlbnQgb3BlbnMgY2FuIGZhaWwuIEEgc2ltcGxlIHRlc3QgZXhhbXBsZSBpcyB0cnlpbmcK
dG8gb3BlbiBhbnkgZmlsZSAxMDQwIGJ5dGVzIGxvbmcgd2hlbiBtb3VudGluZyB3aXRoICJwb3Np
eCIKKFNNQjMuMS4xIFBPU0lYL0xpbnV4IEV4dGVuc2lvbnMpLgoKVGhlIGNhdXNlIG9mIHRoaXMg
YnVnIGlzIHRoYXQgQXR0cmlidXRlcyBmaWVsZCBpbiBzbWIyX2ZpbGVfYWxsX2luZm8Kc3RydWN0
IG9jY3VwaWVzIHRoZSBzYW1lIHBsYWNlIHRoYXQgRW5kT2ZGaWxlIGZpZWxkIGluCnNtYjMxMV9w
b3NpeF9xaW5mbywgYW5kIHNvbWV0aW1lcyB0aGUgbGF0dGVyIHN0cnVjdCBpcyBpbmNvcnJlY3Rs
eQpwcm9jZXNzZWQgYXMgaWYgaXQgd2FzIHRoZSBmaXJzdCBvbmUuCgpSZXBvcnRlZC1ieTogT2xl
aCBOeWt5Zm9yY2h5biA8b2xlaC5ueWtAZ21haWwuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
Ci0tLQogZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oICB8ICAxICsKIGZzL3NtYi9jbGllbnQvcmVw
YXJzZS5oICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBmcy9zbWIvY2xpZW50
L3NtYjJpbm9kZS5jIHwgIDQgKysrKwogZnMvc21iL2NsaWVudC9zbWIyb3BzLmMgICB8ICAzICsr
LQogNCBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY2lmc2dsb2IuaCBiL2ZzL3NtYi9jbGllbnQvY2lmc2ds
b2IuaAppbmRleCBhYzFmODkwYTBkNTQuLmZjYzVkOTVlZDJjZCAxMDA2NDQKLS0tIGEvZnMvc21i
L2NsaWVudC9jaWZzZ2xvYi5oCisrKyBiL2ZzL3NtYi9jbGllbnQvY2lmc2dsb2IuaApAQCAtMjUz
LDYgKzI1Myw3IEBAIHN0cnVjdCBjaWZzX2NyZWQgewogc3RydWN0IGNpZnNfb3Blbl9pbmZvX2Rh
dGEgewogCWJvb2wgYWRqdXN0X3R6OwogCWJvb2wgcmVwYXJzZV9wb2ludDsKKwlib29sIGNvbnRh
aW5zX3Bvc2l4X2ZpbGVfaW5mbzsKIAlzdHJ1Y3QgewogCQkvKiBpb2N0bCByZXNwb25zZSBidWZm
ZXIgKi8KIAkJc3RydWN0IHsKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvcmVwYXJzZS5oIGIv
ZnMvc21iL2NsaWVudC9yZXBhcnNlLmgKaW5kZXggNWE3NTNmZWM3ZTJjLi5jMGJlNWFiNDVhNzgg
MTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvcmVwYXJzZS5oCisrKyBiL2ZzL3NtYi9jbGllbnQv
cmVwYXJzZS5oCkBAIC05OSwxNCArOTksMzAgQEAgc3RhdGljIGlubGluZSBib29sIHJlcGFyc2Vf
aW5vZGVfbWF0Y2goc3RydWN0IGlub2RlICppbm9kZSwKIAogc3RhdGljIGlubGluZSBib29sIGNp
ZnNfb3Blbl9kYXRhX3JlcGFyc2Uoc3RydWN0IGNpZnNfb3Blbl9pbmZvX2RhdGEgKmRhdGEpCiB7
Ci0Jc3RydWN0IHNtYjJfZmlsZV9hbGxfaW5mbyAqZmkgPSAmZGF0YS0+Zmk7Ci0JdTMyIGF0dHJz
ID0gbGUzMl90b19jcHUoZmktPkF0dHJpYnV0ZXMpOworCXUzMiBhdHRyczsKIAlib29sIHJldDsK
IAotCXJldCA9IGRhdGEtPnJlcGFyc2VfcG9pbnQgfHwgKGF0dHJzICYgQVRUUl9SRVBBUlNFKTsK
LQlpZiAocmV0KQotCQlhdHRycyB8PSBBVFRSX1JFUEFSU0U7Ci0JZmktPkF0dHJpYnV0ZXMgPSBj
cHVfdG9fbGUzMihhdHRycyk7CisJaWYgKGRhdGEtPmNvbnRhaW5zX3Bvc2l4X2ZpbGVfaW5mbykg
eworCQlzdHJ1Y3Qgc21iMzExX3Bvc2l4X3FpbmZvICpmaSA9ICZkYXRhLT5wb3NpeF9maTsKKwor
CQlhdHRycyA9IGxlMzJfdG9fY3B1KGZpLT5Eb3NBdHRyaWJ1dGVzKTsKKwkJaWYgKGRhdGEtPnJl
cGFyc2VfcG9pbnQpIHsKKwkJCWF0dHJzIHw9IEFUVFJfUkVQQVJTRTsKKwkJCWZpLT5Eb3NBdHRy
aWJ1dGVzID0gY3B1X3RvX2xlMzIoYXR0cnMpOworCQl9CisKKwl9IGVsc2UgeworCQlzdHJ1Y3Qg
c21iMl9maWxlX2FsbF9pbmZvICpmaSA9ICZkYXRhLT5maTsKKworCQlhdHRycyA9IGxlMzJfdG9f
Y3B1KGZpLT5BdHRyaWJ1dGVzKTsKKwkJaWYgKGRhdGEtPnJlcGFyc2VfcG9pbnQpIHsKKwkJCWF0
dHJzIHw9IEFUVFJfUkVQQVJTRTsKKwkJCWZpLT5BdHRyaWJ1dGVzID0gY3B1X3RvX2xlMzIoYXR0
cnMpOworCQl9CisJfQorCisJcmV0ID0gYXR0cnMgJiBBVFRSX1JFUEFSU0U7CisKIAlyZXR1cm4g
cmV0OwogfQogCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L3NtYjJpbm9kZS5jIGIvZnMvc21i
L2NsaWVudC9zbWIyaW5vZGUuYwppbmRleCA1ZGZiMzBiMGE4NTIuLjgyNmI1N2E1YTJhOCAxMDA2
NDQKLS0tIGEvZnMvc21iL2NsaWVudC9zbWIyaW5vZGUuYworKysgYi9mcy9zbWIvY2xpZW50L3Nt
YjJpbm9kZS5jCkBAIC02NTAsNiArNjUwLDcgQEAgc3RhdGljIGludCBzbWIyX2NvbXBvdW5kX29w
KGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sCiAJCXN3aXRj
aCAoY21kc1tpXSkgewogCQljYXNlIFNNQjJfT1BfUVVFUllfSU5GTzoKIAkJCWlkYXRhID0gaW5f
aW92W2ldLmlvdl9iYXNlOworCQkJaWRhdGEtPmNvbnRhaW5zX3Bvc2l4X2ZpbGVfaW5mbyA9IGZh
bHNlOwogCQkJaWYgKHJjID09IDAgJiYgY2ZpbGUgJiYgY2ZpbGUtPnN5bWxpbmtfdGFyZ2V0KSB7
CiAJCQkJaWRhdGEtPnN5bWxpbmtfdGFyZ2V0ID0ga3N0cmR1cChjZmlsZS0+c3ltbGlua190YXJn
ZXQsIEdGUF9LRVJORUwpOwogCQkJCWlmICghaWRhdGEtPnN5bWxpbmtfdGFyZ2V0KQpAQCAtNjcz
LDYgKzY3NCw3IEBAIHN0YXRpYyBpbnQgc21iMl9jb21wb3VuZF9vcChjb25zdCB1bnNpZ25lZCBp
bnQgeGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAogCQkJYnJlYWs7CiAJCWNhc2UgU01CMl9P
UF9QT1NJWF9RVUVSWV9JTkZPOgogCQkJaWRhdGEgPSBpbl9pb3ZbaV0uaW92X2Jhc2U7CisJCQlp
ZGF0YS0+Y29udGFpbnNfcG9zaXhfZmlsZV9pbmZvID0gdHJ1ZTsKIAkJCWlmIChyYyA9PSAwICYm
IGNmaWxlICYmIGNmaWxlLT5zeW1saW5rX3RhcmdldCkgewogCQkJCWlkYXRhLT5zeW1saW5rX3Rh
cmdldCA9IGtzdHJkdXAoY2ZpbGUtPnN5bWxpbmtfdGFyZ2V0LCBHRlBfS0VSTkVMKTsKIAkJCQlp
ZiAoIWlkYXRhLT5zeW1saW5rX3RhcmdldCkKQEAgLTc3MCw2ICs3NzIsNyBAQCBzdGF0aWMgaW50
IHNtYjJfY29tcG91bmRfb3AoY29uc3QgdW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfdGNv
biAqdGNvbiwKIAkJCQlpZGF0YSA9IGluX2lvdltpXS5pb3ZfYmFzZTsKIAkJCQlpZGF0YS0+cmVw
YXJzZS5pby5pb3YgPSAqaW92OwogCQkJCWlkYXRhLT5yZXBhcnNlLmlvLmJ1ZnR5cGUgPSByZXNw
X2J1ZnR5cGVbaSArIDFdOworCQkJCWlkYXRhLT5jb250YWluc19wb3NpeF9maWxlX2luZm8gPSBm
YWxzZTsgLyogQkIgVkVSSUZZICovCiAJCQkJcmJ1ZiA9IHJlcGFyc2VfYnVmX3B0cihpb3YpOwog
CQkJCWlmIChJU19FUlIocmJ1ZikpIHsKIAkJCQkJcmMgPSBQVFJfRVJSKHJidWYpOwpAQCAtNzkx
LDYgKzc5NCw3IEBAIHN0YXRpYyBpbnQgc21iMl9jb21wb3VuZF9vcChjb25zdCB1bnNpZ25lZCBp
bnQgeGlkLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29uLAogCQljYXNlIFNNQjJfT1BfUVVFUllfV1NM
X0VBOgogCQkJaWYgKCFyYykgewogCQkJCWlkYXRhID0gaW5faW92W2ldLmlvdl9iYXNlOworCQkJ
CWlkYXRhLT5jb250YWluc19wb3NpeF9maWxlX2luZm8gPSBmYWxzZTsKIAkJCQlxaV9yc3AgPSBy
c3BfaW92W2kgKyAxXS5pb3ZfYmFzZTsKIAkJCQlkYXRhWzBdID0gKHU4ICopcWlfcnNwICsgbGUx
Nl90b19jcHUocWlfcnNwLT5PdXRwdXRCdWZmZXJPZmZzZXQpOwogCQkJCXNpemVbMF0gPSBsZTMy
X3RvX2NwdShxaV9yc3AtPk91dHB1dEJ1ZmZlckxlbmd0aCk7CmRpZmYgLS1naXQgYS9mcy9zbWIv
Y2xpZW50L3NtYjJvcHMuYyBiL2ZzL3NtYi9jbGllbnQvc21iMm9wcy5jCmluZGV4IGVjMzZiZWQ1
NGIwYi4uMjNlMGM4YmU3ZmI1IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYwor
KysgYi9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYwpAQCAtMTAwMSw2ICsxMDAxLDcgQEAgc3RhdGlj
IGludCBzbWIyX3F1ZXJ5X2ZpbGVfaW5mbyhjb25zdCB1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3Qg
Y2lmc190Y29uICp0Y29uLAogCQlpZiAoIWRhdGEtPnN5bWxpbmtfdGFyZ2V0KQogCQkJcmV0dXJu
IC1FTk9NRU07CiAJfQorCWRhdGEtPmNvbnRhaW5zX3Bvc2l4X2ZpbGVfaW5mbyA9IGZhbHNlOwog
CXJldHVybiBTTUIyX3F1ZXJ5X2luZm8oeGlkLCB0Y29uLCBmaWQtPnBlcnNpc3RlbnRfZmlkLCBm
aWQtPnZvbGF0aWxlX2ZpZCwgJmRhdGEtPmZpKTsKIH0KIApAQCAtNTE0Niw3ICs1MTQ3LDcgQEAg
aW50IF9fY2lmc19zZnVfbWFrZV9ub2RlKHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBpbm9kZSAq
aW5vZGUsCiAJCQkgICAgIEZJTEVfQ1JFQVRFLCBDUkVBVEVfTk9UX0RJUiB8CiAJCQkgICAgIENS
RUFURV9PUFRJT05fU1BFQ0lBTCwgQUNMX05PX01PREUpOwogCW9wYXJtcy5maWQgPSAmZmlkOwot
CisJaWRhdGEuY29udGFpbnNfcG9zaXhfZmlsZV9pbmZvID0gZmFsc2U7CiAJcmMgPSBzZXJ2ZXIt
Pm9wcy0+b3Blbih4aWQsICZvcGFybXMsICZvcGxvY2ssICZpZGF0YSk7CiAJaWYgKHJjKQogCQln
b3RvIG91dDsKLS0gCjIuNDMuMAoK
--000000000000c75c81062e4eeef6--

