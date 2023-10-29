Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5037DAE74
	for <lists+samba-technical@lfdr.de>; Sun, 29 Oct 2023 22:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Lg5Y1kD5Y92rjbaxAvab0mPZ03Khe3sWeYX0UWog9tg=; b=pQUSt8SzD4obltoZu1adf+/LP4
	RGk4T51/pr5rCKi/sLl3+f0MWZmDAMCKeylYsxHq1LJ4sX53H+kKlZ6szAeeWUXC8GPvQ7eQ0QSyd
	0RHKBKx6DY1I/ES37K8trOcn3FZDz1KYNUE7NaEOl72+Jn83OTpVJAPkcOXpz/kQUJKi2aGGubwzl
	2NIkF8aOJ2GAZbfDqgMW3M5N/1DSYrjVkGzI0hLLvbzJLKHS/94Qz38Pa9DfNoHuqY9i4+7w7VvjT
	yEdrm3UGsOyGm9oZ57jPA3UsD1KHH17cNtNzHTaRVAqIrW8prAbVWQHttZ/4KSJk94If8REbCNqWK
	djQ5Fjbw==;
Received: from ip6-localhost ([::1]:44188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxD5h-003RVT-L9; Sun, 29 Oct 2023 21:13:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:50224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxD5c-003RVJ-Mh
 for samba-technical@lists.samba.org; Sun, 29 Oct 2023 21:12:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507ad511315so5559174e87.0
 for <samba-technical@lists.samba.org>; Sun, 29 Oct 2023 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698613975; x=1699218775; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lg5Y1kD5Y92rjbaxAvab0mPZ03Khe3sWeYX0UWog9tg=;
 b=T0AXcgPlgorQKjvHwzjfyzYjO+QA2qcebHdQfjZiXF0vqwpXrV+pKU96Roog24Murb
 bCdwIFivwfadyPm2kCTvOEylKSqlA6XFITTCtMY68snvEW0RGCccau0KyPmO5OijpzXA
 sU+grCFaww5EiM6gEz1E1+PDBvrMsWO73vLuv6GBa37P7eQGxm5Pl9iwkWmTjLPwt7yZ
 IjsO6EOIwkrBa5fSutd3LnqdYfeWII6S8mRZf3ektAkNFx38AUBNO7wAdzSh+KemgGog
 WhPudck5gurbDQa49wztJ5GuUAAwsHxDegEI/YVEhruhED8Q2P8b66rWvdh5CrDp9q5n
 Hl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698613975; x=1699218775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lg5Y1kD5Y92rjbaxAvab0mPZ03Khe3sWeYX0UWog9tg=;
 b=ESs6XClFFBZzRxyb553VitLTd80r+SR5sSAw33d5hLqIhnQgvukUDUZkZHmwQKIHCu
 sCVBj0WgWBFyt7/jk5F9fF9BmcZ6z3HNgxdcrTesyrBfGYfqi6jyg24z+5yvsAlEl7Mv
 leGleY+2v2i5u1FKelIsL84/AkR9J/pOlpWetPmKYcPo439OVy9aqdlHYirTVLDzHJJF
 rCeHf5jsmFByIpTliM4k8lsyHV0ul1lbnaL1kdwbqPDfwlWr8ncGVMeUq5Rje8vkJw7A
 0bDOGPeaCQJNvUmVZn/QR9eifuflQMPCwxPswXw36QYs0wapYFCRN4CLcdtmCMC7BuPk
 F/EA==
X-Gm-Message-State: AOJu0Yz4o0zOjJv+fV9ucjxcNYb2clSGUFbzcUoOKIBQWLA4IhR1HVzg
 DFUiKkV3TTfUzm9NPQjPcnxKn75cDOdvbMlxAheIayP50os=
X-Google-Smtp-Source: AGHT+IFvgbYYrgbgkiMxgjfgUKXHtTaSB+VV1Cmi+Zw4zwXh1uyoMeJsW1tgHdSocLN2UUOYV52BtMk6f8aAJ/JEJYw=
X-Received: by 2002:a19:f012:0:b0:4f9:54f0:b6db with SMTP id
 p18-20020a19f012000000b004f954f0b6dbmr5316533lfc.13.1698613975106; Sun, 29
 Oct 2023 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvve4euMUqsBBqRr2VWgz7ukEZ15vZRVDO=zbzY=XhF1Q@mail.gmail.com>
 <29169963-d1c6-4972-8e68-1f24d8d2e5b9@miami.edu>
 <CAH2r5mv1phW57TErdO1jWQaUyZqiLmOEGdLDbF8RDfPwJvkPSA@mail.gmail.com>
In-Reply-To: <CAH2r5mv1phW57TErdO1jWQaUyZqiLmOEGdLDbF8RDfPwJvkPSA@mail.gmail.com>
Date: Sun, 29 Oct 2023 16:12:43 -0500
Message-ID: <CAH2r5mu2r2dQefpLxS+Le=1GLdhTVBspjC1HDa1v0p-0-prQ2g@mail.gmail.com>
Subject: Re: [PATCH][CIFS] allow creating FIFOs when "sfu" mount option
 specified
To: "Brown, James William" <jim.brown@miami.edu>
Content-Type: multipart/mixed; boundary="00000000000099454f0608e16210"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000099454f0608e16210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

updated patch attached


On Sun, Oct 29, 2023 at 4:06=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Good catch - yes that was a typo - will fix.
>
> On Fri, Oct 20, 2023 at 10:07=E2=80=AFAM Brown, James William via
> samba-technical <samba-technical@lists.samba.org> wrote:
> >
> > On 10/20/2023 12:32 AM, Steve French via samba-technical wrote:
> > > CAUTION: This email originated from outside the organization. DO NOT =
CLICK ON LINKS or OPEN ATTACHMENTS unless you know and trust the sender.
> > >
> > > mb3: fix creating FIFOs when mounting with "sfu" mount
> > >   option
> > >
> > > Fixes some xfstests including generic/564 and generic/157
> > >
> > > The "sfu" mount option can be useful for creating special files (char=
acter
> > > and block devices in particular) but could not create FIFOs. It did
> > > recognize existing empty files with the "system" attribute flag as FI=
FOs
> > > but this is too general, so to support creating FIFOs more safely use=
 a new
> > > tag (but the same length as those for char and block devices ie "Intx=
LNK"
> > > and "IntxBLK") "LnxFIFO" to indicate that the file should be treated =
as a
> > > FIFO (when mounted with the "sfu").   For some additional context not=
e that
> > > "sfu" followed the way that "Services for Unix" on Windows handled th=
ese
> > > special files (at least for character and block devices and symlinks)=
,
> > > which is different than newer Windows which can handle special files
> > > as reparse points (which isn't an option to many servers).
> > >
> > > @@ -5135,6 +5135,12 @@ smb2_make_node(unsigned int xid, struct inode =
*inode,
> > >               pdev->minor =3D cpu_to_le64(MINOR(dev));
> > >               rc =3D tcon->ses->server->ops->sync_write(xid, &fid, &i=
o_parms,
> > >                                                       &bytes_written,=
 iov, 1);
> > > +     } else if (S_ISBLK(mode)) {
> > > +             memcpy(pdev->type, "LnxFIFO", 8);
> > > +             pdev->major =3D 0;
> > > +             pdev->minor =3D 0;
> > > +             rc =3D tcon->ses->server->ops->sync_write(xid, &fid, &i=
o_parms,
> > > +                                                     &bytes_written,=
 iov, 1);
> > >       }
> > >       tcon->ses->server->ops->close(xid, tcon, &fid);
> > >       d_drop(dentry);
> > > --
> > Shouldn't "else if (S_ISBLK(mode))" be "S_ISFIFO"?
> >
> > else if (S_ISBLK(mode))
> >
> > else if (S_ISBLK(mode))
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--00000000000099454f0608e16210
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-fix-creating-FIFOs-when-mounting-with-sfu-mount.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-creating-FIFOs-when-mounting-with-sfu-mount.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lobyu29v0>
X-Attachment-Id: f_lobyu29v0

RnJvbSAwYmY5ZDkwZTU1ZGE5MTc3YmExMzc5MWY4NTZmNDhjODZkMDYzMzE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgMTkgT2N0IDIwMjMgMjM6MDE6NDkgLTA1MDAKU3ViamVjdDogW1BBVENIIDEv
NF0gc21iMzogZml4IGNyZWF0aW5nIEZJRk9zIHdoZW4gbW91bnRpbmcgd2l0aCAic2Z1IiBtb3Vu
dAogb3B0aW9uCgpGaXhlcyBzb21lIHhmc3Rlc3RzIGluY2x1ZGluZyBnZW5lcmljLzU2NCBhbmQg
Z2VuZXJpYy8xNTcKClRoZSAic2Z1IiBtb3VudCBvcHRpb24gY2FuIGJlIHVzZWZ1bCBmb3IgY3Jl
YXRpbmcgc3BlY2lhbCBmaWxlcyAoY2hhcmFjdGVyCmFuZCBibG9jayBkZXZpY2VzIGluIHBhcnRp
Y3VsYXIpIGJ1dCBjb3VsZCBub3QgY3JlYXRlIEZJRk9zLiBJdCBkaWQKcmVjb2duaXplIGV4aXN0
aW5nIGVtcHR5IGZpbGVzIHdpdGggdGhlICJzeXN0ZW0iIGF0dHJpYnV0ZSBmbGFnIGFzIEZJRk9z
CmJ1dCB0aGlzIGlzIHRvbyBnZW5lcmFsLCBzbyB0byBzdXBwb3J0IGNyZWF0aW5nIEZJRk9zIG1v
cmUgc2FmZWx5IHVzZSBhIG5ldwp0YWcgKGJ1dCB0aGUgc2FtZSBsZW5ndGggYXMgdGhvc2UgZm9y
IGNoYXIgYW5kIGJsb2NrIGRldmljZXMgaWUgIkludHhMTksiCmFuZCAiSW50eEJMSyIpICJMbnhG
SUZPIiB0byBpbmRpY2F0ZSB0aGF0IHRoZSBmaWxlIHNob3VsZCBiZSB0cmVhdGVkIGFzIGEKRklG
TyAod2hlbiBtb3VudGVkIHdpdGggdGhlICJzZnUiKS4gICBGb3Igc29tZSBhZGRpdGlvbmFsIGNv
bnRleHQgbm90ZSB0aGF0CiJzZnUiIGZvbGxvd2VkIHRoZSB3YXkgdGhhdCAiU2VydmljZXMgZm9y
IFVuaXgiIG9uIFdpbmRvd3MgaGFuZGxlZCB0aGVzZQpzcGVjaWFsIGZpbGVzIChhdCBsZWFzdCBm
b3IgY2hhcmFjdGVyIGFuZCBibG9jayBkZXZpY2VzIGFuZCBzeW1saW5rcyksCndoaWNoIGlzIGRp
ZmZlcmVudCB0aGFuIG5ld2VyIFdpbmRvd3Mgd2hpY2ggY2FuIGhhbmRsZSBzcGVjaWFsIGZpbGVz
CmFzIHJlcGFyc2UgcG9pbnRzICh3aGljaCBpc24ndCBhbiBvcHRpb24gdG8gbWFueSBzZXJ2ZXJz
KS4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5j
aCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2NpZnNwZHUuaCB8
IDIgKy0KIGZzL3NtYi9jbGllbnQvaW5vZGUuYyAgIHwgNCArKysrCiBmcy9zbWIvY2xpZW50L3Nt
YjJvcHMuYyB8IDggKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2NpZnNwZHUuaCBiL2Zz
L3NtYi9jbGllbnQvY2lmc3BkdS5oCmluZGV4IGUxNzIyMmZlYzlkMi4uYTc1MjIwZGI1YzFlIDEw
MDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2NpZnNwZHUuaAorKysgYi9mcy9zbWIvY2xpZW50L2Np
ZnNwZHUuaApAQCAtMjU3MCw3ICsyNTcwLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogCiAKIHN0cnVj
dCB3aW5fZGV2IHsKLQl1bnNpZ25lZCBjaGFyIHR5cGVbOF07IC8qIEludHhDSFIgb3IgSW50eEJM
SyAqLworCXVuc2lnbmVkIGNoYXIgdHlwZVs4XTsgLyogSW50eENIUiBvciBJbnR4QkxLIG9yIExu
eEZJRk8qLwogCV9fbGU2NCBtYWpvcjsKIAlfX2xlNjQgbWlub3I7CiB9IF9fYXR0cmlidXRlX18o
KHBhY2tlZCkpOwpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9pbm9kZS5jIGIvZnMvc21iL2Ns
aWVudC9pbm9kZS5jCmluZGV4IGQ3YzMwMjQ0MmMxZS4uYzAzYTI4NmVkNDE4IDEwMDY0NAotLS0g
YS9mcy9zbWIvY2xpZW50L2lub2RlLmMKKysrIGIvZnMvc21iL2NsaWVudC9pbm9kZS5jCkBAIC01
OTIsNiArNTkyLDEwIEBAIGNpZnNfc2Z1X3R5cGUoc3RydWN0IGNpZnNfZmF0dHIgKmZhdHRyLCBj
b25zdCBjaGFyICpwYXRoLAogCQkJY2lmc19kYmcoRllJLCAiU3ltbGlua1xuIik7CiAJCQlmYXR0
ci0+Y2ZfbW9kZSB8PSBTX0lGTE5LOwogCQkJZmF0dHItPmNmX2R0eXBlID0gRFRfTE5LOworCQl9
IGVsc2UgaWYgKG1lbWNtcCgiTG54RklGTyIsIHBidWYsIDgpID09IDApIHsKKwkJCWNpZnNfZGJn
KEZZSSwgIkZJRk9cbiIpOworCQkJZmF0dHItPmNmX21vZGUgfD0gU19JRklGTzsKKwkJCWZhdHRy
LT5jZl9kdHlwZSA9IERUX0ZJRk87CiAJCX0gZWxzZSB7CiAJCQlmYXR0ci0+Y2ZfbW9kZSB8PSBT
X0lGUkVHOyAvKiBmaWxlPyAqLwogCQkJZmF0dHItPmNmX2R0eXBlID0gRFRfUkVHOwpkaWZmIC0t
Z2l0IGEvZnMvc21iL2NsaWVudC9zbWIyb3BzLmMgYi9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYwpp
bmRleCA5YWVlY2VlNmI5MWIuLjI4OTg1ZGM4MWMwOSAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVu
dC9zbWIyb3BzLmMKKysrIGIvZnMvc21iL2NsaWVudC9zbWIyb3BzLmMKQEAgLTUwODcsNyArNTA4
Nyw3IEBAIHNtYjJfbWFrZV9ub2RlKHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBpbm9kZSAqaW5v
ZGUsCiAJICogb3ZlciBTTUIyL1NNQjMgYW5kIFNhbWJhIHdpbGwgZG8gdGhpcyB3aXRoIFNNQjMu
MS4xIFBPU0lYIEV4dGVuc2lvbnMKIAkgKi8KIAotCWlmICghU19JU0NIUihtb2RlKSAmJiAhU19J
U0JMSyhtb2RlKSkKKwlpZiAoIVNfSVNDSFIobW9kZSkgJiYgIVNfSVNCTEsobW9kZSkgJiYgIVNf
SVNGSUZPKG1vZGUpKQogCQlyZXR1cm4gcmM7CiAKIAljaWZzX2RiZyhGWUksICJzZnUgY29tcGF0
IGNyZWF0ZSBzcGVjaWFsIGZpbGVcbiIpOwpAQCAtNTEzNSw2ICs1MTM1LDEyIEBAIHNtYjJfbWFr
ZV9ub2RlKHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBpbm9kZSAqaW5vZGUsCiAJCXBkZXYtPm1p
bm9yID0gY3B1X3RvX2xlNjQoTUlOT1IoZGV2KSk7CiAJCXJjID0gdGNvbi0+c2VzLT5zZXJ2ZXIt
Pm9wcy0+c3luY193cml0ZSh4aWQsICZmaWQsICZpb19wYXJtcywKIAkJCQkJCQkmYnl0ZXNfd3Jp
dHRlbiwgaW92LCAxKTsKKwl9IGVsc2UgaWYgKFNfSVNGSUZPKG1vZGUpKSB7CisJCW1lbWNweShw
ZGV2LT50eXBlLCAiTG54RklGTyIsIDgpOworCQlwZGV2LT5tYWpvciA9IDA7CisJCXBkZXYtPm1p
bm9yID0gMDsKKwkJcmMgPSB0Y29uLT5zZXMtPnNlcnZlci0+b3BzLT5zeW5jX3dyaXRlKHhpZCwg
JmZpZCwgJmlvX3Bhcm1zLAorCQkJCQkJCSZieXRlc193cml0dGVuLCBpb3YsIDEpOwogCX0KIAl0
Y29uLT5zZXMtPnNlcnZlci0+b3BzLT5jbG9zZSh4aWQsIHRjb24sICZmaWQpOwogCWRfZHJvcChk
ZW50cnkpOwotLSAKMi4zOS4yCgo=
--00000000000099454f0608e16210--

